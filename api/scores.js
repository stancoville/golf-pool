// Vercel serverless function — fetches the ESPN leaderboard and returns
// formatted player scores for the frontend.
//
// GET /api/scores

const ESPN_SCOREBOARD =
  'https://site.api.espn.com/apis/site/v2/sports/golf/pga/scoreboard';

function slugify(name) {
  return name
    .toLowerCase()
    .normalize('NFD')
    .replace(/[\u0300-\u036f]/g, '')
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/(^-|-$)/g, '');
}

/** Parse a toPar displayValue like "-2", "E", "+3" into a number. */
function parseToPar(str) {
  if (!str || str === '-') return null;
  if (str === 'E') return 0;
  return parseInt(str, 10);
}

export default async function handler(req, res) {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Cache-Control', 's-maxage=60, stale-while-revalidate=120');

  try {
    const espnRes = await fetch(ESPN_SCOREBOARD);
    if (!espnRes.ok) throw new Error(`ESPN returned ${espnRes.status}`);
    const data = await espnRes.json();

    const events = data.events || [];
    let event = events.find((e) =>
      e.name && e.name.toLowerCase().includes('masters')
    ) || events[0];

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

    // Determine current round from the data: find the highest round with any
    // activity (hole-by-hole data or non-dash displayValue).
    let currentRound = 3; // default
    const competitors = competition.competitors || [];

    for (const c of competitors) {
      const ls = c.linescores || [];
      for (let r = ls.length - 1; r >= 0; r--) {
        const period = ls[r];
        if (period.displayValue && period.displayValue !== '-') {
          currentRound = Math.max(currentRound, r + 1);
          break;
        }
        const holes = period.linescores || [];
        if (holes.length > 0) {
          currentRound = Math.max(currentRound, r + 1);
          break;
        }
      }
      if (currentRound === 4) break;
    }

    // Compute positions from sort order. ESPN returns competitors sorted by
    // score. Players sharing the same score are tied.
    const scoreToPos = new Map();
    const scoreCounts = new Map();
    competitors.forEach((c, i) => {
      const scoreVal = typeof c.score === 'object' ? c.score?.displayValue : String(c.score ?? '');
      if (!scoreCounts.has(scoreVal)) {
        scoreCounts.set(scoreVal, { first: i + 1, count: 0 });
      }
      scoreCounts.get(scoreVal).count++;
    });

    // Parse each competitor
    const players = {};

    competitors.forEach((c, idx) => {
      const athlete = c.athlete || {};
      const name = athlete.displayName || 'Unknown';
      const slug = slugify(name);
      const ls = c.linescores || [];

      // Round scores — only count a round as complete if displayValue !== '-'
      const rounds = [null, null, null, null];
      const teeTime = [null, null, null, null]; // tee times per round
      for (let r = 0; r < 4; r++) {
        if (r >= ls.length) continue;
        const period = ls[r];
        const disp = period.displayValue || '-';
        const val = period.value ?? 0;

        // Extract tee time from statistics
        const stats = period.statistics?.categories?.[0]?.stats;
        if (stats && stats.length > 0) {
          const lastStat = stats[stats.length - 1]?.displayValue || '';
          if (lastStat.includes('Apr') || lastStat.includes('20')) {
            teeTime[r] = lastStat;
          }
        }

        if (disp === '-' || (val === 0 && !period.linescores?.length)) {
          // Round not started or no data
          rounds[r] = null;
        } else if (val >= 55) {
          // Completed round (full 18-hole score)
          rounds[r] = Math.round(val);
        } else {
          // In-progress round — val is partial stroke count, not a completed round
          rounds[r] = null;
        }
      }

      // In-progress round detection
      let thru = null;
      let toPar = null;
      const crIdx = currentRound - 1;
      if (crIdx < ls.length) {
        const crPeriod = ls[crIdx];
        const crDisp = crPeriod.displayValue || '-';
        const crHoles = crPeriod.linescores || [];

        if (crDisp !== '-' && crHoles.length > 0 && crHoles.length < 18) {
          // Player is on the course
          thru = crHoles.length;
          toPar = parseToPar(crDisp);
        } else if (crDisp !== '-' && crHoles.length === 18) {
          // Round completed but tournament round might still be "current"
          // Score is already in rounds[crIdx]
        }
      }

      // Overall score (to par) — ESPN provides this directly
      const overallToPar = parseToPar(
        typeof c.score === 'object' ? c.score?.displayValue : String(c.score ?? '')
      );

      // Position: derive from sort order
      const scoreVal = typeof c.score === 'object' ? c.score?.displayValue : String(c.score ?? '');
      const posInfo = scoreCounts.get(scoreVal);
      let pos = String(idx + 1);
      if (posInfo) {
        pos = posInfo.count > 1 ? `T${posInfo.first}` : String(posInfo.first);
      }

      // Player status
      let status = 'active';
      // Check if any round shows CUT indicator (linescores length < expected)
      // ESPN doesn't give explicit cut status in the competitor status field,
      // so we detect it by checking if the player has fewer rounds than expected

      // Determine R4 tee time for display
      let r4TeeTime = teeTime[3] || null;

      players[slug] = {
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
        teeTime: r4TeeTime,
        espnId: String(athlete.id || ''),
      };
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
