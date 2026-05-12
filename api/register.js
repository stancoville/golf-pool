import { createClient } from '@supabase/supabase-js';

// Use anon key for registration (respects RLS policies)
const supabaseUrl = process.env.VITE_SUPABASE_URL;
const supabaseAnonKey = process.env.VITE_SUPABASE_ANON_KEY;
const supabase =
  supabaseUrl && supabaseAnonKey
    ? createClient(supabaseUrl, supabaseAnonKey)
    : null;

export default async function handler(req, res) {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type');
  if (req.method === 'OPTIONS') return res.status(200).end();

  if (!supabase) return res.status(500).json({ error: 'Supabase not configured' });

  if (req.method === 'GET') return handleGet(req, res);
  if (req.method === 'POST') return handlePost(req, res);
  return res.status(405).json({ error: 'Method not allowed' });
}

/**
 * GET /api/register
 * Returns the active tournament's field organized by tier.
 */
async function handleGet(req, res) {
  try {
    // Get most recent tournament
    const { data: tournament, error: tErr } = await supabase
      .from('tournaments')
      .select('*')
      .order('start_date', { ascending: false })
      .limit(1)
      .single();

    if (tErr || !tournament) {
      return res.status(200).json({ tournament: null, tiers: {} });
    }

    // Get the field with player details, grouped by tier
    const { data: field, error: fErr } = await supabase
      .from('tournament_players')
      .select('tier, sort_order, player_id, odds, players(id, name)')
      .eq('tournament_id', tournament.id)
      .order('sort_order', { ascending: true });

    if (fErr) throw fErr;

    // Group by tier
    const tiers = {};
    for (const row of field || []) {
      const t = row.tier;
      if (!tiers[t]) tiers[t] = [];
      tiers[t].push({
        id: row.players.id,
        name: row.players.name,
        sortOrder: row.sort_order,
        odds: row.odds,
      });
    }

    // Get team count
    const { count } = await supabase
      .from('teams')
      .select('id', { count: 'exact', head: true })
      .eq('tournament_id', tournament.id);

    return res.status(200).json({
      tournament: {
        id: tournament.id,
        name: tournament.name,
        year: tournament.year,
        venue: tournament.venue,
        startDate: tournament.start_date,
        registrationOpen: tournament.registration_open,
        status: tournament.status,
        theme: tournament.theme,
      },
      tiers,
      teamCount: count || 0,
    });
  } catch (err) {
    console.error('Error fetching registration data:', err);
    return res.status(500).json({ error: err.message });
  }
}

/**
 * POST /api/register
 * Submit a new team. Body: { tournamentId, teamName, submittedBy, tiebreaker, picks: { 1: playerId, 2: playerId, ... } }
 */
async function handlePost(req, res) {
  try {
    const { tournamentId, teamName, submittedBy, tiebreaker, picks } = req.body;

    // Validate required fields
    if (!tournamentId || !teamName?.trim() || !submittedBy?.trim() || tiebreaker == null || !picks) {
      return res.status(400).json({ error: 'All fields are required: teamName, submittedBy, tiebreaker, picks' });
    }

    // Validate picks: must have exactly 6, one per tier
    const tierKeys = Object.keys(picks);
    if (tierKeys.length !== 6) {
      return res.status(400).json({ error: 'Must pick exactly one player from each of the 6 tiers' });
    }
    for (let t = 1; t <= 6; t++) {
      if (!picks[String(t)]) {
        return res.status(400).json({ error: `Missing pick for tier ${t}` });
      }
    }

    // Check tournament exists and registration is open
    const { data: tournament, error: tErr } = await supabase
      .from('tournaments')
      .select('id, registration_open, start_date')
      .eq('id', tournamentId)
      .single();

    if (tErr || !tournament) {
      return res.status(400).json({ error: 'Tournament not found' });
    }
    if (!tournament.registration_open) {
      return res.status(400).json({ error: 'Registration is closed' });
    }
    // Registration closes at the earliest tee time: 11:00 UTC (~7am Eastern) of
    // start_date. Matches the UI cutoff in src/pages/MainPage.jsx.
    const teeOff = new Date(`${tournament.start_date}T11:00:00Z`);
    if (teeOff <= new Date()) {
      return res.status(400).json({ error: 'Registration closed — tournament has started.' });
    }

    // Validate all picks are valid tournament_players
    const playerIds = Object.values(picks);
    const { data: validPlayers, error: vpErr } = await supabase
      .from('tournament_players')
      .select('player_id, tier')
      .eq('tournament_id', tournamentId)
      .in('player_id', playerIds);

    if (vpErr) throw vpErr;

    const validMap = new Map(validPlayers.map((p) => [p.player_id, p.tier]));
    for (const [tier, playerId] of Object.entries(picks)) {
      if (!validMap.has(playerId)) {
        return res.status(400).json({ error: `Invalid player selection for tier ${tier}` });
      }
      if (validMap.get(playerId) !== parseInt(tier)) {
        return res.status(400).json({ error: `Player is not in tier ${tier}` });
      }
    }

    // Insert team
    const { data: team, error: teamErr } = await supabase
      .from('teams')
      .insert({
        tournament_id: tournamentId,
        team_name: teamName.trim(),
        submitted_by: submittedBy.trim(),
        tiebreaker: parseInt(tiebreaker),
      })
      .select('id')
      .single();

    if (teamErr) throw teamErr;

    // Insert team_players
    const teamPlayers = Object.entries(picks).map(([tier, playerId]) => ({
      team_id: team.id,
      player_id: playerId,
      tier: parseInt(tier),
    }));

    const { error: tpErr } = await supabase
      .from('team_players')
      .insert(teamPlayers);

    if (tpErr) throw tpErr;

    return res.status(201).json({ success: true, teamId: team.id });
  } catch (err) {
    console.error('Error registering team:', err);
    return res.status(500).json({ error: err.message });
  }
}
