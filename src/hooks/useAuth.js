import { useCallback, useEffect, useState } from 'react';
import { supabase } from '../lib/supabase.js';

/**
 * useAuth — wraps Supabase Auth state.
 * Exposes { user, session, loading, signIn, signOut, isAdmin }.
 */
export function useAuth() {
  const [session, setSession] = useState(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    if (!supabase) {
      setLoading(false);
      return;
    }

    // Get initial session
    supabase.auth.getSession().then(({ data: { session: s } }) => {
      setSession(s);
      setLoading(false);
    });

    // Listen for auth changes
    const { data: { subscription } } = supabase.auth.onAuthStateChange(
      (_event, s) => setSession(s)
    );

    return () => subscription.unsubscribe();
  }, []);

  const signIn = useCallback(async (email, password) => {
    if (!supabase) throw new Error('Supabase not configured');
    const { data, error } = await supabase.auth.signInWithPassword({
      email,
      password,
    });
    if (error) throw error;
    return data;
  }, []);

  const signOut = useCallback(async () => {
    if (!supabase) return;
    await supabase.auth.signOut();
  }, []);

  const user = session?.user ?? null;

  return {
    user,
    session,
    loading,
    signIn,
    signOut,
    // Any authenticated user is treated as admin for now.
    // Could be tightened later with an admins table check.
    isAdmin: !!user,
  };
}
