// Vercel serverless function that fetches the ESPN leaderboard and returns
// formatted player scores. Called by the frontend every 5 minutes.
//
// GET /api/scores
//
// Returns: { players: { [slug]: { name, r1, r2, r3, r4, thru, toPar, status, pos } }, currentRound, status }

const ESPN_SCOREBOARD =
  'https://site.api.espn.com/apis/site/v2/sports/golf/pga/scoreboard';

function slugify(name) {
  return name
    .toLowerCase()
    .normalize('NFD')
    .replace(/[\u0300-\u036f]/g, '') // strip accents
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/(^-|-$)/g, '');
}

export default async function handler(req, res) {
  // Allow CORS for local dev
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Cache-Control', 's-maxage=60, stale-while-revalidate=120');

  try {
    const espnRes = await fetch(ESPN_SCOREBOARD);
    if (!espnRes.ok) {
      throw new Error(`ESPN API returned ${espnRes.status}`);
    }

    const data = await espnRes.json();

    // Find The Masters event (or fall back to the first event)
    const events = data.events || [];
    let event = events.find(
      (e) => e.name && e.name.toLowerCase().includes('masters')
    );
    if (!event && events.length > 0) {
      event = events[0];
    }
    if (!event) {
      return res.status(200).json({ players: {}, currentRound: 1, status: 'Scheduled' });
    }

    const competition = event.competitions?.[0];
    if (!competition) {
      return res.status(200).json({ players: {}, currentRound: 1, status: 'Scheduled' });
    }

    // Determine current round and tournament status
    const statusDetail = event.status?.type?.detail || '';
    const statusState = event.status?.type?.state || 'pre'; // pre, in, post
    let currentRound = 1;
    let tournamentStatus = 'Scheduled';

    if (statusState === 'post') {
      currentRound = 4;
      tournamentStatus = 'Complete';
    } else if (statusState === 'in') {
      tournamentStatus = 'In Progress';
      // Try to extract round number from status detail like "Round 3 - In Progress"
      const roundMatch = statusDetail.match(/Round\s+(\d)/i);
      if (roundMatch) {
        currentRound = parseInt(roundMatch[1], 10);
      }
    }

    // Parse competitors
    const players = {};
    const competitors = competition.competitors || [];

    for (const c of competitors) {
      const athlete = c.athlete || {};
      const name = athlete.displayName || athlete.shortName || 'Unknown';
      const slug = slugify(name);

      // Round scores from linescores
      const linescores = c.linescores || [];
      const r1 = linescores[0]?.value ?? null;
      const r2 = linescores[1]?.value ?? null;
      const r3 = linescores[2]?.value ?? null;
      const r4 = linescores[3]?.value ?? null;

      // Player status
      const playerStatus = c.status?.type?.name || 'active';
      let status = 'active';
      if (playerStatus === 'cut') status = 'cut';
      else if (playerStatus === 'wd' || playerStatus === 'withdrawn') status = 'wd';

      // Position
      const pos = c.status?.position?.displayName || c.status?.displayValue || '';

      // In-progress round info
      let thru = null;
      let toPar = null;

      // ESPN provides thru and current round score for in-progress players
      if (c.status?.thru != null && c.status?.thru > 0 && c.status?.thru < 18) {
        thru = c.status.thru;
      }

      // Score (relative to par for current round)
      if (thru != null) {
        // Player is on the course — compute current round toPar from their
        // overall score minus completed round scores
        const overallToPar = typeof c.score?.value === 'number'
          ? c.score.value
          : null;
        if (overallToPar != null) {
          const completedStrokes = (r1 || 0) + (r2 || 0) + (r3 || 0) + (r4 || 0);
          const completedPar = [r1, r2, r3, r4].filter((v) => v != null).length * 72;
          toPar = overallToPar - (completedStrokes - completedPar);
        }
      }

      players[slug] = {
        name,
        r1: r1 != null ? Math.round(r1) : null,
        r2: r2 != null ? Math.round(r2) : null,
        r3: r3 != null ? Math.round(r3) : null,
        r4: r4 != null ? Math.round(r4) : null,
        thru,
        toPar,
        status,
        pos,
        espnId: String(athlete.id || ''),
      };
    }

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
