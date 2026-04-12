import { useCallback, useEffect, useMemo, useState } from 'react';
import { supabase } from '../lib/supabase.js';
import { COURSE_PAR, PLAYERS, TEAMS, TOURNAMENT } from '../data/mockData.js';
import { rankTeams } from '../lib/scoring.js';

// Auto-refresh every 5 minutes.
const REFRESH_INTERVAL_MS = 5 * 60 * 1000;

function slugify(name) {
  return name
    .toLowerCase()
    .normalize('NFD')
    .replace(/[\u0300-\u036f]/g, '')
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/(^-|-$)/g, '');
}

/**
 * Fetch team rosters from Supabase. This data is static during the tournament.
 */
async function fetchTeams() {
  const { data: tournamentRow, error: tErr } = await supabase
    .from('tournaments')
    .select('*')
    .order('start_date', { ascending: false })
    .limit(1)
    .single();

  if (tErr || !tournamentRow) throw new Error(tErr?.message || 'No tournament found');

  const { data: teamRows, error: teamErr } = await supabase
    .from('teams')
    .select('*, team_players(player_id, players(name))')
    .eq('tournament_id', tournamentRow.id);

  if (teamErr) throw new Error(teamErr.message);

  const teams = teamRows.map((t) => ({
    id: t.id,
    teamName: t.team_name,
    submittedBy: t.submitted_by,
    tiebreaker: t.tiebreaker,
    players: t.team_players.map((tp) => slugify(tp.players.name)),
  }));

  return { tournament: tournamentRow, teams };
}

/**
 * Fetch live scores from the ESPN proxy API route.
 */
async function fetchEspnScores() {
  const res = await fetch('/api/scores');
  if (!res.ok) throw new Error(`Score API returned ${res.status}`);
  return res.json();
}

/**
 * Build the players lookup from ESPN data, falling back to Supabase scores
 * if ESPN is unavailable.
 */
async function fetchScoresFallback(tournamentId) {
  const { data: scoreRows, error } = await supabase
    .from('scores')
    .select('*, players(name)')
    .eq('tournament_id', tournamentId);

  if (error) throw new Error(error.message);

  const playersBySlug = {};
  scoreRows.forEach((row) => {
    const slug = slugify(row.players.name);
    playersBySlug[slug] = {
      name: row.players.name,
      r1: row.round_1,
      r2: row.round_2,
      r3: row.round_3,
      r4: row.round_4,
      thru: null,
      toPar: null,
      status: row.status,
      pos: row.position || '',
    };
  });
  return playersBySlug;
}

/**
 * useLeaderboard
 *
 * Returns a ranked leaderboard by fetching team rosters from Supabase
 * and live scores from ESPN. Auto-refreshes every five minutes.
 */
export function useLeaderboard() {
  const [players, setPlayers] = useState({});
  const [teams, setTeams] = useState([]);
  const [tournament, setTournament] = useState({
    name: 'The Masters',
    year: 2026,
    venue: 'Augusta National',
    currentRound: 1,
    status: 'Scheduled',
  });
  const [loading, setLoading] = useState(true);
  const [lastSync, setLastSync] = useState(null);
  const [teamsLoaded, setTeamsLoaded] = useState(false);

  // Load teams from Supabase once.
  const loadTeams = useCallback(async () => {
    if (!supabase) return;
    try {
      const { tournament: t, teams: teamList } = await fetchTeams();
      setTeams(teamList);
      setTournament({
        name: t.name,
        year: t.year,
        venue: t.venue,
        currentRound: t.current_round,
        status: t.status,
      });
      setTeamsLoaded(true);
      return t;
    } catch (err) {
      console.error('Failed to load teams from Supabase:', err);
      return null;
    }
  }, []);

  // Refresh scores (ESPN first, Supabase fallback).
  const refreshScores = useCallback(
    async (tournamentRow) => {
      if (!supabase) return;
      setLoading(true);
      try {
        let espnData = null;
        try {
          espnData = await fetchEspnScores();
        } catch (err) {
          console.warn('ESPN fetch failed, falling back to Supabase scores:', err);
        }

        if (espnData && Object.keys(espnData.players).length > 0) {
          setPlayers(espnData.players);
          if (espnData.currentRound) {
            setTournament((prev) => ({
              ...prev,
              currentRound: espnData.currentRound,
              status: espnData.status || prev.status,
            }));
          }
        } else if (tournamentRow) {
          // Fallback to Supabase scores
          const fallbackPlayers = await fetchScoresFallback(tournamentRow.id);
          setPlayers(fallbackPlayers);
        }

        setLastSync(new Date());
      } catch (err) {
        console.error('Score refresh failed:', err);
      } finally {
        setLoading(false);
      }
    },
    []
  );

  // Initial load: teams + scores. Falls back to mock data when Supabase
  // is not configured (local dev without env vars).
  useEffect(() => {
    let cancelled = false;

    async function init() {
      if (!supabase) {
        // No Supabase connection — use mock data for local dev.
        setPlayers(PLAYERS);
        setTeams(TEAMS);
        setTournament(TOURNAMENT);
        setTeamsLoaded(true);
        setLoading(false);
        setLastSync(new Date());
        return;
      }
      const t = await loadTeams();
      if (!cancelled) {
        await refreshScores(t);
      }
    }

    init();
    return () => { cancelled = true; };
  }, [loadTeams, refreshScores]);

  // Auto-refresh scores every 5 minutes (only when Supabase is connected).
  useEffect(() => {
    if (!teamsLoaded || !supabase) return;

    const interval = setInterval(() => {
      refreshScores(null);
    }, REFRESH_INTERVAL_MS);

    return () => clearInterval(interval);
  }, [teamsLoaded, refreshScores]);

  const ranked = useMemo(
    () => rankTeams(teams, players, COURSE_PAR, tournament.currentRound),
    [teams, players, tournament.currentRound]
  );

  return {
    ranked,
    players,
    tournament,
    loading,
    lastSync,
  };
}
