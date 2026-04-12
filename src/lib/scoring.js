// Scoring helpers for The Masters Pool.
//
// A team is six players. The team's "score" uses the **best four** of the
// six players' stroke totals (drop the worst two). Players who miss the cut
// or withdraw are charged a penalty of 80 strokes for each round they did
// not actually complete — but only for rounds at or before the tournament's
// current round, so missing-cut players don't get charged for rounds the
// field hasn't played yet.
//
// The headline number on every card is the team's score relative to par,
// which is also what we sort the leaderboard by. The tiebreaker is the
// closest guess to the eventual winner's final score relative to par.

export const PENALTY = 80;

const ROUND_KEYS = ['r1', 'r2', 'r3', 'r4'];

// Average par per hole at Augusta (par 72 / 18 holes). Used as a fractional
// par baseline when a player is mid-round so the in-progress strokes can be
// reasoned about consistently with completed rounds.
const PAR_PER_HOLE = 4;

/**
 * Returns the four-round score array for a player. Completed rounds return
 * the integer stroke total. Penalty rounds (cut/WD players) return 80, but
 * only for rounds whose number is <= currentRound. Future rounds remain
 * null so the field doesn't get charged for rounds that haven't started.
 *
 * @param {object} p - player object from PLAYERS map
 * @param {number} currentRound - 1..4, defaults to 4 (full tournament)
 * @returns {Array<number|null>}
 */
export function playerRounds(p, currentRound = 4) {
  if (!p) return [null, null, null, null];
  const isPenalized = p.status === 'cut' || p.status === 'wd';
  return ROUND_KEYS.map((key, idx) => {
    const v = p[key];
    if (v != null) return v;
    if (isPenalized && idx + 1 <= currentRound) return PENALTY;
    return null;
  });
}

/**
 * True when the player is actively on the course right now: their record
 * for the current round is null but their `thru` count is between 1 and 17.
 */
export function isRoundInProgress(p, currentRound) {
  if (!p) return false;
  if (p.status !== 'active') return false;
  const v = p[`r${currentRound}`];
  if (v != null) return false;
  return p.thru != null && p.thru > 0 && p.thru < 18;
}

/**
 * Approximate strokes contributed by an in-progress current round.
 * Uses par-per-hole * holes played + the player's score to par.
 */
export function inProgressStrokes(p, currentRound) {
  if (!isRoundInProgress(p, currentRound)) return 0;
  return p.thru * PAR_PER_HOLE + (p.toPar || 0);
}

/**
 * Score relative to par contributed by an in-progress current round.
 */
export function inProgressParDiff(p, currentRound) {
  if (!isRoundInProgress(p, currentRound)) return 0;
  return p.toPar || 0;
}

/**
 * Sum of a player's stroke contribution to their team — completed rounds
 * plus any in-progress strokes from the current round. Future rounds and
 * post-cut rounds are not counted.
 */
export function playerTotal(p, currentRound = 4) {
  const completed = playerRounds(p, currentRound).reduce(
    (acc, v) => acc + (v == null ? 0 : v),
    0
  );
  return completed + inProgressStrokes(p, currentRound);
}

/**
 * Number of completed rounds counted for a player. Cut/WD players cap at
 * `currentRound` (their incomplete rounds before/at the cut count as
 * penalty rounds). Active players return their actual completed round
 * count — the in-progress current round is not counted as a completed
 * round here; it is added in fractionally inside the par calculations.
 */
export function roundsPlayed(p, currentRound = 4) {
  if (!p) return 0;
  if (p.status === 'cut' || p.status === 'wd') return currentRound;
  return ROUND_KEYS.reduce(
    (acc, key) => acc + (p[key] == null ? 0 : 1),
    0
  );
}

// Number of best players counted toward the team score.
const COUNT_BEST = 4;

