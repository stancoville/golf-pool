import { supabaseAdmin, requireAdmin } from '../../lib/supabaseAdmin.js';

export default async function handler(req, res) {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET, PATCH, DELETE, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type, Authorization');
  if (req.method === 'OPTIONS') return res.status(200).end();

  if (!(await requireAdmin(req, res))) return;

  const { id } = req.query;
  if (!id) return res.status(400).json({ error: 'Team ID required' });

  if (req.method === 'PATCH') return handlePatch(req, res, id);
  if (req.method === 'DELETE') return handleDelete(req, res, id);
  return res.status(405).json({ error: 'Method not allowed' });
}

/**
 * PATCH /api/admin/teams/[id]
 * Update team name, submitted_by, tiebreaker, or swap players.
 * Body: { teamName?, submittedBy?, tiebreaker?, picks?: { tier: playerId } }
 */
async function handlePatch(req, res, id) {
  try {
    const { teamName, submittedBy, tiebreaker, picks, paid } = req.body;

    // Update team metadata
    const updates = {};
    if (teamName !== undefined) updates.team_name = teamName;
    if (submittedBy !== undefined) updates.submitted_by = submittedBy;
    if (tiebreaker !== undefined) updates.tiebreaker = parseInt(tiebreaker);
    if (paid !== undefined) updates.paid = !!paid;

    if (Object.keys(updates).length > 0) {
      const { error } = await supabaseAdmin
        .from('teams')
        .update(updates)
        .eq('id', id);
      if (error) throw error;
    }

    // Swap players if picks provided
    if (picks && typeof picks === 'object') {
      for (const [tier, newPlayerId] of Object.entries(picks)) {
        // Remove existing pick for this tier
        await supabaseAdmin
          .from('team_players')
          .delete()
          .eq('team_id', id)
          .eq('tier', parseInt(tier));

        // Insert new pick
        const { error } = await supabaseAdmin
          .from('team_players')
          .insert({
            team_id: id,
            player_id: newPlayerId,
            tier: parseInt(tier),
          });
        if (error) throw error;
      }
    }

    return res.status(200).json({ success: true });
  } catch (err) {
    console.error('Error updating team:', err);
    return res.status(500).json({ error: err.message });
  }
}

/**
 * DELETE /api/admin/teams/[id]
 */
async function handleDelete(req, res, id) {
  try {
    const { error } = await supabaseAdmin
      .from('teams')
      .delete()
      .eq('id', id);
    if (error) throw error;
    return res.status(200).json({ success: true });
  } catch (err) {
    console.error('Error deleting team:', err);
    return res.status(500).json({ error: err.message });
  }
}
