import React, { useCallback, useEffect, useMemo, useState } from 'react';
import { supabase } from '../lib/supabase.js';
import { adminFetch } from '../lib/api.js';

const TIER_LABELS = {
  1: 'Tier 1',
  2: 'Tier 2',
  3: 'Tier 3',
  4: 'Tier 4',
  5: 'Tier 5',
  6: 'Tier 6',
};

export default function TeamManagement() {
  const [tournaments, setTournaments] = useState([]);
  const [tournamentId, setTournamentId] = useState('');
  const [teams, setTeams] = useState([]);
  const [field, setField] = useState({}); // tier -> [{id, name, sortOrder}]
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);
  const [message, setMessage] = useState(null);
  const [editing, setEditing] = useState(null); // team id being edited

  const fetchTournaments = useCallback(async () => {
    if (!supabase) return;
    const { data, error: err } = await supabase
      .from('tournaments')
      .select('id, name, year, start_date')
      .order('start_date', { ascending: false })
      .limit(20);
    if (err) { setError(err.message); return; }
    setTournaments(data || []);
    if (data && data.length > 0 && !tournamentId) {
      setTournamentId(data[0].id);
    }
  }, [tournamentId]);

  const fetchTeamsAndField = useCallback(async () => {
    if (!supabase || !tournamentId) return;
    setLoading(true);
    setError(null);
    try {
      const [teamsRes, fieldRes] = await Promise.all([
        supabase
          .from('teams')
          .select('id, team_name, submitted_by, tiebreaker, paid, created_at, team_players(tier, player_id, players(id, name))')
          .eq('tournament_id', tournamentId)
          .order('created_at', { ascending: true }),
        supabase
          .from('tournament_players')
          .select('tier, sort_order, player_id, odds, players(id, name)')
          .eq('tournament_id', tournamentId)
          .order('sort_order', { ascending: true }),
      ]);
      if (teamsRes.error) throw teamsRes.error;
      if (fieldRes.error) throw fieldRes.error;

      setTeams(teamsRes.data || []);

      const byTier = {};
      for (const row of fieldRes.data || []) {
        const t = row.tier;
        if (!byTier[t]) byTier[t] = [];
        byTier[t].push({
          id: row.players.id,
          name: row.players.name,
          odds: row.odds,
        });
      }
      setField(byTier);
    } catch (err) {
      setError(err.message);
    } finally {
      setLoading(false);
    }
  }, [tournamentId]);

  useEffect(() => { fetchTournaments(); }, [fetchTournaments]);
  useEffect(() => { fetchTeamsAndField(); }, [fetchTeamsAndField]);

  async function handleSaveTeam(team, patch) {
    setError(null);
    setMessage(null);
    try {
      await adminFetch(`/api/admin/teams/${team.id}`, {
        method: 'PATCH',
        body: JSON.stringify(patch),
      });
      setMessage(`Saved "${patch.teamName || team.team_name}".`);
      setEditing(null);
      await fetchTeamsAndField();
    } catch (err) {
      setError(err.message);
    }
  }

  async function handleTogglePaid(team) {
    setError(null);
    setMessage(null);
    try {
      await adminFetch(`/api/admin/teams/${team.id}`, {
        method: 'PATCH',
        body: JSON.stringify({ paid: !team.paid }),
      });
      await fetchTeamsAndField();
    } catch (err) {
      setError(err.message);
    }
  }

  async function handleDeleteTeam(team) {
    if (!confirm(`Delete team "${team.team_name}"? This cannot be undone.`)) return;
    setError(null);
    setMessage(null);
    try {
      await adminFetch(`/api/admin/teams/${team.id}`, { method: 'DELETE' });
      setMessage(`Deleted "${team.team_name}".`);
      await fetchTeamsAndField();
    } catch (err) {
      setError(err.message);
    }
  }

  const teamRows = useMemo(() => {
    return (teams || []).map((t) => {
      const picksByTier = {};
      for (const tp of t.team_players || []) {
        picksByTier[tp.tier] = { id: tp.player_id, name: tp.players?.name || 'Unknown' };
      }
      return { ...t, picksByTier };
    });
  }, [teams]);

  return (
    <div className="team-mgmt">
      {error && <p className="tournament-setup__error">{error}</p>}
      {message && <p className="tournament-setup__message">{message}</p>}

      <div className="team-mgmt__controls">
        <label className="team-mgmt__select">
          <span>Tournament</span>
          <select
            value={tournamentId}
            onChange={(e) => { setTournamentId(e.target.value); setEditing(null); }}
          >
            {tournaments.map((t) => (
              <option key={t.id} value={t.id}>{t.name} ({t.year})</option>
            ))}
          </select>
        </label>
        <span className="team-mgmt__count">
          {teamRows.length} team{teamRows.length === 1 ? '' : 's'}
        </span>
      </div>

      {loading && <p className="admin-section__placeholder">Loading…</p>}

      {!loading && teamRows.length === 0 && tournamentId && (
        <p className="admin-section__placeholder">No teams registered yet.</p>
      )}

      <div className="team-mgmt__list">
        {teamRows.map((team) => (
          editing === team.id ? (
            <TeamEditor
              key={team.id}
              team={team}
              field={field}
              onSave={(patch) => handleSaveTeam(team, patch)}
              onCancel={() => setEditing(null)}
            />
          ) : (
            <TeamRow
              key={team.id}
              team={team}
              onEdit={() => setEditing(team.id)}
              onDelete={() => handleDeleteTeam(team)}
              onTogglePaid={() => handleTogglePaid(team)}
            />
          )
        ))}
      </div>
    </div>
  );
}

