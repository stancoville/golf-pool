// POST /api/admin/tournaments/[id]/refresh-field
//
// Re-fetches the field from ESPN, re-pulls odds, and rewrites tournament_players
// with fresh tier assignments. Returns a "broken picks" report for any registered
// team whose existing picks no longer match the new tier layout.

import { supabaseAdmin, requireAdmin } from '../../../lib/supabaseAdmin.js';
import { buildAndWriteField } from '../../../lib/fieldBuilder.js';

export default async function handler(req, res) {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'POST, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type, Authorization');
  if (req.method === 'OPTIONS') return res.status(200).end();
  if (req.method !== 'POST') return res.status(405).json({ error: 'Method not allowed' });

  if (!(await requireAdmin(req, res))) return;

  const id = req.query.id || req.body?.id;
  if (!id) return res.status(400).json({ error: 'Tournament ID required' });

  try {
    const { data: tournament, error: tErr } = await supabaseAdmin
      .from('tournaments')
      .select('id, name, espn_id, registration_open')
      .eq('id', id)
      .single();
    if (tErr || !tournament) return res.status(404).json({ error: 'Tournament not found' });
    if (!tournament.espn_id) return res.status(400).json({ error: 'Tournament has no ESPN ID' });

    const result = await buildAndWriteField(tournament.id, tournament.espn_id, tournament.name);

    // Compare existing team picks against the refreshed tier layout.
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
