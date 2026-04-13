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

  const json = await res.json();
  if (!res.ok) throw new Error(json.error || `API error ${res.status}`);
  return json;
}
