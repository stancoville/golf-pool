import { useCallback, useEffect, useMemo, useState } from 'react';
import { COURSE_PAR, PLAYERS, TEAMS, TOURNAMENT } from '../data/mockData.js';
import { rankTeams } from '../lib/scoring.js';
// import { supabase } from '../lib/supabase.js'; // Phase 2

// Flip this to false once Supabase is wired up.
const USE_MOCK = true;

// Auto refresh every 5 minutes.
const REFRESH_INTERVAL_MS = 5 * 60 * 1000;

/**
 * useLeaderboard
 *
 * Returns a memoized, ranked leaderboard plus the raw players/tournament
 * objects and metadata for the UI. The hook auto-refreshes every five
 * minutes and exposes a manual `refresh()` function.
 */
export function useLeaderboard() {
  const [players, setPlayers] = useState(PLAYERS);
  const [teams, setTeams] = useState(TEAMS);
  const [tournament, setTournament] = useState(TOURNAMENT);
  const [loading, setLoading] = useState(false);
  const [lastSync, setLastSync] = useState(() => new Date());

  const fetchData = useCallback(async () => {
    setLoading(true);
    try {
      if (USE_MOCK) {
        // Tiny artificial delay so the spinner is visible on manual refresh.
        await new Promise((r) => setTimeout(r, 250));
        setPlayers(PLAYERS);
        setTeams(TEAMS);
        setTournament(TOURNAMENT);
      } else {
        // ----- Phase 2: live Supabase fetch -----
        //
        // const { data: tournamentRow } = await supabase
        //   .from('tournaments')
        //   .select('*')
        //   .order('start_date', { ascending: false })
        //   .limit(1)
        //   .single();
        //
        // const { data: scoreRows } = await supabase
        //   .from('scores')
        //   .select('*, players(*)')
        //   .eq('tournament_id', tournamentRow.id);
        //
        // const { data: teamRows } = await supabase
        //   .from('teams')
        //   .select('*, team_players(player_id, players(*))')
        //   .eq('tournament_id', tournamentRow.id);
        //
        // setTournament({
        //   name: tournamentRow.name,
        //   year: tournamentRow.year,
        //   venue: tournamentRow.venue,
        //   currentRound: tournamentRow.current_round,
        //   status: tournamentRow.status,
        // });
        //
        // const playersBySlug = {};
        // scoreRows.forEach((row) => {
        //   const slug = slugify(row.players.name);
        //   playersBySlug[slug] = {
        //     name: row.players.name,
        //     r1: row.round_1,
        //     r2: row.round_2,
        //     r3: row.round_3,
        //     r4: row.round_4,
        //     status: row.status,
        //     pos: row.position,
        //   };
        // });
        // setPlayers(playersBySlug);
        //
        // setTeams(
        //   teamRows.map((t) => ({
        //     id: t.id,
        //     teamName: t.team_name,
        //     submittedBy: t.submitted_by,
        //     tiebreaker: t.tiebreaker,
        //     players: t.team_players.map((tp) => slugify(tp.players.name)),
        //   }))
        // );
      }
      setLastSync(new Date());
    } finally {
      setLoading(false);
    }
  }, []);

  useEffect(() => {
    fetchData();
    const interval = setInterval(fetchData, REFRESH_INTERVAL_MS);
    return () => clearInterval(interval);
  }, [fetchData]);

  const ranked = useMemo(
    () => rankTeams(teams, players, COURSE_PAR),
    [teams, players]
  );

  return {
    ranked,
    players,
    tournament,
    loading,
    lastSync,
    refresh: fetchData,
  };
}
