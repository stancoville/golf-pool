import { supabaseAdmin, requireAdmin } from '../lib/supabaseAdmin.js';

const ESPN_SCOREBOARD = 'https://site.api.espn.com/apis/site/v2/sports/golf/pga/scoreboard';
const ESPN_CORE = 'https://sports.core.api.espn.com/v2/sports/golf/leagues/pga';

// Theme presets for known tournaments
const THEME_PRESETS = {
  masters: { primary: '#006a4e', accent: '#fbf308', gradientFrom: '#007a54', gradientTo: '#004d35' },
  'pga championship': { primary: '#1a2744', accent: '#c9a84c', gradientFrom: '#243559', gradientTo: '#0f1a2e' },
  'u.s. open': { primary: '#003366', accent: '#c41e3a', gradientFrom: '#004080', gradientTo: '#001a33' },
  'the open': { primary: '#1a1a3e', accent: '#d4a843', gradientFrom: '#2a2a5e', gradientTo: '#0d0d1f' },
};

function detectTheme(tournamentName) {
  const lower = tournamentName.toLowerCase();
  for (const [key, theme] of Object.entries(THEME_PRESETS)) {
    if (lower.includes(key)) return theme;
  }
  // Default green theme
  return { primary: '#1a5c3a', accent: '#e8e0c8', gradientFrom: '#1f6b44', gradientTo: '#0f3d22' };
}

function slugify(name) {
  return name
    .toLowerCase()
    .normalize('NFD')
    .replace(/[\u0300-\u036f]/g, '')
    .replace(/ø/g, 'o')
    .replace(/æ/g, 'ae')
    .replace(/ð/g, 'd')
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/(^-|-$)/g, '');
}

export default async function handler(req, res) {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type, Authorization');
  if (req.method === 'OPTIONS') return res.status(200).end();

  if (!(await requireAdmin(req, res))) return;

  if (req.method === 'GET') return handleGet(req, res);
  if (req.method === 'POST') return handlePost(req, res);
  return res.status(405).json({ error: 'Method not allowed' });
}

/**
 * GET /api/admin/tournaments
 * Returns ESPN calendar (upcoming PGA events) + existing tournaments from DB.
 */
async function handleGet(req, res) {
  try {
    // Fetch ESPN calendar
    const espnRes = await fetch(ESPN_SCOREBOARD);
    const espnData = await espnRes.json();
    const calendar = espnData.leagues?.[0]?.calendar || [];

    const now = new Date().toISOString();
    const upcoming = calendar
      .filter((e) => e.endDate > now)
      .map((e) => ({
        espnId: e.id,
        name: e.label,
        startDate: e.startDate?.slice(0, 10),
        endDate: e.endDate?.slice(0, 10),
      }));

    // Fetch existing tournaments from DB
    const { data: existing } = await supabaseAdmin
      .from('tournaments')
      .select('id, name, year, espn_id, start_date, end_date, status, registration_open')
      .order('start_date', { ascending: false })
      .limit(20);

    return res.status(200).json({ upcoming, existing: existing || [] });
  } catch (err) {
    console.error('Error listing tournaments:', err);
    return res.status(500).json({ error: err.message });
  }
}

/**
 * POST /api/admin/tournaments
 * Create a tournament from an ESPN event. Fetches field and assigns tiers.
 * Body: { espnId, name, startDate, endDate, coursePar? }
 */
async function handlePost(req, res) {
  try {
    const { espnId, name, startDate, endDate, coursePar = 72 } = req.body;
    if (!espnId || !name || !startDate) {
      return res.status(400).json({ error: 'espnId, name, and startDate are required' });
    }

    const year = new Date(startDate).getFullYear();
    const theme = detectTheme(name);

    // Create tournament record
    const { data: tournament, error: tErr } = await supabaseAdmin
      .from('tournaments')
      .insert({
        name,
        year,
        espn_id: espnId,
        start_date: startDate,
        end_date: endDate || null,
        course_par: coursePar,
        status: 'Scheduled',
        registration_open: false,
        theme,
      })
      .select()
      .single();

    if (tErr) throw tErr;

    // Try to fetch the field from ESPN
    const fieldResult = await fetchAndPopulateField(tournament.id, espnId);

    return res.status(201).json({
      tournament,
      fieldCount: fieldResult.count,
      fieldMessage: fieldResult.message,
    });
  } catch (err) {
    console.error('Error creating tournament:', err);
    return res.status(500).json({ error: err.message });
  }
}

