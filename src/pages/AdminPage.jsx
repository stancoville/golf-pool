import React from 'react';
import AdminLogin from '../components/AdminLogin.jsx';
import TournamentSetup from '../components/TournamentSetup.jsx';
import { useAuth } from '../hooks/useAuth.js';

/**
 * AdminPage — auth-gated admin panel.
 * Shows login form when not authenticated.
 * Shows tournament management + team editing when authenticated.
 */
export default function AdminPage() {
  const { user, loading, signIn, signOut, isAdmin } = useAuth();

  if (loading) {
    return (
      <div className="app">
        <main className="app__main">
          <div className="empty"><p>Loading…</p></div>
        </main>
      </div>
    );
  }

  if (!isAdmin) {
    return (
      <div className="app">
        <main className="app__main">
          <AdminLogin onSignIn={signIn} />
        </main>
      </div>
    );
  }

  return (
    <div className="app">
      <main className="app__main">
        <div className="admin-header">
          <h1 className="admin-header__title">Admin Panel</h1>
          <div className="admin-header__user">
            <span className="admin-header__email">{user.email}</span>
            <button className="admin-header__signout" onClick={signOut}>
              Sign Out
            </button>
          </div>
        </div>

        <div className="admin-sections">
          <section className="admin-section">
            <h2 className="admin-section__title">Tournament Management</h2>
            <TournamentSetup />
          </section>

          <section className="admin-section">
            <h2 className="admin-section__title">Team Management</h2>
            <p className="admin-section__placeholder">
              Coming in Phase 6 — view, edit, and delete registered teams.
            </p>
          </section>
        </div>
      </main>
    </div>
  );
}
