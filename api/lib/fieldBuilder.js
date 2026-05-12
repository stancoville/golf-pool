// Shared logic for fetching the ESPN field, attaching odds, and writing
// tournament_players rows with tier assignments.
//
// Tier rules (set by pool admin):
//   Tiers 1–5: 15 players each, ranked by odds (lowest American price first)
//   Tier 6:    everyone else — leftover priced players + all unpriced players
//
// Falls back to pure ESPN sort order when odds coverage is too thin to fill
// the top five tiers (< 75 priced players).

import { supabaseAdmin } from './supabaseAdmin.js';
import { fetchTournamentOdds, detectSportKey } from './oddsApi.js';

const ESPN_SCOREBOARD = 'https://site.api.espn.com/apis/site/v2/sports/golf/pga/scoreboard';
const ESPN_CORE = 'https://sports.core.api.espn.com/v2/sports/golf/leagues/pga';

const TIER_SIZES = [15, 15, 15, 15, 15]; // tiers 1–5; tier 6 catches the rest
const ODDS_THRESHOLD = TIER_SIZES.reduce((a, b) => a + b, 0); // 75

function slugify(name) {
  return name
    .toLowerCase()
    .normalize('NFD')
    .replace(/[̀-ͯ]/g, '')
    .replace(/ø/g, 'o')
    .replace(/æ/g, 'ae')
    .replace(/ð/g, 'd')
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/(^-|-$)/g, '');
}

function compactDate(isoDate) {
  if (!isoDate) return null;
  return isoDate.slice(0, 10).replace(/-/g, '');
}

async function tryScoreboard(url, espnEventId) {
  try {
    const r = await fetch(url);
    if (!r.ok) return [];
    const data = await r.json();
    const event = data.events?.find((e) => String(e.id) === String(espnEventId));
    const competitors = event?.competitions?.[0]?.competitors || [];
    // Filter out any competitor whose name didn't come through.
    return competitors.filter((c) => c.athlete?.displayName);
  } catch { return []; }
}

/**
 * Fetch the field for an ESPN event, returning competitor objects with full
 * athlete data (displayName + id). Tries multiple ESPN endpoints because the
 * default scoreboard only returns the currently-active tournament; upcoming
 * majors need to be fetched by date.
 */
async function fetchEspnCompetitors(espnEventId, startDate) {
  // 1) Default scoreboard — works for the currently-active event.
  let competitors = await tryScoreboard(ESPN_SCOREBOARD, espnEventId);
  if (competitors.length > 0) return competitors;

  // 2) Scoreboard scoped to the tournament's start date (works for upcoming
  //    events whose field has been posted but isn't the live event).
  const ymd = compactDate(startDate);
  if (ymd) {
    competitors = await tryScoreboard(`${ESPN_SCOREBOARD}?dates=${ymd}`, espnEventId);
    if (competitors.length > 0) return competitors;
  }

  // 3) Direct event endpoint (sometimes returns full athlete objects inline).
  try {
    const r = await fetch(`${ESPN_SCOREBOARD}?event=${espnEventId}`);
    if (r.ok) {
      const data = await r.json();
      const event = data.events?.find((e) => String(e.id) === String(espnEventId));
      competitors = (event?.competitions?.[0]?.competitors || [])
        .filter((c) => c.athlete?.displayName);
      if (competitors.length > 0) return competitors;
    }
  } catch { /* fall through */ }

  return [];
}

async function upsertPlayer(name, espnAthleteId) {
  if (espnAthleteId) {
    const { data: byId } = await supabaseAdmin
      .from('players').select('id').eq('espn_id', espnAthleteId).maybeSingle();
    if (byId) return byId.id;

    // No ESPN-ID match — try by name. If the player exists (e.g. inserted via
    // Odds-API-only flow), backfill the ESPN ID so future refreshes match by ID.
    const { data: byName } = await supabaseAdmin
      .from('players').select('id, espn_id').ilike('name', name).maybeSingle();
    if (byName) {
      if (!byName.espn_id) {
        await supabaseAdmin.from('players').update({ espn_id: espnAthleteId }).eq('id', byName.id);
      }
      return byName.id;
    }

    const { data: inserted } = await supabaseAdmin
      .from('players').insert({ name, espn_id: espnAthleteId }).select('id').single();
    return inserted?.id;
  }

  const { data: existing } = await supabaseAdmin
    .from('players').select('id').ilike('name', name).maybeSingle();
  if (existing) return existing.id;

  const { data: inserted } = await supabaseAdmin
    .from('players').insert({ name }).select('id').single();
  return inserted?.id;
}

/**
 * Fetch the field for a tournament, attach odds, compute tiers, and write
 * tournament_players rows. Replaces any existing field for this tournament.
 *
 * Field-source priority:
 *   1. ESPN competitors + Odds API prices (best — ESPN gives athlete IDs)
 *   2. Odds API outcomes as the field (when ESPN has no field yet)
 *   3. ESPN sort order alone (when odds aren't posted)
 *
 * Returns { count, oddsCount, oddsSource, mode, message }.
 */
