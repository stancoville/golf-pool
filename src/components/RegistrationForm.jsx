import React, { useCallback, useEffect, useState } from 'react';
import TierPicker from './TierPicker.jsx';

/**
 * RegistrationForm — full team registration flow.
 * Fetches field from /api/register, shows tier picker + form fields.
 */
export default function RegistrationForm() {
  const [data, setData] = useState(null);
  const [loading, setLoading] = useState(true);
  const [picks, setPicks] = useState({});
  const [teamName, setTeamName] = useState('');
  const [submittedBy, setSubmittedBy] = useState('');
  const [tiebreaker, setTiebreaker] = useState('');
  const [submitting, setSubmitting] = useState(false);
  const [error, setError] = useState(null);
  const [success, setSuccess] = useState(false);

  const fetchField = useCallback(async () => {
    try {
      const res = await fetch('/api/register');
      const json = await res.json();
      setData(json);
    } catch (err) {
      setError('Failed to load tournament data');
    } finally {
      setLoading(false);
    }
  }, []);

  useEffect(() => { fetchField(); }, [fetchField]);

  function handlePick(tier, playerId) {
    setPicks((prev) => ({ ...prev, [tier]: playerId }));
  }

  async function handleSubmit(e) {
    e.preventDefault();
    setError(null);
    setSubmitting(true);

    const picksCount = Object.keys(picks).length;
    if (picksCount !== 6) {
      setError(`Pick one player from each tier (${picksCount}/6 selected)`);
      setSubmitting(false);
      return;
    }

    try {
      const res = await fetch('/api/register', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          tournamentId: data.tournament.id,
          teamName,
          submittedBy,
          tiebreaker: parseInt(tiebreaker),
          picks,
        }),
      });

      const json = await res.json();
      if (!res.ok) throw new Error(json.error || 'Registration failed');

      setSuccess(true);
    } catch (err) {
      setError(err.message);
    } finally {
      setSubmitting(false);
    }
  }

  if (loading) {
    return <div className="empty"><p>Loading tournament…</p></div>;
  }

  if (!data?.tournament) {
    return <div className="empty"><p>No active tournament found.</p></div>;
  }

  if (!data.tournament.registrationOpen) {
    return (
      <div className="empty">
        <p>Registration for <strong>{data.tournament.name}</strong> is currently closed.</p>
      </div>
    );
  }

  if (success) {
    return (
      <div className="registration-success">
        <h2 className="registration-success__title">Team Registered!</h2>
        <p className="registration-success__text">
          Your team <strong>{teamName}</strong> has been entered in the {data.tournament.name} pool.
        </p>
        <p className="registration-success__text">
          {data.teamCount + 1} teams registered so far.
        </p>
        <button
          className="registration-success__btn"
          onClick={() => {
            setSuccess(false);
            setPicks({});
            setTeamName('');
            setSubmittedBy('');
            setTiebreaker('');
          }}
        >
          Register Another Team
        </button>
      </div>
    );
  }

  const picksCount = Object.keys(picks).length;

  return (
    <form className="registration-form" onSubmit={handleSubmit}>
      <div className="registration-form__header">
        <h2 className="registration-form__title">Register Your Team</h2>
        <p className="registration-form__subtitle">
          {data.tournament.name} {data.tournament.year} — Pick one player from each tier
        </p>
        <p className="registration-form__count">
          {data.teamCount} team{data.teamCount !== 1 ? 's' : ''} registered
        </p>
      </div>

      <TierPicker tiers={data.tiers} picks={picks} onPick={handlePick} />

      <div className="registration-form__fields">
        <label className="registration-form__label">
          Team Name
          <input
            type="text"
            className="registration-form__input"
            value={teamName}
            onChange={(e) => setTeamName(e.target.value)}
            required
            placeholder="e.g. Amen Corner Crew"
          />
        </label>
        <label className="registration-form__label">
          Your Name
          <input
            type="text"
            className="registration-form__input"
            value={submittedBy}
            onChange={(e) => setSubmittedBy(e.target.value)}
            required
            placeholder="e.g. John Smith"
          />
        </label>
        <label className="registration-form__label">
          Tiebreaker
          <span className="registration-form__hint">
            Predict the winner's final score relative to par (e.g. -12)
          </span>
          <input
            type="number"
            className="registration-form__input"
            value={tiebreaker}
            onChange={(e) => setTiebreaker(e.target.value)}
            required
            placeholder="-12"
          />
        </label>
      </div>

      {error && <p className="registration-form__error">{error}</p>}

      <button
        type="submit"
        className="registration-form__submit"
        disabled={submitting || picksCount !== 6}
      >
        {submitting ? 'Submitting…' : `Submit Team (${picksCount}/6 picks)`}
      </button>
    </form>
  );
}
