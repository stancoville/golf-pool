import { supabaseAdmin, requireAdmin } from '../../lib/supabaseAdmin.js';
import { buildAndWriteField } from '../../lib/fieldBuilder.js';

const ESPN_SCOREBOARD = 'https://site.api.espn.com/apis/site/v2/sports/golf/pga/scoreboard';

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
  return { primary: '#1a5c3a', accent: '#e8e0c8', gradientFrom: '#1f6b44', gradientTo: '#0f3d22' };
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

    const { data: existing } = await supabaseAdmin
      .from('tournaments')
      .select('id, name, year, espn_id, start_date, end_date, status, registration_open, course_par, venue')
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
 * Create a tournament from an ESPN event. Fetches field + odds and assigns
 * tiers (15/15/15/15/15/rest by odds).
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

    const fieldResult = await buildAndWriteField(tournament.id, espnId, name, startDate);

    return res.status(201).json({
      tournament,
      fieldCount: fieldResult.count,
      oddsCount: fieldResult.oddsCount,
      mode: fieldResult.mode,
      fieldMessage: fieldResult.message,
    });
  } catch (err) {
    console.error('Error creating tournament:', err);
    return res.status(500).json({ error: err.message });
  }
}
