import React from 'react';

const TIER_LABELS = {
  1: 'Tier 1',
  2: 'Tier 2',
  3: 'Tier 3',
  4: 'Tier 4',
  5: 'Tier 5',
  6: 'Tier 6',
};

/**
 * TierPicker — displays players in 6 tiers. User picks one per tier.
 * Props:
 *   tiers: { 1: [{id, name}], 2: [...], ... }
 *   picks: { 1: playerId, 2: playerId, ... }
 *   onPick: (tier, playerId) => void
 */
export default function TierPicker({ tiers, picks, onPick }) {
  return (
    <div className="tier-picker">
      {[1, 2, 3, 4, 5, 6].map((tier) => {
        const players = tiers[tier] || [];
        const selected = picks[tier] || null;

        return (
          <div key={tier} className="tier-picker__tier">
            <h3 className="tier-picker__label">
              {TIER_LABELS[tier]}
              <span className="tier-picker__count">{players.length} players</span>
            </h3>
            <div className="tier-picker__grid">
              {players.map((p) => {
                const isSelected = selected === p.id;
                return (
                  <button
                    key={p.id}
                    type="button"
                    className={`tier-picker__player ${isSelected ? 'tier-picker__player--selected' : ''}`}
                    onClick={() => onPick(tier, p.id)}
                  >
                    {p.name}
                  </button>
                );
              })}
            </div>
            {players.length === 0 && (
              <p className="tier-picker__empty">No players in this tier</p>
            )}
          </div>
        );
      })}
    </div>
  );
}