function TeamRow({ team, onEdit, onDelete, onTogglePaid }) {
  return (
    <div className="team-mgmt__row">
      <div className="team-mgmt__meta">
        <span className="team-mgmt__team-name">{team.team_name}</span>
        <span className="team-mgmt__submitter">
          {team.submitted_by} · tiebreaker {team.tiebreaker}
        </span>
      </div>
      <div className="team-mgmt__picks">
        {[1, 2, 3, 4, 5, 6].map((tier) => (
          <div key={tier} className="team-mgmt__pick">
            <span className="team-mgmt__pick-tier">T{tier}</span>
            <span className="team-mgmt__pick-name">
              {team.picksByTier[tier]?.name || '—'}
            </span>
          </div>
        ))}
      </div>
      <label className={`team-mgmt__paid ${team.paid ? 'team-mgmt__paid--yes' : ''}`}>
        <input type="checkbox" checked={!!team.paid} onChange={onTogglePaid} />
        <span>Paid</span>
      </label>
      <div className="team-mgmt__actions">
        <button className="tournament-setup__btn tournament-setup__btn--ghost" onClick={onEdit}>Edit</button>
        <button className="tournament-setup__btn tournament-setup__btn--danger" onClick={onDelete}>Delete</button>
      </div>
    </div>
  );
}

function TeamEditor({ team, field, onSave, onCancel }) {
  const [teamName, setTeamName] = useState(team.team_name);
  const [submittedBy, setSubmittedBy] = useState(team.submitted_by);
  const [tiebreaker, setTiebreaker] = useState(String(team.tiebreaker));
  const [picks, setPicks] = useState(() => {
    const init = {};
    for (const tier of [1, 2, 3, 4, 5, 6]) {
      init[tier] = team.picksByTier[tier]?.id || '';
    }
    return init;
  });
  const [saving, setSaving] = useState(false);

  function setPick(tier, playerId) {
    setPicks((prev) => ({ ...prev, [tier]: playerId }));
  }

  async function handleSave(e) {
    e.preventDefault();
    setSaving(true);
    // Only send picks that actually changed (so we don't churn rows unnecessarily).
    const changedPicks = {};
    for (const tier of [1, 2, 3, 4, 5, 6]) {
      const original = team.picksByTier[tier]?.id || '';
      if (picks[tier] && picks[tier] !== original) changedPicks[tier] = picks[tier];
    }

    const patch = {};
    if (teamName !== team.team_name) patch.teamName = teamName;
    if (submittedBy !== team.submitted_by) patch.submittedBy = submittedBy;
    if (parseInt(tiebreaker, 10) !== team.tiebreaker) patch.tiebreaker = parseInt(tiebreaker, 10);
    if (Object.keys(changedPicks).length > 0) patch.picks = changedPicks;

    if (Object.keys(patch).length === 0) {
      onCancel();
      return;
    }
    await onSave(patch);
    setSaving(false);
  }

  return (
    <form className="team-mgmt__editor" onSubmit={handleSave}>
      <div className="team-mgmt__editor-row">
        <label className="team-mgmt__field">
          <span>Team Name</span>
          <input value={teamName} onChange={(e) => setTeamName(e.target.value)} required />
        </label>
        <label className="team-mgmt__field">
          <span>Submitter</span>
          <input value={submittedBy} onChange={(e) => setSubmittedBy(e.target.value)} required />
        </label>
        <label className="team-mgmt__field team-mgmt__field--narrow">
          <span>Tiebreaker</span>
          <input
            type="number"
            value={tiebreaker}
            onChange={(e) => setTiebreaker(e.target.value)}
            required
          />
        </label>
      </div>

      <div className="team-mgmt__picks-grid">
        {[1, 2, 3, 4, 5, 6].map((tier) => {
          const players = field[tier] || [];
          return (
            <label key={tier} className="team-mgmt__field">
              <span>{TIER_LABELS[tier]}</span>
              <select
                value={picks[tier]}
                onChange={(e) => setPick(tier, e.target.value)}
              >
                <option value="">— Select player —</option>
                {players.map((p) => (
                  <option key={p.id} value={p.id}>
                    {p.name}{p.odds != null ? `  (${formatOdds(p.odds)})` : ''}
                  </option>
                ))}
              </select>
            </label>
          );
        })}
      </div>

      <div className="team-mgmt__editor-actions">
        <button
          type="submit"
          className="tournament-setup__btn tournament-setup__btn--primary"
          disabled={saving}
        >
          {saving ? 'Saving…' : 'Save Changes'}
        </button>
        <button
          type="button"
          className="tournament-setup__btn tournament-setup__btn--ghost"
          onClick={onCancel}
          disabled={saving}
        >
          Cancel
        </button>
      </div>
    </form>
  );
}

function formatOdds(price) {
  if (price > 0) return `+${price}`;
  return String(price);
}
