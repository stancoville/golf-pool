import React, { useMemo, useState } from 'react';
import Header from '../components/Header.jsx';
import TeamCard from '../components/TeamCard.jsx';
import { useLeaderboard } from '../hooks/useLeaderboard.js';

const COURSE_PAR = 72;

function SearchIcon() {
  return (
    <svg
      width="18"
      height="18"
      viewBox="0 0 24 24"
      fill="none"
      stroke="currentColor"
      strokeWidth="2"
      strokeLinecap="round"
      strokeLinejoin="round"
      aria-hidden="true"
    >
      <circle cx="11" cy="11" r="7" />
      <line x1="21" y1="21" x2="16.65" y2="16.65" />
    </svg>
  );
}

/**
 * MainPage — adaptive based on tournament state.
 * Pre-tournament: registration form (TODO: Phase 5)
 * In progress / complete: leaderboard
 */
export default function MainPage() {
  const { ranked, players, tournament, lastSync } = useLeaderboard();

  // TODO: When registration is implemented, check tournament.registrationOpen
  // and show the registration form instead of the leaderboard.
  const showLeaderboard = true;

  if (!showLeaderboard) {
    return (
      <div className="app">
        <Header tournament={tournament} />
        <main className="app__main">
          <div className="empty">
            <p>Registration coming soon.</p>
          </div>
        </main>
      </div>
    );
  }

  return <Leaderboard ranked={ranked} players={players} tournament={tournament} lastSync={lastSync} />;
}

function Leaderboard({ ranked, players, tournament, lastSync }) {
  const [query, setQuery] = useState('');

  const filtered = useMemo(() => {
    const q = query.trim().toLowerCase();
    if (!q) return ranked;
    return ranked.filter((t) => {
      return (
        t.teamName.toLowerCase().includes(q) ||
        t.submittedBy.toLowerCase().includes(q)
      );
    });
  }, [ranked, query]);

  const lastSyncStr = lastSync
    ? lastSync.toLocaleTimeString([], {
        hour: 'numeric',
        minute: '2-digit',
      })
    : '—';

  return (
    <div className="app">
      <Header tournament={tournament} />

      <main className="app__main">
        <div className="toolbar">
          <div className="toolbar__search">
            <SearchIcon />
            <input
              type="search"
              className="toolbar__input"
              placeholder="Search team or player…"
              value={query}
              onChange={(e) => setQuery(e.target.value)}
              aria-label="Search teams"
            />
          </div>

          <div className="toolbar__refresh">
            <span className="toolbar__sync">Updated {lastSyncStr}</span>
          </div>
        </div>

        {filtered.length === 0 ? (
          <div className="empty">
            <p>No teams match &ldquo;{query}&rdquo;.</p>
          </div>
        ) : (
          <div className="leaderboard-grid">
            {filtered.map((team) => (
              <TeamCard
                key={team.id}
                team={team}
                players={players}
                coursePar={COURSE_PAR}
                currentRound={tournament.currentRound}
              />
            ))}
          </div>
        )}

        <footer className="footer">
          <p>
            Best 4 of 6 players count. Cut &amp; WD players are charged 80
            strokes per missed round. Ties broken by closest tiebreaker guess to
            the winner&rsquo;s final score.
          </p>
        </footer>
      </main>
    </div>
  );
}
