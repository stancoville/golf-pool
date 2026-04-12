import React from 'react';
import { parDisplay } from '../lib/scoring.js';

/**
 * Tournament header — dark green panel with diagonal stripe texture,
 * gold pulsing status pill, big Playfair title, and a meta stats row.
 */
export default function Header({ tournament, ranked }) {
  const teamCount = ranked.length;
  const leader = ranked[0];
  const leaderPar = leader ? parDisplay(leader._par) : null;

  return (
    <header className="masters-header">
      <div className="masters-header__inner">
        <div className="masters-header__pill">
          <span className="masters-header__dot" />
          Round {tournament.currentRound} &middot; {tournament.status}
        </div>

        <h1 className="masters-header__title">
          The Masters <span className="masters-header__title-accent">Pool</span>
        </h1>

        <p className="masters-header__subtitle">
          {tournament.venue} &middot; {tournament.year}
        </p>

        <div className="masters-header__meta">
          <div className="masters-header__stat">
            <span className="masters-header__stat-label">Teams</span>
            <span className="masters-header__stat-value">{teamCount}</span>
          </div>
          <div className="masters-header__stat">
            <span className="masters-header__stat-label">Leader</span>
            <span className="masters-header__stat-value">
              {leader ? leader.teamName : '—'}
            </span>
          </div>
          <div className="masters-header__stat">
            <span className="masters-header__stat-label">Lead Score</span>
            <span
              className={`masters-header__stat-value masters-header__stat-value--${
                leaderPar ? leaderPar.cls : 'even'
              }`}
            >
              {leaderPar ? leaderPar.str : 'E'}
            </span>
          </div>
        </div>
      </div>
    </header>
  );
}
