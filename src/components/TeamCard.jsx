import React from 'react';
import {
  bestPlayerIndices,
  isRoundInProgress,
  parDisplay,
  playerParRelative,
  playerRounds,
  playerTotal,
  roundsPlayed,
  inProgressParDiff,
} from '../lib/scoring.js';

const ROUND_LABELS = ['R1', 'R2', 'R3', 'R4'];

function formatPlayerName(fullName) {
  if (!fullName) return '';
  const parts = fullName.trim().split(/\s+/);
  if (parts.length === 1) return parts[0];
  const last = parts.slice(1).join(' ');
  return `${parts[0][0]}. ${last}`;
}

/** Format a tee time string like "Sun Apr 12 14:25:00 PDT 2026" to "2:25 PM". */
function formatTeeTime(raw) {
  if (!raw) return null;
  try {
    const d = new Date(raw);
    if (isNaN(d.getTime())) return null;
    return d.toLocaleTimeString([], { hour: 'numeric', minute: '2-digit' });
  } catch {
    return null;
  }
}

export default function TeamCard({ team, players, coursePar, currentRound }) {
  const teamPar = parDisplay(team._par);
  const bestIndices = bestPlayerIndices(team, players, currentRound, coursePar);

  // Sort players by par-relative score (lowest first), preserving index for bestIndices
  const sortedPlayers = team.players
    .map((slug, idx) => ({ slug, idx }))
    .sort((a, b) => {
      const parA = playerParRelative(players[a.slug], coursePar, currentRound);
      const parB = playerParRelative(players[b.slug], coursePar, currentRound);
      return parA - parB;
    });

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
          <div className={`team-card__par-big team-card__par--${teamPar.cls}`}>
            {teamPar.str}
          </div>
          <div className="team-card__strokes-small">{team._score} strokes</div>
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
          <div className="team-card__col team-card__col--pos">POS</div>
          <div className="team-card__col team-card__col--player">Player</div>
          {ROUND_LABELS.map((label) => (
            <div key={label} className="team-card__col team-card__col--round">
              <span className="team-card__round-main">{label}</span>
            </div>
          ))}
          <div className="team-card__col team-card__col--par">PAR</div>
        </div>

        {sortedPlayers.map(({ slug, idx }) => {
          const p = players[slug];
          if (!p) {
            return (
              <div key={slug} className="team-card__row team-card__row--missing">
                <div className="team-card__col team-card__col--pos">—</div>
                <div className="team-card__col team-card__col--player">
                  Unknown player
                </div>
              </div>
            );
          }
          const counting = bestIndices.has(idx);
          return (
            <PlayerRow
              key={slug}
              player={p}
              coursePar={coursePar}
              currentRound={currentRound}
              counting={counting}
            />
          );
        })}
      </div>
    </article>
  );
}

function PlayerRow({ player, coursePar, currentRound, counting }) {
  const rounds = playerRounds(player, currentRound);
  const total = playerTotal(player, currentRound);
  const played = roundsPlayed(player, currentRound);

  // Use ESPN's overallToPar directly when available
  const playerDiff = playerParRelative(player, coursePar, currentRound);
  const parText = parDisplay(playerDiff);

  const isCut = player.status === 'cut';
  const isWd = player.status === 'wd';
  const isPenalized = isCut || isWd;
  const showPar = played > 0 || isRoundInProgress(player, currentRound);

  const rowClass = [
    'team-card__row',
    isPenalized ? 'team-card__row--penalized' : '',
    !counting ? 'team-card__row--dropped' : '',
  ]
    .filter(Boolean)
    .join(' ');

  // Tournament position
  const pos = player.pos || '—';

  return (
    <div className={rowClass}>
      <div className="team-card__col team-card__col--pos">{pos}</div>
      <div
        className={`team-card__col team-card__col--player ${
          isPenalized ? 'team-card__strike' : ''
        }`}
        title={player.name}
      >
        <span className="team-card__player-name">
          {formatPlayerName(player.name)}
        </span>
        {isCut && (
          <span className="team-card__badge team-card__badge--cut">CUT</span>
        )}
        {isWd && (
          <span className="team-card__badge team-card__badge--wd">WD</span>
        )}
      </div>

      {rounds.map((value, idx) => {
        const roundNum = idx + 1;
        const original = player[`r${roundNum}`];
        const live =
          roundNum === currentRound &&
          isRoundInProgress(player, currentRound);
        const isPenaltyRound = isPenalized && original == null && value === 80;

        let main = '—';
        let sub = null;
        let cellExtra = '';

        if (live) {
          const lp = parDisplay(player.toPar || 0);
          main = lp.str;
          sub = `thru ${player.thru}`;
          cellExtra = `team-card__cell--live team-card__par--${lp.cls}`;
        } else if (isPenaltyRound) {
          main = '80';
          cellExtra = 'team-card__cell--penalty';
        } else if (value != null) {
          main = String(value);
        } else if (roundNum === currentRound && player.teeTime) {
          // Show tee time for players who haven't started the current round
          const formatted = formatTeeTime(player.teeTime);
          if (formatted) {
            main = formatted;
            cellExtra = 'team-card__cell--tee';
          }
        }

        return (
          <div
            key={idx}
            className={`team-card__col team-card__col--round ${cellExtra}`}
          >
            <span className="team-card__round-main">{main}</span>
            {sub && <span className="team-card__round-sub">{sub}</span>}
          </div>
        );
      })}

      <div
        className={`team-card__col team-card__col--par team-card__par--${parText.cls}`}
      >
        {showPar ? parText.str : '—'}
      </div>
    </div>
  );
}
