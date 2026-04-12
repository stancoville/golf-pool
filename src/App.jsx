import React, { useEffect, useMemo, useState } from 'react';
import Header from './components/Header.jsx';
import TeamCard from './components/TeamCard.jsx';
import { COURSE_PAR } from './data/mockData.js';
import { useLeaderboard } from './hooks/useLeaderboard.js';

const ROUND_TABS = [1, 2, 3, 4];

export default function App() {
  const { ranked, players, tournament, loading, lastSync, refresh } =
    useLeaderboard();

  const [query, setQuery] = useState('');
  const [activeRound, setActiveRound] = useState(tournament.currentRound);

  // Sync the active round whenever the tournament's current round changes.
  useEffect(() => {
    setActiveRound(tournament.currentRound);
  }, [tournament.currentRound]);

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
    <div className="app" data-active-round={activeRound}>
      <Header tournament={tournament} />

      <main className="app__main">
        <div className="toolbar">
          <div className="toolbar__search">
            <SearchIcon />
            <input
              type="search"
              className="toolbar__input"
              placeholder="Search team or player picker…"
              value={query}
              onChange={(e) => setQuery(e.target.value)}
              aria-label="Search teams"
            />
          </div>

          <div className="toolbar__rounds" role="tablist" aria-label="Rounds">
            {ROUND_TABS.map((r) => {
              const isActive = r === activeRound;
              return (
                <button
                  key={r}
                  type="button"
                  role="tab"
                  aria-selected={isActive}
                  className={`round-tab ${isActive ? 'round-tab--active' : ''}`}
                  onClick={() => setActiveRound(r)}
                >
                  R{r}
                </button>
              );
            })}
          </div>

          <div className="toolbar__refresh">
            <span className="toolbar__sync">Updated {lastSyncStr}</span>
            <button
              type="button"
              className={`refresh-btn ${loading ? 'refresh-btn--spinning' : ''}`}
              onClick={refresh}
              disabled={loading}
              aria-label="Refresh leaderboard"
            >
              <RefreshIcon />
              <span>Refresh</span>
            </button>
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
            Lowest total strokes wins. Cut &amp; WD players are charged 80
            strokes per missed round. Ties broken by closest tiebreaker guess to
            the winner&rsquo;s final score.
          </p>
        </footer>
      </main>

      <style>{styles}</style>
    </div>
  );
}

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

function RefreshIcon() {
  return (
    <svg
      width="16"
      height="16"
      viewBox="0 0 24 24"
      fill="none"
      stroke="currentColor"
      strokeWidth="2.2"
      strokeLinecap="round"
      strokeLinejoin="round"
      aria-hidden="true"
    >
      <polyline points="23 4 23 10 17 10" />
      <polyline points="1 20 1 14 7 14" />
      <path d="M3.51 9a9 9 0 0 1 14.85-3.36L23 10" />
      <path d="M20.49 15a9 9 0 0 1-14.85 3.36L1 14" />
    </svg>
  );
}

