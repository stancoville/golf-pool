import React from 'react';

/**
 * Tournament header — dark green panel with diagonal stripe texture,
 * pulsing status pill, and big Playfair title.
 */
export default function Header({ tournament }) {
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
      </div>
    </header>
  );
}
