import React from 'react';
import {
  parDisplay,
  playerRounds,
  playerTotal,
  roundsPlayed,
} from '../lib/scoring.js';

const ROUND_LABELS = ['R1', 'R2', 'R3', 'R4'];

/**
 * A single team card. Shows the team header, tiebreaker strip, and a row
 * for every player on the roster with their per-round scores.
 */
export default function TeamCard({ team, players, coursePar }) {
  const teamPar = parDisplay(team._par);

  return (
    <article className="team-card">
      <div className="team-card__header">
        <div className="team-card__rank">
          {team.tied ? `T${team.rank}` : team.rank}
        </div>
        <div className="team-card__heading">
          <h2 className="team-card__name">{team.teamName}</h2>
          <p className="team-card__by">by {team.submittedBy}</p>
        </div>
        <div className="team-card__totals">
          <div className="team-card__strokes">{team._score}</div>
          <div className={`team-card__par team-card__par--${teamPar.cls}`}>
            {teamPar.str}
          </div>
        </div>
      </div>

      <div className="team-card__tiebreaker">
        <span className="team-card__tiebreaker-label">Tiebreaker</span>
        <span className="team-card__tiebreaker-value">
          {team.tiebreaker > 0 ? `+${team.tiebreaker}` : team.tiebreaker}
        </span>
      </div>

      <div className="team-card__table">
        <div className="team-card__row team-card__row--head">
          <div className="team-card__col team-card__col--player">Player</div>
          <div className="team-card__col team-card__col--badge" />
          {ROUND_LABELS.map((label) => (
            <div key={label} className="team-card__col team-card__col--round">
              {label}
            </div>
          ))}
          <div className="team-card__col team-card__col--total">TOT</div>
          <div className="team-card__col team-card__col--par">PAR</div>
        </div>

        {team.players.map((slug) => {
          const p = players[slug];
          if (!p) {
            return (
              <div key={slug} className="team-card__row team-card__row--missing">
                <div className="team-card__col team-card__col--player">
                  Unknown player
                </div>
              </div>
            );
          }
          return (
            <PlayerRow
              key={slug}
              slug={slug}
              player={p}
              coursePar={coursePar}
            />
          );
        })}
      </div>
    </article>
  );
}

function PlayerRow({ slug, player, coursePar }) {
  const rounds = playerRounds(player);
  const total = playerTotal(player);
  const played = roundsPlayed(player);
  const par = played * coursePar;
  const diff = played > 0 ? total - par : 0;
  const parText = parDisplay(diff);

  const isCut = player.status === 'cut';
  const isWd = player.status === 'wd';
  const isPenalized = isCut || isWd;

  const rowClass = [
    'team-card__row',
    isPenalized ? 'team-card__row--penalized' : '',
  ]
    .filter(Boolean)
    .join(' ');

  const badgeClass = isCut
    ? 'team-card__badge team-card__badge--cut'
    : isWd
      ? 'team-card__badge team-card__badge--wd'
      : '';

  return (
    <div className={rowClass}>
      <div
        className={`team-card__col team-card__col--player ${
          isPenalized ? 'team-card__strike' : ''
        }`}
        title={slug}
      >
        {player.name}
      </div>
      <div className="team-card__col team-card__col--badge">
        {isCut && <span className={badgeClass}>CUT</span>}
        {isWd && <span className={badgeClass}>WD</span>}
      </div>
      {rounds.map((value, idx) => {
        const original = player[`r${idx + 1}`];
        const isPenaltyRound = isPenalized && original == null;
        const cellClass = [
          'team-card__col',
          'team-card__col--round',
          isPenaltyRound ? 'team-card__cell--penalty' : '',
        ]
          .filter(Boolean)
          .join(' ');
        return (
          <div key={idx} className={cellClass}>
            {value == null ? '—' : value}
          </div>
        );
      })}
      <div className="team-card__col team-card__col--total">{total || '—'}</div>
      <div
        className={`team-card__col team-card__col--par team-card__par--${parText.cls}`}
      >
        {played > 0 ? parText.str : '—'}
      </div>
    </div>
  );
}