// All component CSS lives here so deployment is a single bundle. Global tokens
// (CSS variables) live in src/index.css.
const styles = `
.app {
  min-height: 100vh;
  display: flex;
  flex-direction: column;
  background: var(--cream);
}

.app__main {
  flex: 1;
  width: 100%;
  max-width: 1380px;
  margin: 0 auto;
  padding: 28px 28px 64px;
}

/* ----- Header ----- */
.masters-header {
  position: relative;
  background: linear-gradient(180deg, #007a54 0%, var(--green-deep) 100%);
  color: var(--cream);
  border-bottom: 1px solid rgba(251, 243, 8, 0.3);
  overflow: hidden;
}
.masters-header::before {
  content: "";
  position: absolute;
  inset: 0;
  background-image: repeating-linear-gradient(
    135deg,
    rgba(255, 255, 255, 0.035) 0px,
    rgba(255, 255, 255, 0.035) 2px,
    transparent 2px,
    transparent 14px
  );
  pointer-events: none;
}
.masters-header::after {
  content: "";
  position: absolute;
  left: 0;
  right: 0;
  bottom: 0;
  height: 3px;
  background: linear-gradient(
    90deg,
    transparent,
    var(--accent) 30%,
    var(--accent-light) 50%,
    var(--accent) 70%,
    transparent
  );
}
.masters-header__inner {
  position: relative;
  max-width: 1380px;
  margin: 0 auto;
  padding: 38px 28px 30px;
  text-align: center;
}
.masters-header__pill {
  display: inline-flex;
  align-items: center;
  gap: 10px;
  padding: 6px 16px;
  border-radius: 999px;
  background: rgba(0, 0, 0, 0.3);
  border: 1px solid rgba(251, 243, 8, 0.4);
  font-family: 'DM Mono', ui-monospace, monospace;
  font-size: 12px;
  letter-spacing: 0.12em;
  text-transform: uppercase;
  color: var(--accent-light);
}
.masters-header__dot {
  width: 9px;
  height: 9px;
  border-radius: 50%;
  background: var(--accent);
  box-shadow: 0 0 0 0 rgba(251, 243, 8, 0.7);
  animation: masters-pulse 2s infinite;
}
@keyframes masters-pulse {
  0% {
    box-shadow: 0 0 0 0 rgba(251, 243, 8, 0.7);
  }
  70% {
    box-shadow: 0 0 0 12px rgba(251, 243, 8, 0);
  }
  100% {
    box-shadow: 0 0 0 0 rgba(251, 243, 8, 0);
  }
}
.masters-header__title {
  font-family: 'Playfair Display', Georgia, serif;
  font-weight: 900;
  font-size: clamp(40px, 6vw, 68px);
  line-height: 1.05;
  margin: 16px 0 4px;
  letter-spacing: -0.01em;
  color: var(--white);
}
.masters-header__title-accent {
  font-style: italic;
  font-weight: 700;
  background: linear-gradient(180deg, var(--accent-light), var(--accent));
  -webkit-background-clip: text;
  background-clip: text;
  -webkit-text-fill-color: transparent;
}
.masters-header__subtitle {
  font-family: 'EB Garamond', serif;
  font-style: italic;
  font-size: 18px;
  margin: 0;
  color: rgba(245, 245, 240, 0.72);
}

/* ----- Toolbar ----- */
.toolbar {
  display: flex;
  align-items: center;
  flex-wrap: wrap;
  gap: 16px;
  margin: 28px 0 22px;
  padding: 14px 18px;
  background: var(--white);
  border: 1px solid var(--card-border);
  border-radius: 12px;
  box-shadow: var(--shadow-card);
}
.toolbar__search {
  position: relative;
  flex: 1 1 280px;
  display: flex;
  align-items: center;
  gap: 10px;
  padding: 0 14px;
  background: var(--cream);
  border: 1px solid rgba(0, 103, 71, 0.12);
  border-radius: 8px;
  color: var(--text-muted);
  transition: border-color 0.2s ease, box-shadow 0.2s ease;
}
.toolbar__search:focus-within {
  border-color: var(--accent-dim);
  box-shadow: 0 0 0 3px rgba(251, 243, 8, 0.18);
}
.toolbar__input {
  flex: 1;
  padding: 10px 0;
  border: none;
  background: transparent;
  font-size: 16px;
  color: var(--text-dark);
  outline: none;
}
.toolbar__input::placeholder {
  color: var(--text-muted);
  font-style: italic;
}

.toolbar__rounds {
  display: flex;
  gap: 4px;
  padding: 4px;
  background: var(--cream);
  border: 1px solid rgba(0, 103, 71, 0.1);
  border-radius: 10px;
}
.round-tab {
  appearance: none;
  border: none;
  background: transparent;
  padding: 8px 16px;
  font-family: 'DM Mono', ui-monospace, monospace;
  font-size: 13px;
  font-weight: 500;
  letter-spacing: 0.06em;
  color: var(--text-muted);
  border-radius: 6px;
  position: relative;
  transition: color 0.2s ease, background-color 0.2s ease;
}
.round-tab:hover {
  color: var(--green-deep);
}
.round-tab--active {
  color: var(--green-deep);
  background: var(--white);
  box-shadow: 0 1px 2px rgba(0, 77, 53, 0.1);
}
.round-tab--active::after {
  content: "";
  position: absolute;
  left: 16%;
  right: 16%;
  bottom: -2px;
  height: 3px;
  border-radius: 2px;
  background: linear-gradient(90deg, var(--accent), var(--accent-dim));
}

.toolbar__refresh {
  display: flex;
  align-items: center;
  gap: 12px;
  margin-left: auto;
}
.toolbar__sync {
  font-family: 'DM Mono', ui-monospace, monospace;
  font-size: 11px;
  letter-spacing: 0.08em;
  text-transform: uppercase;
  color: var(--text-muted);
}
.refresh-btn {
  display: inline-flex;
  align-items: center;
  gap: 8px;
  padding: 8px 14px;
  border: 1px solid var(--green-mid);
  border-radius: 8px;
  background: var(--green-deep);
  color: var(--white);
  font-family: 'DM Mono', ui-monospace, monospace;
  font-size: 12px;
  letter-spacing: 0.1em;
  text-transform: uppercase;
  transition: background-color 0.18s ease, transform 0.18s ease;
}
.refresh-btn:hover:not(:disabled) {
  background: var(--green-mid);
  transform: translateY(-1px);
}
.refresh-btn:disabled {
  opacity: 0.7;
  cursor: not-allowed;
}
.refresh-btn svg {
  transition: transform 0.6s ease;
}
.refresh-btn--spinning svg {
  animation: refresh-spin 0.9s linear infinite;
}
@keyframes refresh-spin {
  from { transform: rotate(0deg); }
  to   { transform: rotate(360deg); }
}

/* ----- Grid + cards ----- */
.leaderboard-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(340px, 1fr));
  gap: 22px;
}

.empty {
  padding: 60px 20px;
  text-align: center;
  font-style: italic;
  color: var(--text-muted);
}

.team-card {
  background: var(--white);
  border: 1px solid var(--card-border);
  border-radius: 14px;
  box-shadow: var(--shadow-card);
  overflow: hidden;
  transition: transform 0.2s ease, box-shadow 0.2s ease;
  display: flex;
  flex-direction: column;
}
.team-card:hover {
  transform: translateY(-3px);
  box-shadow: var(--shadow-hover);
}

.team-card__header {
  position: relative;
  display: flex;
  align-items: center;
  gap: 12px;
  padding: 14px 14px 16px;
  background: linear-gradient(180deg, #007a54 0%, var(--green-deep) 100%);
  color: var(--white);
}
.team-card__header::after {
  content: "";
  position: absolute;
  left: 14px;
  right: 14px;
  bottom: 0;
  height: 2px;
  background: linear-gradient(
    90deg,
    transparent,
    var(--accent) 20%,
    var(--accent-light) 50%,
    var(--accent) 80%,
    transparent
  );
}
.team-card__rank {
  flex: 0 0 auto;
  min-width: 42px;
  height: 42px;
  display: flex;
  align-items: center;
  justify-content: center;
  font-family: 'Playfair Display', serif;
  font-weight: 700;
  font-size: 20px;
  color: var(--green-dark);
  background: linear-gradient(180deg, var(--accent-light), var(--accent));
  border-radius: 50%;
  border: 2px solid rgba(255, 255, 255, 0.3);
  padding: 0 5px;
}
.team-card__heading {
  flex: 1 1 auto;
  min-width: 0;
}
.team-card__name {
  font-family: 'Playfair Display', serif;
  font-size: 18px;
  font-weight: 700;
  margin: 0;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}
.team-card__by {
  margin: 2px 0 0;
  font-style: italic;
  font-size: 13px;
  color: rgba(245, 245, 240, 0.65);
}
.team-card__totals {
  flex: 0 0 auto;
  text-align: right;
  display: flex;
  flex-direction: column;
  align-items: flex-end;
  gap: 2px;
}
.team-card__par-big {
  font-family: 'DM Mono', ui-monospace, monospace;
  font-size: 28px;
  font-weight: 500;
  line-height: 1;
  letter-spacing: -0.01em;
}
.team-card__strokes-small {
  font-family: 'DM Mono', ui-monospace, monospace;
  font-size: 11px;
  letter-spacing: 0.06em;
  color: rgba(245, 245, 240, 0.55);
  text-transform: uppercase;
}

/* Header (dark bg) — bright accent colors */
.team-card__header .team-card__par--under { color: var(--accent); }
.team-card__header .team-card__par--over  { color: #f3a59c; }
.team-card__header .team-card__par--even  { color: rgba(245, 245, 240, 0.85); }

/* Card body (white bg) — readable colors */
.team-card__col.team-card__par--under { color: var(--green-deep); font-weight: 500; }
.team-card__col.team-card__par--over  { color: var(--red);        font-weight: 500; }
.team-card__col.team-card__par--even  { color: var(--text-dark); }

.team-card__tiebreaker {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 7px 14px;
  background: var(--cream-dark);
  border-bottom: 1px solid var(--card-border);
  font-family: 'DM Mono', ui-monospace, monospace;
  font-size: 11px;
  letter-spacing: 0.1em;
  text-transform: uppercase;
  color: var(--text-muted);
}
.team-card__tiebreaker-value {
  color: var(--green-deep);
  font-weight: 500;
}

/* Full-width table — no horizontal padding so names stretch to edges */
.team-card__table {
  padding: 0 0 6px;
}
.team-card__row {
  display: grid;
  grid-template-columns: minmax(0, 1.6fr) repeat(4, minmax(0, 0.8fr)) minmax(0, 0.7fr) minmax(0, 0.7fr);
  align-items: center;
  gap: 0;
  padding: 6px 10px;
  border-bottom: 1px solid rgba(0, 103, 71, 0.06);
  font-size: 13px;
}
.team-card__row:last-child {
  border-bottom: none;
}
.team-card__row--head {
  font-family: 'DM Mono', ui-monospace, monospace;
  font-size: 9px;
  letter-spacing: 0.08em;
  text-transform: uppercase;
  color: var(--text-muted);
  border-bottom: 1px solid var(--card-border);
  padding-top: 8px;
  padding-bottom: 5px;
}
.team-card__row--penalized {
  color: var(--cut-gray);
}
.team-card__col {
  text-align: center;
  font-family: 'DM Mono', ui-monospace, monospace;
  font-variant-numeric: tabular-nums;
  min-width: 0;
}
.team-card__col--player {
  text-align: left;
  font-family: 'EB Garamond', serif;
  font-size: 14px;
  color: var(--text-dark);
  display: flex;
  align-items: center;
  gap: 5px;
  min-width: 0;
}
.team-card__player-name {
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  min-width: 0;
}
.team-card__row--penalized .team-card__col--player {
  color: var(--cut-gray);
}
.team-card__strike .team-card__player-name {
  text-decoration: line-through;
  text-decoration-color: rgba(138, 158, 148, 0.7);
}
.team-card__col--total {
  font-weight: 500;
  color: var(--text-dark);
  font-size: 12px;
}
.team-card__row--penalized .team-card__col--total {
  color: var(--cut-gray);
}
.team-card__col--par {
  font-size: 12px;
}

/* Round cells — two-line slot so live + finished rounds align cleanly. */
.team-card__col--round {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  line-height: 1.05;
  padding: 2px 0;
  border-radius: 4px;
}
.team-card__round-main {
  font-size: 12px;
  font-variant-numeric: tabular-nums;
}
.team-card__round-sub {
  font-size: 8px;
  margin-top: 1px;
  color: var(--text-muted);
  letter-spacing: 0.04em;
  text-transform: uppercase;
  line-height: 1;
}
.team-card__cell--live {
  background: rgba(0, 103, 71, 0.06);
}
.team-card__cell--live .team-card__round-main {
  font-weight: 500;
}
.team-card__cell--penalty .team-card__round-main {
  font-style: italic;
  color: var(--cut-gray);
}

.team-card__badge {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  flex: 0 0 auto;
  font-family: 'DM Mono', ui-monospace, monospace;
  font-size: 8px;
  font-weight: 500;
  letter-spacing: 0.06em;
  padding: 1px 3px;
  border-radius: 3px;
  text-transform: uppercase;
}
.team-card__badge--cut {
  background: rgba(192, 57, 43, 0.12);
  color: var(--red);
}
.team-card__badge--wd {
  background: rgba(138, 158, 148, 0.18);
  color: var(--text-muted);
}

/* Highlight the column matching the active round tab */
.app[data-active-round="1"] .team-card__row > .team-card__col--round:nth-of-type(2),
.app[data-active-round="2"] .team-card__row > .team-card__col--round:nth-of-type(3),
.app[data-active-round="3"] .team-card__row > .team-card__col--round:nth-of-type(4),
.app[data-active-round="4"] .team-card__row > .team-card__col--round:nth-of-type(5) {
  background: rgba(251, 243, 8, 0.12);
}

/* ----- Footer ----- */
.footer {
  margin-top: 36px;
  padding: 18px 20px;
  text-align: center;
  font-style: italic;
  font-size: 14px;
  color: var(--text-muted);
  border-top: 1px solid var(--card-border);
}

/* ----- Responsive ----- */
@media (max-width: 640px) {
  .app__main {
    padding: 16px 10px 48px;
  }
  .toolbar {
    padding: 10px;
    gap: 10px;
  }
  .toolbar__refresh {
    margin-left: 0;
  }
  .masters-header__inner {
    padding: 28px 16px 22px;
  }
  .leaderboard-grid {
    grid-template-columns: 1fr;
    gap: 16px;
  }
  .team-card__header {
    padding: 12px 10px 14px;
    gap: 10px;
  }
  .team-card__header::after {
    left: 10px;
    right: 10px;
  }
  .team-card__rank {
    min-width: 38px;
    height: 38px;
    font-size: 18px;
  }
  .team-card__name {
    font-size: 16px;
  }
  .team-card__par-big {
    font-size: 24px;
  }
  .team-card__tiebreaker {
    padding: 6px 10px;
  }
  .team-card__row {
    padding: 5px 8px;
    font-size: 12px;
  }
  .team-card__col--player {
    font-size: 13px;
    gap: 4px;
  }
  .team-card__round-main {
    font-size: 11px;
  }
  .team-card__round-sub {
    font-size: 7px;
  }
  .team-card__col--total {
    font-size: 11px;
  }
  .team-card__col--par {
    font-size: 11px;
  }
  .team-card__badge {
    font-size: 7px;
    padding: 0 2px;
  }
}
`;
