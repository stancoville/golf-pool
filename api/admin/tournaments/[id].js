import { supabaseAdmin, requireAdmin } from '../../lib/supabaseAdmin.js';

export default async function handler(req, res) {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'PATCH, DELETE, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type, Authorization');
  if (req.method === 'OPTIONS') return res.status(200).end();

  if (!(await requireAdmin(req, res))) return;

  const { id } = req.query;
  if (!id) return res.status(400).json({ error: 'Tournament ID required' });

  if (req.method === 'PATCH') return handlePatch(req, res, id);
  if (req.method === 'DELETE') return handleDelete(req, res, id);
  return res.status(405).json({ error: 'Method not allowed' });
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
