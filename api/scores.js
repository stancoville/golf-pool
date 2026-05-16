// Vercel serverless function — fetches the ESPN leaderboard and returns
// formatted player scores for the frontend.
//
// GET /api/scores

import { createClient } from '@supabase/supabase-js';

const ESPN_SCOREBOARD =
  'https://site.api.espn.com/apis/site/v2/sports/golf/pga/scoreboard';

// Lightweight supabase client to look up the active tournament's espn_id
const supabaseUrl = process.env.VITE_SUPABASE_URL;
const supabaseKey = process.env.VITE_SUPABASE_ANON_KEY;
const supabase =
  supabaseUrl && supabaseKey ? createClient(supabaseUrl, supabaseKey) : null;

function slugify(name) {
  return name
    .toLowerCase()
    .normalize('NFD')
    .replace(/[\u0300-\u036f]/g, '')
    // Handle Nordic characters that NFD doesn't decompose
    .replace(/ø/g, 'o')
    .replace(/æ/g, 'ae')
    .replace(/ð/g, 'd')
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/(^-|-$)/g, '');
}

// Known name differences between ESPN and common pool spreadsheets.
// Maps ESPN slug → additional alias slugs so the frontend can match either.
const ESPN_ALIASES = {
  'alex-noren': ['alexander-noren'],
  'haotong-li': ['hao-tong-li'],
  'johnny-keefer': ['john-keefer'],
  'matt-mccarty': ['matthew-mccarty'],
  'nico-echavarria': ['nicolas-echavarria'],
  'angel-cabrera': ['angel-cabrera'],
};

/** Parse a toPar displayValue like "-2", "E", "+3" into a number. */
function parseToPar(str) {
  if (!str || str === '-') return null;
  if (str === 'E') return 0;
  return parseInt(str, 10);
}

/**
 * Extract the time portion from an ESPN tee time string like
 * "Sun Apr 12 14:25:00 PDT 2026". Returns "2:25 PM" without
 * any timezone conversion — the time is already in tournament-local.
 */
function formatTeeTime(raw) {
  if (!raw) return null;
  const m = raw.match(/(\d{1,2}):(\d{2}):\d{2}\s/);
  if (!m) return null;
  let h = parseInt(m[1], 10);
  const min = m[2];
  const ampm = h >= 12 ? 'PM' : 'AM';
  if (h > 12) h -= 12;
  if (h === 0) h = 12;
  return `${h}:${min} ${ampm}`;
}

