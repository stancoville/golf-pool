// Scoring helpers for The Masters Pool.
//
// A team is six players. The team's "score" is the sum of every player's
// stroke total across all four rounds. Players who miss the cut or withdraw
// are charged a penalty of 80 strokes for each round they did not actually
// complete. The lowest total wins. The tiebreaker is the closest guess to
// the winner's final score relative to par.

export const PENALTY = 80;

const ROUND_KEYS = ['r1', 'r2', 'r3', 'r4'];

/**
 * Returns the four-round score array for a player, substituting the
 * 80-stroke penalty for any null round when the player is cut or withdrew.
 * Active players' future rounds remain null.
 *
 * @param {object} p - player object from PLAYERS map
 * @returns {Array<number|null>}
 */
export function playerRounds(p) {
  if (!p) return [null, null, null, null];
  const isPenalized = p.status === 'cut' || p.status === 'wd';
  return ROUND_KEYS.map((key) => {
    const v = p[key];
    if (v == null) return isPenalized ? PENALTY : null;
    return v;
  });
}

/**
 * Sum of a player's four-round score (with penalty rounds counted).
 * Active players with future null rounds will only sum what they've played.
 */
export function playerTotal(p) {
  return playerRounds(p).reduce((acc, v) => acc + (v == null ? 0 : v), 0);
}

/**
 * Number of rounds counted for the player. Cut/WD players are always
 * treated as 4 (their incomplete rounds are penalty rounds, but they
 * are still "scored"). Active players return the number of completed rounds.
 */
export function roundsPlayed(p) {
  if (!p) return 0;
  if (p.status === 'cut' || p.status === 'wd') return 4;
  return ROUND_KEYS.reduce((acc, key) => acc + (p[key] == null ? 0 : 1), 0);
}

/**
 * Sum of every team member's playerTotal.
 *
 * @param {object} team - team object from TEAMS list
 * @param {object} players - players keyed by slug
 */
export function teamScore(team, players) {
  return team.players.reduce((acc, slug) => {
    const p = players[slug];
    return acc + playerTotal(p);
  }, 0);
}

/**
 * The team's score relative to par for the rounds that have been counted.
 * For each player we add (par * roundsPlayed) to the par baseline; the
 * difference between the actual team score and that baseline is the team's
 * score relative to par.
 */
export function teamParRelative(team, players, coursePar) {
  const score = teamScore(team, players);
  const parTotal = team.players.reduce((acc, slug) => {
    const p = players[slug];
    return acc + roundsPlayed(p) * coursePar;
  }, 0);
  return score - parTotal;
}

/**
 * Format a "score relative to par" diff for display.
 * Returns { str, cls } where cls is one of 'under' | 'over' | 'even'.
 */
export function parDisplay(diff) {
  if (diff === 0 || diff == null) {
    return { str: 'E', cls: 'even' };
  }
  if (diff < 0) {
    return { str: String(diff), cls: 'under' };
  }
  return { str: `+${diff}`, cls: 'over' };
}

/**
 * Rank teams ascending by total stroke count. Ties are broken first by
 * who guessed closest to the actual winner's final score relative to par,
 * and then alphabetically. Returns the same team objects with these added
 * fields:
 *
 *   _score:         total team strokes
 *   _par:           score relative to par
 *   _tieDistance:   |tiebreaker - winnerScore| (sorted ascending on ties)
 *   rank:           1-based integer rank
 *   tied:           true if more than one team shares this stroke total
 */
export function rankTeams(teams, players, coursePar) {
  if (!Array.isArray(teams) || teams.length === 0) return [];

  // Determine the "winner score relative to par" used for tiebreakers.
  // Currently this is the leading team's par-relative score; once a real
  // tournament finishes you would substitute the actual winner's mark.
  const enriched = teams.map((t) => {
    const _score = teamScore(t, players);
    const _par = teamParRelative(t, players, coursePar);
    return { ...t, _score, _par };
  });

  const leaderPar = enriched.reduce(
    (best, t) => (best == null || t._par < best ? t._par : best),
    null
  );

  enriched.forEach((t) => {
    t._tieDistance = Math.abs((t.tiebreaker ?? 0) - (leaderPar ?? 0));
  });

  enriched.sort((a, b) => {
    if (a._score !== b._score) return a._score - b._score;
    if (a._tieDistance !== b._tieDistance) {
      return a._tieDistance - b._tieDistance;
    }
    return a.teamName.localeCompare(b.teamName);
  });

  // Assign ranks; teams with the same _score AND same _tieDistance share rank.
  let rank = 0;
  let lastKey = null;
  const counts = new Map();
  enriched.forEach((t, i) => {
    const key = `${t._score}:${t._tieDistance}`;
    if (key !== lastKey) {
      rank = i + 1;
      lastKey = key;
    }
    t.rank = rank;
    counts.set(rank, (counts.get(rank) || 0) + 1);
  });

  enriched.forEach((t) => {
    t.tied = (counts.get(t.rank) || 0) > 1;
  });

  return enriched;
}
