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
      <Header tournament={tournament} ranked={ranked} />

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
  background: linear-gradient(180deg, #1f4631 0%, #1a3a2a 100%);
  color: var(--cream);
  border-bottom: 1px solid rgba(201, 168, 76, 0.35);
  overflow: hidden;
}
.masters-header::before {
  content: "";
  position: absolute;
  inset: 0;
  background-image: repeating-linear-gradient(
    135deg,
    rgba(255, 255, 255, 0.04) 0px,
    rgba(255, 255, 255, 0.04) 2px,
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
    var(--gold) 30%,
    var(--gold-light) 50%,
    var(--gold) 70%,
    transparent
  );
}
.masters-header__inner {
  position: relative;
  max-width: 1380px;
  margin: 0 auto;
  padding: 44px 28px 38px;
  text-align: center;
}
.masters-header__pill {
  display: inline-flex;
  align-items: center;
  gap: 10px;
  padding: 6px 16px;
  border-radius: 999px;
  background: rgba(0, 0, 0, 0.32);
  border: 1px solid rgba(201, 168, 76, 0.45);
  font-family: 'DM Mono', ui-monospace, monospace;
  font-size: 12px;
  letter-spacing: 0.12em;
  text-transform: uppercase;
  color: var(--gold-light);
}
.masters-header__dot {
  width: 9px;
  height: 9px;
  border-radius: 50%;
  background: var(--gold-light);
  box-shadow: 0 0 0 0 rgba(232, 201, 122, 0.75);
  animation: masters-pulse 2s infinite;
}
@keyframes masters-pulse {
  0% {
    box-shadow: 0 0 0 0 rgba(232, 201, 122, 0.75);
  }
  70% {
    box-shadow: 0 0 0 12px rgba(232, 201, 122, 0);
  }
  100% {
    box-shadow: 0 0 0 0 rgba(232, 201, 122, 0);
  }
}
.masters-header__title {
  font-family: 'Playfair Display', Georgia, serif;
  font-weight: 900;
  font-size: clamp(40px, 6vw, 68px);
  line-height: 1.05;
  margin: 18px 0 6px;
  letter-spacing: -0.01em;
  color: var(--cream);
}
.masters-header__title-accent {
  font-style: italic;
  font-weight: 700;
  color: var(--gold-light);
  background: linear-gradient(180deg, var(--gold-light), var(--gold));
  -webkit-background-clip: text;
  background-clip: text;
  -webkit-text-fill-color: transparent;
}
.masters-header__subtitle {
  font-family: 'EB Garamond', serif;
  font-style: italic;
  font-size: 18px;
  margin: 0 0 22px;
  color: rgba(250, 246, 238, 0.78);
}
.masters-header__meta {
  display: flex;
  justify-content: center;
  gap: 36px;
  flex-wrap: wrap;
}
.masters-header__stat {
  display: flex;
  flex-direction: column;
  align-items: center;
  min-width: 96px;
}
.masters-header__stat-label {
  font-family: 'DM Mono', ui-monospace, monospace;
  font-size: 10px;
  letter-spacing: 0.18em;
  text-transform: uppercase;
  color: rgba(250, 246, 238, 0.55);
  margin-bottom: 4px;
}
.masters-header__stat-value {
  font-family: 'Playfair Display', serif;
  font-weight: 700;
  font-size: 22px;
  color: var(--cream);
}
.masters-header__stat-value--under {
  color: var(--gold-light);
}
.masters-header__stat-value--over {
  color: #f3a59c;
}
.masters-header__stat-value--even {
  color: var(--cream);
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
  border: 1px solid rgba(26, 58, 42, 0.12);
  border-radius: 8px;
  color: var(--text-muted);
  transition: border-color 0.2s ease, box-shadow 0.2s ease;
}
.toolbar__search:focus-within {
  border-color: var(--gold);
  box-shadow: 0 0 0 3px rgba(201, 168, 76, 0.18);
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
  border: 1px solid rgba(26, 58, 42, 0.1);
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
  box-shadow: 0 1px 2px rgba(26, 58, 42, 0.1);
}
.round-tab--active::after {
  content: "";
  position: absolute;
  left: 16%;
  right: 16%;
  bottom: -2px;
  height: 3px;
  border-radius: 2px;
  background: linear-gradient(90deg, var(--gold-light), var(--gold));
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
  color: var(--cream);
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
  gap: 14px;
  padding: 16px 18px 18px;
  background: linear-gradient(180deg, #224a34 0%, #1a3a2a 100%);
  color: var(--cream);
}
.team-card__header::after {
  content: "";
  position: absolute;
  left: 18px;
  right: 18px;
  bottom: 0;
  height: 2px;
  background: linear-gradient(
    90deg,
    transparent,
    var(--gold) 20%,
    var(--gold-light) 50%,
    var(--gold) 80%,
    transparent
  );
}
.team-card__rank {
  flex: 0 0 auto;
  min-width: 46px;
  height: 46px;
  display: flex;
  align-items: center;
  justify-content: center;
  font-family: 'Playfair Display', serif;
  font-weight: 700;
  font-size: 22px;
  color: var(--green-deep);
  background: linear-gradient(180deg, var(--gold-light), var(--gold));
  border-radius: 50%;
  border: 2px solid rgba(250, 246, 238, 0.4);
  padding: 0 6px;
}
.team-card__heading {
  flex: 1 1 auto;
  min-width: 0;
}
.team-card__name {
  font-family: 'Playfair Display', serif;
  font-size: 19px;
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
  color: rgba(250, 246, 238, 0.7);
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
  color: rgba(250, 246, 238, 0.62);
  text-transform: uppercase;
}

/* Header (dark bg) — bright accent colors */
.team-card__header .team-card__par--under { color: var(--gold-light); }
.team-card__header .team-card__par--over  { color: #f3a59c; }
.team-card__header .team-card__par--even  { color: rgba(250, 246, 238, 0.85); }

/* Card body (white bg) — readable colors */
.team-card__col.team-card__par--under { color: var(--green-mid); font-weight: 500; }
.team-card__col.team-card__par--over  { color: var(--red);       font-weight: 500; }
.team-card__col.team-card__par--even  { color: var(--text-dark); }

.team-card__tiebreaker {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 8px 18px;
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

.team-card__table {
  padding: 4px 4px 10px;
}
.team-card__row {
  display: grid;
  grid-template-columns: minmax(0, 1.55fr) repeat(4, minmax(0, 0.85fr)) minmax(0, 0.8fr) minmax(0, 0.75fr);
  align-items: center;
  gap: 2px;
  padding: 6px 10px;
  border-bottom: 1px solid rgba(26, 58, 42, 0.06);
  font-size: 14px;
}
.team-card__row:last-child {
  border-bottom: none;
}
.team-card__row--head {
  font-family: 'DM Mono', ui-monospace, monospace;
  font-size: 10px;
  letter-spacing: 0.08em;
  text-transform: uppercase;
  color: var(--text-muted);
  border-bottom: 1px solid var(--card-border);
  padding-top: 8px;
  padding-bottom: 6px;
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
  font-size: 15px;
  color: var(--text-dark);
  display: flex;
  align-items: center;
  gap: 6px;
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
  text-decoration-color: rgba(154, 171, 162, 0.7);
}
.team-card__col--total {
  font-weight: 500;
  color: var(--text-dark);
  font-size: 13px;
}
.team-card__row--penalized .team-card__col--total {
  color: var(--cut-gray);
}
.team-card__col--par {
  font-size: 13px;
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
  font-size: 13px;
  font-variant-numeric: tabular-nums;
}
.team-card__round-sub {
  font-size: 9px;
  margin-top: 2px;
  color: var(--text-muted);
  letter-spacing: 0.04em;
  text-transform: uppercase;
  min-height: 11px;
  line-height: 1;
}
.team-card__cell--live {
  background: rgba(26, 58, 42, 0.05);
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
  font-size: 9px;
  font-weight: 500;
  letter-spacing: 0.06em;
  padding: 1px 4px;
  border-radius: 3px;
  text-transform: uppercase;
}
.team-card__badge--cut {
  background: rgba(192, 57, 43, 0.12);
  color: var(--red);
}
.team-card__badge--wd {
  background: rgba(122, 144, 128, 0.18);
  color: var(--text-muted);
}

/* Highlight the column matching the active round tab */
.app[data-active-round="1"] .team-card__row > .team-card__col--round:nth-of-type(2),
.app[data-active-round="2"] .team-card__row > .team-card__col--round:nth-of-type(3),
.app[data-active-round="3"] .team-card__row > .team-card__col--round:nth-of-type(4),
.app[data-active-round="4"] .team-card__row > .team-card__col--round:nth-of-type(5) {
  background: rgba(201, 168, 76, 0.14);
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
    padding: 18px 16px 48px;
  }
  .toolbar {
    padding: 12px;
  }
  .toolbar__refresh {
    margin-left: 0;
  }
  .masters-header__inner {
    padding: 32px 18px 28px;
  }
  .masters-header__meta {
    gap: 22px;
  }
  .team-card__row {
    grid-template-columns: minmax(0, 1.4fr) 26px repeat(4, 1fr) 1fr 0.9fr;
    font-size: 13px;
    padding: 7px 10px;
  }
  .team-card__col--player {
    font-size: 14px;
  }
}
`;
