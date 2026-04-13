import React, { useCallback, useEffect, useState } from 'react';
import { adminFetch } from '../lib/api.js';

export default function TournamentSetup() {
  const [upcoming, setUpcoming] = useState([]);
  const [existing, setExisting] = useState([]);
  const [loading, setLoading] = useState(true);
  const [creating, setCreating] = useState(null);
  const [error, setError] = useState(null);
  const [message, setMessage] = useState(null);

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

  async function handleCreate(event) {
    setCreating(event.espnId);
    setError(null);
    setMessage(null);
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
    try {
      await adminFetch(`/api/admin/tournaments/${tournament.id}`, {
        method: 'PATCH',
        body: JSON.stringify({ registration_open: !tournament.registration_open }),
      });
      await fetchData();
    } catch (err) {
      setError(err.message);
    }
  }

  async function handleDelete(tournament) {
    if (!confirm(`Delete "${tournament.name}"? This removes all teams and data.`)) return;
    try {
      await adminFetch(`/api/admin/tournaments/${tournament.id}`, {
        method: 'DELETE',
      });
      setMessage(`Deleted "${tournament.name}"`);
      await fetchData();
    } catch (err) {
      setError(err.message);
    }
  }

  if (loading) return <p className="admin-section__placeholder">Loading tournaments…</p>;

  const existingEspnIds = new Set(existing.map((t) => t.espn_id));

  return (
    <div className="tournament-setup">
      {error && <p className="tournament-setup__error">{error}</p>}
      {message && <p className="tournament-setup__message">{message}</p>}

      {/* Existing tournaments */}
      {existing.length > 0 && (
        <div className="tournament-setup__group">
          <h3 className="tournament-setup__subtitle">Your Tournaments</h3>
          <div className="tournament-setup__list">
            {existing.map((t) => (
              <div key={t.id} className="tournament-setup__item tournament-setup__item--existing">
                <div className="tournament-setup__info">
                  <span className="tournament-setup__name">{t.name} ({t.year})</span>
                  <span className="tournament-setup__dates">
                    {t.start_date} — {t.status}
                  </span>
                </div>
                <div className="tournament-setup__actions">
                  <button
                    className={`tournament-setup__btn ${t.registration_open ? 'tournament-setup__btn--danger' : 'tournament-setup__btn--primary'}`}
                    onClick={() => handleToggleRegistration(t)}
                  >
                    {t.registration_open ? 'Close Registration' : 'Open Registration'}
                  </button>
                  <button
                    className="tournament-setup__btn tournament-setup__btn--danger"
                    onClick={() => handleDelete(t)}
                  >
                    Delete
                  </button>
                </div>
              </div>
            ))}
          </div>
        </div>
      )}

      {/* ESPN Calendar */}
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
