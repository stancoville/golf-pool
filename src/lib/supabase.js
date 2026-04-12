import { createClient } from '@supabase/supabase-js';

// These come from the Vite env. They are public, anon-only credentials.
// Define VITE_SUPABASE_URL and VITE_SUPABASE_ANON_KEY in a local .env file.
const supabaseUrl = import.meta.env.VITE_SUPABASE_URL;
const supabaseAnonKey = import.meta.env.VITE_SUPABASE_ANON_KEY;

// We export `null` if env vars are missing so the app can still run with
// mock data without throwing on import. The hook in src/hooks/useLeaderboard.js
// is responsible for guarding usage of this client.
export const supabase =
  supabaseUrl && supabaseAnonKey
    ? createClient(supabaseUrl, supabaseAnonKey)
    : null;