/**
 * Return the indices of the best COUNT_BEST players on a team, sorted by
 * ascending par-relative score. Used by teamScore, teamParRelative, and
 * the UI to decide which players are "counting".
 */
export function bestPlayerIndices(team, players, currentRound = 4, coursePar = 72) {
  const indexed = team.players.map((slug, i) => ({
    i,
    par: playerParRelative(players[slug], coursePar, currentRound),
  }));
  indexed.sort((a, b) => a.par - b.par);
  return new Set(indexed.slice(0, COUNT_BEST).map((x) => x.i));
}

/**
 * Sum of the best four players' playerTotal (best-4-of-6).
 */
export function teamScore(team, players, coursePar = 72, currentRound = 4) {
  const best = bestPlayerIndices(team, players, currentRound, coursePar);
  return team.players.reduce((acc, slug, i) => {
    if (!best.has(i)) return acc;
    return acc + playerTotal(players[slug], currentRound);
  }, 0);
}

/**
 * A single player's overall score relative to par for this pool.
 *
 * For active players we prefer ESPN's `overallToPar` because it already
 * accounts for in-progress rounds correctly. For cut/WD players we MUST
 * compute it ourselves because the pool charges 80-stroke penalties for
 * every missed round — ESPN's number only reflects the rounds they played.
 */
export function playerParRelative(p, coursePar, currentRound = 4) {
  if (!p) return 0;
  const isPenalized = p.status === 'cut' || p.status === 'wd';
  if (!isPenalized && p.overallToPar != null) return p.overallToPar;
  const rounds = playerRounds(p, currentRound);
  const played = roundsPlayed(p, currentRound);
  const completedStrokes = rounds.reduce((a, v) => a + (v == null ? 0 : v), 0);
  return completedStrokes - played * coursePar + inProgressParDiff(p, currentRound);
}

/**
 * The team's score relative to par, counting only the best four players.
 * Uses each player's overallToPar from ESPN when available.
 */
export function teamParRelative(team, players, coursePar, currentRound = 4) {
  const best = bestPlayerIndices(team, players, currentRound);
  let diff = 0;
  team.players.forEach((slug, i) => {
    if (!best.has(i)) return;
    diff += playerParRelative(players[slug], coursePar, currentRound);
  });
  return diff;
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
 * Rank teams ascending by score relative to par. Ties are broken first by
 * who guessed closest to the leader's par-relative score (proxy for the
 * eventual winner), then alphabetically by team name. Returns the same
 * team objects with these added fields:
 *
 *   _score:        total team strokes (completed + in-progress)
 *   _par:          team score relative to par (the headline number)
 *   _tieDistance:  |tiebreaker - leaderPar| (sorted ascending on ties)
 *   rank:          1-based integer rank
 *   tied:          true if more than one team shares this rank
 */
export function rankTeams(teams, players, coursePar, currentRound = 4) {
  if (!Array.isArray(teams) || teams.length === 0) return [];

  const enriched = teams.map((t) => {
    const _score = teamScore(t, players, coursePar, currentRound);
    const _par = teamParRelative(t, players, coursePar, currentRound);
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
    if (a._par !== b._par) return a._par - b._par;
    if (a._tieDistance !== b._tieDistance) {
      return a._tieDistance - b._tieDistance;
    }
    return a.teamName.localeCompare(b.teamName);
  });

  // Teams sharing the same _par share a rank (and get the "T" prefix).
  // The tiebreaker only affects display order within a tied group during play —
  // it doesn't actually break the tie until the tournament is final.
  let rank = 0;
  let lastPar = null;
  const counts = new Map();
  enriched.forEach((t, i) => {
    if (t._par !== lastPar) {
      rank = i + 1;
      lastPar = t._par;
    }
    t.rank = rank;
    counts.set(rank, (counts.get(rank) || 0) + 1);
  });

  enriched.forEach((t) => {
    t.tied = (counts.get(t.rank) || 0) > 1;
  });

  return enriched;
}
