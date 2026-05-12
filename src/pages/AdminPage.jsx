import React, { useState } from 'react';
import AdminLogin from '../components/AdminLogin.jsx';
import TournamentSetup from '../components/TournamentSetup.jsx';
import TeamManagement from '../components/TeamManagement.jsx';
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
          <AdminAccordion title="Tournament Management" defaultOpen={true}>
            <TournamentSetup />
          </AdminAccordion>

          <AdminAccordion title="Team Management" defaultOpen={true}>
            <TeamManagement />
          </AdminAccordion>
        </div>
      </main>
    </div>
  );
}

function AdminAccordion({ title, defaultOpen = true, children }) {
  const [open, setOpen] = useState(defaultOpen);
  return (
    <section className={`admin-section ${open ? 'admin-section--open' : 'admin-section--closed'}`}>
      <button
        type="button"
        className="admin-section__toggle"
        onClick={() => setOpen((v) => !v)}
        aria-expanded={open}
      >
        <span className="admin-section__chevron" aria-hidden="true">{open ? '▾' : '▸'}</span>
        <h2 className="admin-section__title">{title}</h2>
      </button>
      {open && <div className="admin-section__body">{children}</div>}
    </section>
  );
}
