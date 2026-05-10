import { supabaseAdmin, requireAdmin } from '../../lib/supabaseAdmin.js';
import { buildAndWriteField } from '../../lib/fieldBuilder.js';

export default async function handler(req, res) {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'POST, PATCH, DELETE, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type, Authorization');
  if (req.method === 'OPTIONS') return res.status(200).end();

  if (!(await requireAdmin(req, res))) return;

  const { id } = req.query;
  if (!id) return res.status(400).json({ error: 'Tournament ID required' });

  if (req.method === 'POST') return handlePost(req, res, id);
  if (req.method === 'PATCH') return handlePatch(req, res, id);
  if (req.method === 'DELETE') return handleDelete(req, res, id);
  return res.status(405).json({ error: 'Method not allowed' });
}

/**
 * POST /api/admin/tournaments/[id]
 * Action endpoint. Body: { action: 'refresh-field' }
 *
 * - refresh-field: re-fetch ESPN field + odds and rebuild tier assignments.
 *   Returns a "broken picks" report listing existing teams whose picks
 *   no longer match the new tier layout.
 */
async function handlePost(req, res, id) {
  const action = req.body?.action;
  if (action !== 'refresh-field') {
    return res.status(400).json({ error: 'Unknown action. Expected { action: "refresh-field" }.' });
  }

  try {
    const { data: tournament, error: tErr } = await supabaseAdmin
      .from('tournaments')
      .select('id, name, espn_id, registration_open')
      .eq('id', id)
      .single();
    if (tErr || !tournament) return res.status(404).json({ error: 'Tournament not found' });
    if (!tournament.espn_id) return res.status(400).json({ error: 'Tournament has no ESPN ID' });

    const result = await buildAndWriteField(tournament.id, tournament.espn_id, tournament.name);

    // Compare current team picks against the freshly-written tier layout.
    const { data: tps } = await supabaseAdmin
      .from('tournament_players')
      .select('player_id, tier')
      .eq('tournament_id', tournament.id);
    const tierByPlayer = new Map((tps || []).map((r) => [r.player_id, r.tier]));

    const { data: teamPicks } = await supabaseAdmin
      .from('team_players')
      .select('team_id, player_id, tier, teams!inner(team_name, tournament_id, submitted_by)')
      .eq('teams.tournament_id', tournament.id);

    const brokenPicks = [];
    for (const pick of teamPicks || []) {
      const currentTier = tierByPlayer.get(pick.player_id);
      if (currentTier == null) {
        brokenPicks.push({
          teamName: pick.teams.team_name,
          submittedBy: pick.teams.submitted_by,
          pickedTier: pick.tier,
          issue: 'Player no longer in field',
        });
      } else if (currentTier !== pick.tier) {
        brokenPicks.push({
          teamName: pick.teams.team_name,
          submittedBy: pick.teams.submitted_by,
          pickedTier: pick.tier,
          newTier: currentTier,
          issue: `Player moved from tier ${pick.tier} to tier ${currentTier}`,
        });
      }
    }

    return res.status(200).json({
      ...result,
      registrationOpen: tournament.registration_open,
      brokenPicks,
    });
  } catch (err) {
    console.error('Error refreshing field:', err);
    return res.status(500).json({ error: err.message });
  }
}

/**
 * PATCH /api/admin/tournaments/[id]
 * Update tournament fields: registration_open, status, theme, course_par, etc.
 */
async function handlePatch(req, res, id) {
  try {
    const allowed = [
      'registration_open', 'status', 'theme', 'course_par',
      'current_round', 'name', 'venue',
    ];
    const updates = {};
    for (const key of allowed) {
      if (req.body[key] !== undefined) updates[key] = req.body[key];
    }

    if (Object.keys(updates).length === 0) {
      return res.status(400).json({ error: 'No valid fields to update' });
    }

    const { data, error } = await supabaseAdmin
      .from('tournaments')
      .update(updates)
      .eq('id', id)
      .select()
      .single();

    if (error) throw error;
    return res.status(200).json({ tournament: data });
  } catch (err) {
    console.error('Error updating tournament:', err);
    return res.status(500).json({ error: err.message });
  }
}

/**
 * DELETE /api/admin/tournaments/[id]
 * Delete a tournament and all related data (cascades).
 */
async function handleDelete(req, res, id) {
  try {
    const { error } = await supabaseAdmin
      .from('tournaments')
      .delete()
      .eq('id', id);

    if (error) throw error;
    return res.status(200).json({ success: true });
  } catch (err) {
    console.error('Error deleting tournament:', err);
    return res.status(500).json({ error: err.message });
  }
}