export default async function handler(req, res) {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Cache-Control', 's-maxage=60, stale-while-revalidate=120');

  try {
    const espnRes = await fetch(ESPN_SCOREBOARD);
    if (!espnRes.ok) throw new Error(`ESPN returned ${espnRes.status}`);
    const data = await espnRes.json();

    // Find the right event. If we have a tournament in the DB, match by espn_id.
    // Otherwise fall back to the first event in the scoreboard.
    const events = data.events || [];
    let event = null;

    if (supabase) {
      const { data: tournament } = await supabase
        .from('tournaments')
        .select('espn_id')
        .order('start_date', { ascending: false })
        .limit(1)
        .single();

      if (tournament?.espn_id) {
        event = events.find((e) => String(e.id) === String(tournament.espn_id));
      }
    }

    // Fall back to first event (covers the common case of one active tournament)
    if (!event) event = events[0];

    if (!event) {
      return res.status(200).json({ players: {}, currentRound: 1, status: 'Scheduled' });
    }

    const competition = event.competitions?.[0];
    if (!competition) {
      return res.status(200).json({ players: {}, currentRound: 1, status: 'Scheduled' });
    }

    // Tournament status
    const statusState = event.status?.type?.state || 'pre';
    let tournamentStatus = 'Scheduled';
    if (statusState === 'post') tournamentStatus = 'Complete';
    else if (statusState === 'in') tournamentStatus = 'In Progress';

    // Determine current round: find the highest round with any real activity
    const competitors = competition.competitors || [];
    let currentRound = 1;
    for (const c of competitors) {
      const ls = c.linescores || [];
      for (let r = ls.length - 1; r >= 0; r--) {
        const period = ls[r];
        if (period.displayValue && period.displayValue !== '-') {
          currentRound = Math.max(currentRound, r + 1);
          break;
        }
        if ((period.linescores || []).length > 0) {
          currentRound = Math.max(currentRound, r + 1);
          break;
        }
      }
      if (currentRound === 4) break;
    }

    // Compute positions from sort order
    const scoreCounts = new Map();
    competitors.forEach((c, i) => {
      const sv = typeof c.score === 'object' ? c.score?.displayValue : String(c.score ?? '');
      if (!scoreCounts.has(sv)) scoreCounts.set(sv, { first: i + 1, count: 0 });
      scoreCounts.get(sv).count++;
    });

    // Parse each competitor
    const players = {};

    competitors.forEach((c, idx) => {
      const athlete = c.athlete || {};
      const name = athlete.displayName || 'Unknown';
      const slug = slugify(name);
      const ls = c.linescores || [];

      // Parse completed rounds and detect cut status
      const rounds = [null, null, null, null];
      const teeTimes = [null, null, null, null];
      let lastCompletedRound = 0;

      for (let r = 0; r < 4; r++) {
        if (r >= ls.length) continue;
        const period = ls[r];
        const disp = period.displayValue || '-';
        const val = period.value ?? 0;

        // Extract tee time from the last stat in the period's statistics
        const stats = period.statistics?.categories?.[0]?.stats;
        if (stats && stats.length > 0) {
          const raw = stats[stats.length - 1]?.displayValue || '';
          if (raw.includes('Apr') || raw.includes('20')) {
            teeTimes[r] = formatTeeTime(raw);
          }
        }

        const holesPlayed = (period.linescores || []).length;
        if (disp === '-' || (val === 0 && holesPlayed === 0)) {
          // Round not started or no data
          rounds[r] = null;
        } else if (holesPlayed >= 18) {
          // Completed round — all 18 holes have linescore entries.
          // Use linescores.length rather than a stroke-count threshold because
          // an in-progress player with a high score (e.g. 60 strokes through
          // 16 holes) would otherwise be incorrectly marked complete.
          rounds[r] = Math.round(val);
          lastCompletedRound = r + 1;
        } else {
          // In-progress round — partial strokes, not a completed score.
          rounds[r] = null;
          if (lastCompletedRound < r + 1) lastCompletedRound = r;
        }
      }

      // Detect cut: ESPN omits R3/R4 placeholders for players who missed the
      // cut. Active players have 4 linescore entries (R1–R4, even if R3/R4 are
      // empty placeholders awaiting tee-off); cut players have only 2.
      // Don't rely on rounds[2] === null — that's also true for active players
      // who haven't teed off in R3 yet.
      let status = 'active';
      if (currentRound >= 3 && ls.length < 3) {
        status = 'cut';
      }

      // In-progress round detection
      let thru = null;
      let toPar = null;
      const crIdx = currentRound - 1;
      if (status === 'active' && crIdx < ls.length) {
        const crPeriod = ls[crIdx];
        const crDisp = crPeriod.displayValue || '-';
        const crHoles = crPeriod.linescores || [];
        if (crDisp !== '-' && crHoles.length > 0 && crHoles.length < 18) {
          thru = crHoles.length;
          toPar = parseToPar(crDisp);
        }
      }

      // Overall score to par from ESPN
      const overallToPar = parseToPar(
        typeof c.score === 'object' ? c.score?.displayValue : String(c.score ?? '')
      );

      // Position from sort order
      const sv = typeof c.score === 'object' ? c.score?.displayValue : String(c.score ?? '');
      const posInfo = scoreCounts.get(sv);
      let pos = '';
      if (posInfo) {
        pos = posInfo.count > 1 ? `T${posInfo.first}` : String(posInfo.first);
      }
      // Cut players show "CUT"
      if (status === 'cut') pos = 'CUT';

      // Current-round tee time (for the round in progress on the tournament)
      const teeTime = teeTimes[crIdx] || null;

      const playerData = {
        name,
        r1: rounds[0],
        r2: rounds[1],
        r3: rounds[2],
        r4: rounds[3],
        thru,
        toPar,
        overallToPar,
        status,
        pos,
        teeTime,
        espnId: String(athlete.id || ''),
      };

      // Store under primary slug
      players[slug] = playerData;

      // Also store under alias slugs so team rosters can match
      const aliases = ESPN_ALIASES[slug] || [];
      for (const alias of aliases) {
        players[alias] = playerData;
      }
    });

    return res.status(200).json({
      players,
      currentRound,
      status: tournamentStatus,
    });
  } catch (err) {
    console.error('ESPN fetch error:', err);
    return res.status(500).json({ error: err.message });
  }
}
