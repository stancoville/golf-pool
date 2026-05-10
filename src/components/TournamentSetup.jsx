import React, { useCallback, useEffect, useState } from 'react';
import { adminFetch } from '../lib/api.js';

export default function TournamentSetup() {
  const [upcoming, setUpcoming] = useState([]);
  const [existing, setExisting] = useState([]);
  const [loading, setLoading] = useState(true);
  const [creating, setCreating] = useState(null);
  const [busy, setBusy] = useState(null); // tournament id of in-flight action
  const [error, setError] = useState(null);
  const [message, setMessage] = useState(null);
  const [refreshResult, setRefreshResult] = useState(null);
  // Per-tournament local edit state for par / venue inputs.
  const [edits, setEdits] = useState({});

  const fetchData = useCallback(async () => {
    try {
      setLoading(true);
      const data = await adminFetch('/api/admin/tournaments');
      setUpcoming(data.upcoming || []);
      setExisting(data.existing || []);
    } catch (err) {
      setError(err.message);
    } finally {
      setLoading(false);
    }
  }, []);

  useEffect(() => { fetchData(); }, [fetchData]);

  function clearBanners() {
    setError(null);
    setMessage(null);
    setRefreshResult(null);
  }

  async function handleCreate(event) {
    clearBanners();
    setCreating(event.espnId);
    try {
      const data = await adminFetch('/api/admin/tournaments', {
        method: 'POST',
        body: JSON.stringify({
          espnId: event.espnId,
          name: event.name,
          startDate: event.startDate,
          endDate: event.endDate,
        }),
      });
      setMessage(`Created "${data.tournament.name}" — ${data.fieldMessage}`);
      await fetchData();
    } catch (err) {
      setError(err.message);
    } finally {
      setCreating(null);
    }
  }

  async function handleToggleRegistration(tournament) {
    clearBanners();
    setBusy(tournament.id);
    try {
      await adminFetch(`/api/admin/tournaments/${tournament.id}`, {
        method: 'PATCH',
        body: JSON.stringify({ registration_open: !tournament.registration_open }),
      });
      await fetchData();
    } catch (err) {
      setError(err.message);
    } finally {
      setBusy(null);
    }
  }

  async function handleRefreshField(tournament) {
    clearBanners();
    const warn = tournament.registration_open
      ? `Registration for "${tournament.name}" is OPEN. Refreshing the field will re-tier players — some existing picks may move tiers. Continue?`
      : `Re-fetch the field and odds for "${tournament.name}" and rebuild tiers?`;
    if (!confirm(warn)) return;

    setBusy(tournament.id);
    try {
      const data = await adminFetch(`/api/admin/tournaments/${tournament.id}/refresh-field`, {
        method: 'POST',
      });
      setRefreshResult({ tournamentName: tournament.name, ...data });
      await fetchData();
    } catch (err) {
      setError(err.message);
    } finally {
      setBusy(null);
    }
  }

  async function handleSaveInfo(tournament) {
    clearBanners();
    const e = edits[tournament.id] || {};
    const updates = {};
    if (e.course_par !== undefined && e.course_par !== tournament.course_par) {
      updates.course_par = parseInt(e.course_par, 10);
    }
    if (e.venue !== undefined && e.venue !== (tournament.venue || '')) {
      updates.venue = e.venue || null;
    }
    if (Object.keys(updates).length === 0) {
      setMessage('No changes to save.');
      return;
    }

    setBusy(tournament.id);
    try {
      await adminFetch(`/api/admin/tournaments/${tournament.id}`, {
        method: 'PATCH',
        body: JSON.stringify(updates),
      });
      setEdits((prev) => ({ ...prev, [tournament.id]: {} }));
      setMessage(`Updated "${tournament.name}".`);
      await fetchData();
    } catch (err) {
      setError(err.message);
    } finally {
      setBusy(null);
    }
  }

  async function handleDelete(tournament) {
    clearBanners();
    if (!confirm(`Delete "${tournament.name}"? This removes all teams and data.`)) return;
    setBusy(tournament.id);
    try {
      await adminFetch(`/api/admin/tournaments/${tournament.id}`, {
        method: 'DELETE',
      });
      setMessage(`Deleted "${tournament.name}".`);
      await fetchData();
    } catch (err) {
      setError(err.message);
    } finally {
      setBusy(null);
    }
  }

  function getEdit(t, field) {
    const e = edits[t.id] || {};
    return e[field] !== undefined ? e[field] : (field === 'venue' ? (t.venue || '') : t[field] ?? '');
  }
  function setEdit(t, field, value) {
    setEdits((prev) => ({ ...prev, [t.id]: { ...(prev[t.id] || {}), [field]: value } }));
  }
  function hasUnsaved(t) {
    const e = edits[t.id] || {};
    return (
      (e.course_par !== undefined && parseInt(e.course_par, 10) !== t.course_par) ||
      (e.venue !== undefined && e.venue !== (t.venue || ''))
    );
  }

  if (loading) return <p className="admin-section__placeholder">Loading tournaments…</p>;

  const existingEspnIds = new Set(existing.map((t) => t.espn_id));

  return (
    <div className="tournament-setup">
      {error && <p className="tournament-setup__error">{error}</p>}
      {message && <p className="tournament-setup__message">{message}</p>}
      {refreshResult && <RefreshResultBanner result={refreshResult} onDismiss={() => setRefreshResult(null)} />}

      {existing.length > 0 && (
        <div className="tournament-setup__group">
          <h3 className="tournament-setup__subtitle">Your Tournaments</h3>
          <div className="tournament-setup__list">
            {existing.map((t) => (
              <div key={t.id} className="tournament-setup__card">
                <div className="tournament-setup__card-head">
                  <div className="tournament-setup__info">
                    <span className="tournament-setup__name">{t.name} ({t.year})</span>
                    <span className="tournament-setup__dates">
                      {t.start_date} — {t.status}{t.registration_open ? ' · Registration OPEN' : ''}
                    </span>
                  </div>
                </div>

                <div className="tournament-setup__fields">
                  <label className="tournament-setup__field">
                    <span>Par</span>
                    <input
                      type="number"
                      min="60"
                      max="80"
                      value={getEdit(t, 'course_par')}
                      onChange={(e) => setEdit(t, 'course_par', e.target.value)}
                    />
                  </label>
                  <label className="tournament-setup__field tournament-setup__field--wide">
                    <span>Venue</span>
                    <input
                      type="text"
                      placeholder="e.g. Quail Hollow"
                      value={getEdit(t, 'venue')}
                      onChange={(e) => setEdit(t, 'venue', e.target.value)}
                    />
                  </label>
                  <button
                    className="tournament-setup__btn tournament-setup__btn--ghost"
                    onClick={() => handleSaveInfo(t)}
                    disabled={!hasUnsaved(t) || busy === t.id}
                  >
                    Save
                  </button>
                </div>

                <div className="tournament-setup__actions">
                  <button
                    className="tournament-setup__btn tournament-setup__btn--ghost"
                    onClick={() => handleRefreshField(t)}
                    disabled={busy === t.id}
                  >
                    {busy === t.id ? 'Working…' : 'Refresh Field'}
                  </button>
                  <button
                    className={`tournament-setup__btn ${t.registration_open ? 'tournament-setup__btn--danger' : 'tournament-setup__btn--primary'}`}
                    onClick={() => handleToggleRegistration(t)}
                    disabled={busy === t.id}
                  >
                    {t.registration_open ? 'Close Registration' : 'Open Registration'}
                  </button>
                  <button
                    className="tournament-setup__btn tournament-setup__btn--danger"
                    onClick={() => handleDelete(t)}
                    disabled={busy === t.id}
                  >
                    Delete
                  </button>
                </div>
              </div>
            ))}
          </div>
        </div>
      )}

      <div className="tournament-setup__group">
        <h3 className="tournament-setup__subtitle">Upcoming PGA Events</h3>
        <div className="tournament-setup__list">
          {upcoming.map((e) => {
            const alreadyCreated = existingEspnIds.has(e.espnId);
            return (
              <div key={e.espnId} className="tournament-setup__item">
                <div className="tournament-setup__info">
                  <span className="tournament-setup__name">{e.name}</span>
                  <span className="tournament-setup__dates">
                    {e.startDate} — {e.endDate}
                  </span>
                </div>
                {alreadyCreated ? (
                  <span className="tournament-setup__badge">Created</span>
                ) : (
                  <button
                    className="tournament-setup__btn tournament-setup__btn--primary"
                    onClick={() => handleCreate(e)}
                    disabled={creating === e.espnId}
                  >
                    {creating === e.espnId ? 'Creating…' : 'Create Pool'}
                  </button>
                )}
              </div>
            );
          })}
          {upcoming.length === 0 && (
            <p className="admin-section__placeholder">No upcoming events found.</p>
          )}
        </div>
      </div>
    </div>
  );
}

function RefreshResultBanner({ result, onDismiss }) {
  const broken = result.brokenPicks || [];
  return (
    <div className="tournament-setup__refresh-banner">
      <div className="tournament-setup__refresh-head">
        <strong>{result.tournamentName} — field refreshed</strong>
        <button className="tournament-setup__refresh-close" onClick={onDismiss} aria-label="Dismiss">×</button>
      </div>
      <p className="tournament-setup__refresh-message">{result.message}</p>
      {broken.length > 0 && (
        <>
          <p className="tournament-setup__refresh-warning">
            {broken.length} existing pick{broken.length === 1 ? '' : 's'} no longer match the new tier layout.
            Fix these in Team Management:
          </p>
          <ul className="tournament-setup__refresh-list">
            {broken.map((b, i) => (
              <li key={i}>
                <strong>{b.teamName}</strong> ({b.submittedBy}) — {b.issue}
              </li>
            ))}
          </ul>
        </>
      )}
    </div>
  );
}
