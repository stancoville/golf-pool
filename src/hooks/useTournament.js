import { useEffect } from 'react';
import { supabase } from '../lib/supabase.js';

// Default theme (Masters green/gold) is already in index.css :root.
// Dynamic themes override these CSS variables on <html>.
const THEME_VAR_MAP = {
  primary: '--green-deep',
  accent: '--accent',
  gradientFrom: '--gradient-from',
  gradientTo: '--gradient-to',
};

// Derived variables computed from the primary/accent colors
function derivedVars(theme) {
  const vars = {};

  if (theme.primary) {
    vars['--green-deep'] = theme.primary;
    vars['--green-dark'] = darken(theme.primary, 0.2);
    vars['--green-mid'] = lighten(theme.primary, 0.15);
    vars['--text-dark'] = darken(theme.primary, 0.5);
    vars['--text-muted'] = mixWithGray(theme.primary, 0.5);
    vars['--card-border'] = `${theme.primary}26`; // 15% opacity
  }

  if (theme.accent) {
    vars['--accent'] = theme.accent;
    vars['--accent-light'] = lighten(theme.accent, 0.2);
    vars['--accent-dim'] = darken(theme.accent, 0.1);
  }

  if (theme.gradientFrom) vars['--gradient-from'] = theme.gradientFrom;
  if (theme.gradientTo) vars['--gradient-to'] = theme.gradientTo;

  return vars;
}

/**
 * Apply a tournament theme to the document root as CSS custom properties.
 * Call with null/empty to reset to defaults.
 */
export function applyTheme(theme) {
  const root = document.documentElement;

  if (!theme || Object.keys(theme).length === 0) return;

  const vars = derivedVars(theme);
  for (const [prop, value] of Object.entries(vars)) {
    root.style.setProperty(prop, value);
  }
}

/**
 * Remove dynamic theme overrides (revert to CSS defaults).
 */
export function clearTheme() {
  const root = document.documentElement;
  const allVars = [
    '--green-deep', '--green-dark', '--green-mid',
    '--text-dark', '--text-muted', '--card-border',
    '--accent', '--accent-light', '--accent-dim',
    '--gradient-from', '--gradient-to',
  ];
  for (const prop of allVars) {
    root.style.removeProperty(prop);
  }
}

/**
 * Hook: apply tournament theme from Supabase on mount.
 */
export function useTheme(tournament) {
  useEffect(() => {
    if (tournament?.theme) {
      applyTheme(tournament.theme);
    }
    return () => clearTheme();
  }, [tournament?.theme]);
}

// Simple color manipulation helpers (no dependency needed)
function hexToRgb(hex) {
  const h = hex.replace('#', '');
  return {
    r: parseInt(h.substring(0, 2), 16),
    g: parseInt(h.substring(2, 4), 16),
    b: parseInt(h.substring(4, 6), 16),
  };
}

function rgbToHex({ r, g, b }) {
  return '#' + [r, g, b].map((c) =>
    Math.max(0, Math.min(255, Math.round(c))).toString(16).padStart(2, '0')
  ).join('');
}

function darken(hex, amount) {
  const { r, g, b } = hexToRgb(hex);
  return rgbToHex({
    r: r * (1 - amount),
    g: g * (1 - amount),
    b: b * (1 - amount),
  });
}

function lighten(hex, amount) {
  const { r, g, b } = hexToRgb(hex);
  return rgbToHex({
    r: r + (255 - r) * amount,
    g: g + (255 - g) * amount,
    b: b + (255 - b) * amount,
  });
}

function mixWithGray(hex, amount) {
  const { r, g, b } = hexToRgb(hex);
  const gray = 128;
  return rgbToHex({
    r: r * (1 - amount) + gray * amount,
    g: g * (1 - amount) + gray * amount,
    b: b * (1 - amount) + gray * amount,
  });
}
