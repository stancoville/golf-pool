import React from 'react';

/**
 * Tournament header — themed gradient panel with status pill and title.
 * Adapts to any tournament name.
 */
export default function Header({ tournament }) {
  const name = tournament.name || 'Golf Pool';

  return (
    <header className="masters-header">
      <div className="masters-header__inner">
        <div className="masters-header__pill">
          <span className="masters-header__dot" />
          Round {tournament.currentRound} &middot; {tournament.status}
        </div>

        <h1 className="masters-header__title">
          {name} <span className="masters-header__title-accent">Pool</span>
        </h1>

        {tournament.venue && (
          <p className="masters-header__subtitle">
            {tournament.venue} &middot; {tournament.year}
          </p>
        )}
      </div>
    </header>
  );
}
