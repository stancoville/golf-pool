import { createClient } from '@supabase/supabase-js';

// Server-side Supabase client using the service role key.
// This bypasses RLS and should ONLY be used in Vercel serverless functions.
// NEVER expose SUPABASE_SERVICE_ROLE_KEY to the browser.
const supabaseUrl = process.env.VITE_SUPABASE_URL;
const serviceRoleKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

export const supabaseAdmin =
  supabaseUrl && serviceRoleKey
    ? createClient(supabaseUrl, serviceRoleKey, {
        auth: { autoRefreshToken: false, persistSession: false },
      })
    : null;

/**
 * Verify that the request has a valid Supabase auth token and return the user.
 * Returns null if not authenticated.
 */
export async function getAuthUser(req) {
  if (!supabaseAdmin) return null;
  const authHeader = req.headers.authorization || '';
  const token = authHeader.replace(/^Bearer\s+/i, '');
  if (!token) return null;

  const { data: { user }, error } = await supabaseAdmin.auth.getUser(token);
  if (error || !user) return null;
  return user;
}

/**
 * Middleware: reject the request if the caller is not an authenticated admin.
 * Returns true if authorized, false if it sent a 401 response.
 */
export async function requireAdmin(req, res) {
  const user = await getAuthUser(req);
  if (!user) {
    res.status(401).json({ error: 'Unauthorized' });
    return false;
  }
  // Attach user to request for downstream use
  req.adminUser = user;
  return true;
}