export async function buildAndWriteField(tournamentId, espnEventId, tournamentName, startDate) {
  const competitors = await fetchEspnCompetitors(espnEventId, startDate);
  const sportKey = detectSportKey(tournamentName);
  const oddsResult = sportKey ? await fetchTournamentOdds(sportKey) : null;

  // ---- Build the candidate player list ----
  const players = [];
  for (let i = 0; i < competitors.length; i++) {
    const c = competitors[i];
    const athlete = c.athlete || {};
    const name = athlete.displayName || '';
    if (!name) continue;
    players.push({
      name,
      espnId: String(athlete.id || ''),
      slug: slugify(name),
      espnIndex: i,
    });
  }

  // If ESPN has no field yet, fall through to The Odds API as the field source.
  let fieldFromOdds = false;
  if (players.length === 0) {
    if (!oddsResult || oddsResult.outcomes.length === 0) {
      return {
        count: 0, oddsCount: 0, oddsSource: null, mode: 'none',
        message: 'No field data from ESPN or The Odds API. Existing field (if any) was preserved. ' +
          'Try again closer to tournament start.',
      };
    }
    fieldFromOdds = true;
    for (let i = 0; i < oddsResult.outcomes.length; i++) {
      const o = oddsResult.outcomes[i];
      players.push({
        name: o.name,
        espnId: '',
        slug: o.slug,
        espnIndex: i,
        odds: o.price,
        oddsSource: oddsResult.source,
      });
    }
  }

  // ---- Decide tiering mode ----
  let mode;
  if (fieldFromOdds) {
    mode = 'odds-only';
  } else if (oddsResult && oddsResult.count >= ODDS_THRESHOLD) {
    mode = 'odds';
    for (const p of players) {
      const o = oddsResult.bySlug.get(p.slug);
      if (o) { p.odds = o.price; p.oddsSource = oddsResult.source; }
    }
  } else {
    mode = 'espn';
  }

  // ---- Sort ----
  if (mode === 'odds' || mode === 'odds-only') {
    // Priced players first, by lowest price; unpriced (ESPN-only stragglers)
    // keep their ESPN sort order at the end.
    players.sort((a, b) => {
      const aHas = a.odds != null, bHas = b.odds != null;
      if (aHas && !bHas) return -1;
      if (!aHas && bHas) return 1;
      if (aHas && bHas) return a.odds - b.odds;
      return a.espnIndex - b.espnIndex;
    });
  } else {
    players.sort((a, b) => a.espnIndex - b.espnIndex);
  }

  // ---- Assign tiers: 15/15/15/15/15/rest ----
  // In odds-aware modes, force any unpriced player into tier 6 even if they'd
  // otherwise rank into the top 75.
  let cursor = 0;
  for (let t = 0; t < TIER_SIZES.length; t++) {
    const end = Math.min(cursor + TIER_SIZES[t], players.length);
    while (cursor < end) {
      const p = players[cursor];
      if ((mode === 'odds' || mode === 'odds-only') && p.odds == null) {
        p.tier = 6;
      } else {
        p.tier = t + 1;
      }
      cursor++;
    }
  }
  while (cursor < players.length) {
    players[cursor].tier = 6;
    cursor++;
  }

  // Upsert player rows and collect IDs.
  for (const p of players) {
    p.playerId = await upsertPlayer(p.name, p.espnId);
  }

  // Wipe existing tournament_players for this tournament, then insert fresh rows.
  // Sort_order encodes the post-tier rank (1 = top of tier 1).
  await supabaseAdmin.from('tournament_players').delete().eq('tournament_id', tournamentId);

  const rows = players
    .filter((p) => p.playerId)
    .map((p, i) => ({
      tournament_id: tournamentId,
      player_id: p.playerId,
      tier: p.tier,
      sort_order: i + 1,
      odds: p.odds ?? null,
      odds_source: p.oddsSource ?? null,
    }));

  if (rows.length > 0) {
    const { error } = await supabaseAdmin.from('tournament_players').insert(rows);
    if (error) {
      return { count: 0, oddsCount: 0, oddsSource: null, mode,
        message: `Error writing field: ${error.message}` };
    }
  }

  const oddsCount = players.filter((p) => p.odds != null).length;
  const sourceLabel = oddsResult?.sourceTitle || oddsResult?.source || null;
  const tier6Size = Math.max(0, rows.length - 75);

  let message;
  if (mode === 'odds-only') {
    message = `Field of ${rows.length} players from ${sourceLabel} ` +
      `(ESPN field not yet posted). Tiers 1–5 by odds rank (15 each), tier 6 = ${tier6Size} players.`;
  } else if (mode === 'odds') {
    message = `Field of ${rows.length} players, ${oddsCount} with odds from ${sourceLabel}. ` +
      `Tiers 1–5 by odds rank (15 each), tier 6 = ${tier6Size} players.`;
  } else if (sportKey && oddsResult) {
    message = `Only ${oddsResult.count} players had odds (need ${ODDS_THRESHOLD}). ` +
      `Falling back to ESPN sort order. Refresh later when odds firm up.`;
  } else if (sportKey) {
    message = `No odds available from The Odds API yet. Using ESPN sort order. ` +
      `Refresh later when odds are posted.`;
  } else {
    message = `No odds source for this event — using ESPN sort order.`;
  }

  return { count: rows.length, oddsCount, oddsSource: sourceLabel, mode, message };
}
