import { supabase } from './supabase.js';

/**
 * Make an authenticated API call (admin routes).
 * Attaches the current Supabase session token as Bearer auth.
 */
export async function adminFetch(path, options = {}) {
  const { data: { session } } = await supabase.auth.getSession();
  const token = session?.access_token;
  if (!token) throw new Error('Not authenticated');

  const res = await fetch(path, {
    ...options,
    headers: {
      'Content-Type': 'application/json',
      Authorization: `Bearer ${token}`,
      ...options.headers,
    },
  });

  const text = await res.text();
  let json = null;
  if (text) {
    try { json = JSON.parse(text); } catch { /* non-JSON body */ }
  }

  if (!res.ok) {
    const msg = json?.error || text?.slice(0, 200) || `API error ${res.status}`;
    throw new Error(`${res.status} — ${msg}`);
  }
  return json ?? {};
}
