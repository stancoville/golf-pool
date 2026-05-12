// The Odds API integration — outright winner odds for golf majors.
// Docs: https://the-odds-api.com/liveapi/guides/v4/

const ODDS_API_BASE = 'https://api.the-odds-api.com/v4';

// Map tournament name fragments → The Odds API sport keys.
// The "_winner" sport keys are outright futures markets for that event.
// Order matters: longer/more-specific keys are matched first.
const SPORT_KEYS = [
  ['masters tournament', 'golf_masters_tournament_winner'],
  ['the masters', 'golf_masters_tournament_winner'],
  ['pga championship', 'golf_pga_championship_winner'],
  ['the open championship', 'golf_the_open_championship_winner'],
  ['u.s. open', 'golf_us_open_winner'],
  ['us open', 'golf_us_open_winner'],
  ['the open', 'golf_the_open_championship_winner'],
  ['masters', 'golf_masters_tournament_winner'],
];

export function detectSportKey(tournamentName) {
  const lower = (tournamentName || '').toLowerCase();
  for (const [needle, key] of SPORT_KEYS) {
    if (lower.includes(needle)) return key;
  }
  return null;
}

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

/**
 * Fetch outright winner odds for a tournament from The Odds API.
 *
 * Picks the bookmaker with the deepest field of outcomes (most players priced)
 * and returns a slug-keyed map of American odds.
 *
 * Returns null when the API key is missing, the sport key is unknown, the
 * request fails, or no bookmaker has any outright outcomes posted.
 */
export async function fetchTournamentOdds(sportKey) {
  const apiKey = process.env.ODDS_API_KEY;
  if (!apiKey || !sportKey) return null;

  const url = `${ODDS_API_BASE}/sports/${sportKey}/odds?apiKey=${apiKey}` +
    `&regions=us&markets=outrights&oddsFormat=american`;

  let data;
  try {
    const res = await fetch(url);
    if (!res.ok) {
      console.warn(`Odds API ${res.status} for ${sportKey}`);
      return null;
    }
    data = await res.json();
  } catch (err) {
    console.error('Odds API fetch failed:', err);
    return null;
  }

  if (!Array.isArray(data) || data.length === 0) return null;

  // The Odds API returns an array of events; outright markets live on the
  // tournament's "event" object. Take the first (these sport keys are
  // tournament-scoped — only one event each).
  const event = data[0];
  const bookmakers = event.bookmakers || [];

  // Prefer DraftKings (recognizable brand, consistent coverage). Fall back to
  // whichever bookmaker has the deepest field if DK isn't available or has
  // posted no outcomes.
  const PREFERRED = 'draftkings';
  let chosen = null;
  for (const bm of bookmakers) {
    const market = (bm.markets || []).find((m) => m.key === 'outrights');
    const outcomes = market?.outcomes || [];
    if (bm.key === PREFERRED && outcomes.length > 0) {
      chosen = { key: bm.key, title: bm.title, outcomes };
      break;
    }
  }
  if (!chosen) {
    for (const bm of bookmakers) {
      const market = (bm.markets || []).find((m) => m.key === 'outrights');
      const outcomes = market?.outcomes || [];
      if (!chosen || outcomes.length > chosen.outcomes.length) {
        chosen = { key: bm.key, title: bm.title, outcomes };
      }
    }
  }

  if (!chosen || chosen.outcomes.length === 0) return null;

  // Normalize outcomes: filter invalid rows, attach slug, sort by price (the
  // most-favored players first). This list is the canonical priced field.
  const normalized = chosen.outcomes
    .filter((o) => o.name && typeof o.price === 'number')
    .map((o) => ({ name: o.name, slug: slugify(o.name), price: o.price }))
    .sort((a, b) => a.price - b.price);

  const bySlug = new Map();
  for (const o of normalized) bySlug.set(o.slug, { price: o.price, name: o.name });

  return {
    bySlug,
    outcomes: normalized,
    source: chosen.key,
    sourceTitle: chosen.title,
    count: normalized.length,
  };
}