/**
 * Fetch competitors from ESPN and populate tournament_players with tier assignments.
 */
async function fetchAndPopulateField(tournamentId, espnEventId) {
  // Try the main scoreboard first (works for current/recent tournaments)
  let competitors = [];

  try {
    const scoreboardRes = await fetch(ESPN_SCOREBOARD);
    const scoreboardData = await scoreboardRes.json();
    const event = scoreboardData.events?.find(
      (e) => String(e.id) === String(espnEventId)
    );
    if (event) {
      competitors = event.competitions?.[0]?.competitors || [];
    }
  } catch (e) {
    // Ignore, try core API
  }

  // If scoreboard didn't have the field, try core API
  if (competitors.length === 0) {
    try {
      const coreRes = await fetch(
        `${ESPN_CORE}/events/${espnEventId}/competitions/${espnEventId}/competitors?limit=200`
      );
      const coreData = await coreRes.json();
      const items = coreData.items || [];

      // Core API returns refs with IDs — need to fetch athlete details
      // For now, fetch each one (they have basic info inline)
      competitors = items.map((item) => ({
        athlete: { id: item.id, displayName: '' },
        _ref: item.$ref,
      }));

      // If items have no names, the field isn't populated yet
      if (items.length === 0) {
        return {
          count: 0,
          message: 'Field not yet available on ESPN. You can refresh the field later from the admin panel.',
        };
      }
    } catch (e) {
      return {
        count: 0,
        message: 'Could not fetch field from ESPN. You can refresh later.',
      };
    }
  }

  if (competitors.length === 0) {
    return { count: 0, message: 'No competitors found. Field may not be posted yet.' };
  }

  // Extract player info and assign tiers
  const tierSize = Math.floor(competitors.length / 6);
  const playerRows = [];

  for (let i = 0; i < competitors.length; i++) {
    const c = competitors[i];
    const athlete = c.athlete || {};
    const name = athlete.displayName || `Player ${athlete.id || i}`;
    const espnAthleteId = String(athlete.id || '');

    if (!name || name.startsWith('Player ')) continue;

    // Upsert into players table
    let playerId;
    if (espnAthleteId) {
      const { data: existing } = await supabaseAdmin
        .from('players')
        .select('id')
        .eq('espn_id', espnAthleteId)
        .single();

      if (existing) {
        playerId = existing.id;
      } else {
        const { data: inserted } = await supabaseAdmin
          .from('players')
          .insert({ name, espn_id: espnAthleteId })
          .select('id')
          .single();
        playerId = inserted?.id;
      }
    } else {
      // No ESPN ID — match by slug
      const slug = slugify(name);
      const { data: existing } = await supabaseAdmin
        .from('players')
        .select('id')
        .ilike('name', name)
        .single();

      if (existing) {
        playerId = existing.id;
      } else {
        const { data: inserted } = await supabaseAdmin
          .from('players')
          .insert({ name })
          .select('id')
          .single();
        playerId = inserted?.id;
      }
    }

    if (!playerId) continue;

    const tier = Math.min(6, Math.floor(i / tierSize) + 1);
    playerRows.push({
      tournament_id: tournamentId,
      player_id: playerId,
      tier,
      sort_order: i + 1,
    });
  }

  // Bulk insert tournament_players
  if (playerRows.length > 0) {
    const { error } = await supabaseAdmin
      .from('tournament_players')
      .upsert(playerRows, { onConflict: 'tournament_id,player_id' });

    if (error) {
      console.error('Error inserting tournament_players:', error);
      return { count: 0, message: `Error populating field: ${error.message}` };
    }
  }

  return {
    count: playerRows.length,
    message: `Field populated with ${playerRows.length} players across 6 tiers.`,
  };
}
