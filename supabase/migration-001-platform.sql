-- Migration 001: Platform expansion
-- Adds tournament_players (field + tiers), extends tournaments, adds tier to team_players.
-- Run in Supabase SQL editor.

-- ----- Extend tournaments -----
ALTER TABLE tournaments
  ADD COLUMN IF NOT EXISTS course_par integer DEFAULT 72,
  ADD COLUMN IF NOT EXISTS registration_open boolean DEFAULT false,
  ADD COLUMN IF NOT EXISTS theme jsonb DEFAULT '{}';

-- ----- Tournament players (field + tier per event) -----
CREATE TABLE IF NOT EXISTS tournament_players (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  tournament_id uuid NOT NULL REFERENCES tournaments(id) ON DELETE CASCADE,
  player_id uuid NOT NULL REFERENCES players(id) ON DELETE CASCADE,
  tier integer NOT NULL,
  sort_order integer NOT NULL,
  UNIQUE (tournament_id, player_id)
);
CREATE INDEX IF NOT EXISTS idx_tp_tournament ON tournament_players(tournament_id);

-- ----- Add tier to team_players -----
ALTER TABLE team_players
  ADD COLUMN IF NOT EXISTS tier integer;

-- ----- RLS policies -----

-- Enable RLS on all tables
ALTER TABLE tournaments ENABLE ROW LEVEL SECURITY;
ALTER TABLE players ENABLE ROW LEVEL SECURITY;
ALTER TABLE teams ENABLE ROW LEVEL SECURITY;
ALTER TABLE team_players ENABLE ROW LEVEL SECURITY;
ALTER TABLE tournament_players ENABLE ROW LEVEL SECURITY;
ALTER TABLE scores ENABLE ROW LEVEL SECURITY;

-- Everyone can read everything
CREATE POLICY "Anyone can read tournaments" ON tournaments FOR SELECT USING (true);
CREATE POLICY "Anyone can read players" ON players FOR SELECT USING (true);
CREATE POLICY "Anyone can read teams" ON teams FOR SELECT USING (true);
CREATE POLICY "Anyone can read team_players" ON team_players FOR SELECT USING (true);
CREATE POLICY "Anyone can read tournament_players" ON tournament_players FOR SELECT USING (true);
CREATE POLICY "Anyone can read scores" ON scores FOR SELECT USING (true);

-- Public registration: insert teams + team_players when registration is open
CREATE POLICY "Insert teams when registration open" ON teams FOR INSERT
  WITH CHECK (
    EXISTS (
      SELECT 1 FROM tournaments
      WHERE id = tournament_id AND registration_open = true
    )
  );

CREATE POLICY "Insert team_players when registration open" ON team_players FOR INSERT
  WITH CHECK (
    EXISTS (
      SELECT 1 FROM teams t
      JOIN tournaments tn ON tn.id = t.tournament_id
      WHERE t.id = team_id AND tn.registration_open = true
    )
  );

-- Authenticated users (admin) can do everything
CREATE POLICY "Admin full access tournaments" ON tournaments FOR ALL
  USING (auth.role() = 'authenticated');
CREATE POLICY "Admin full access players" ON players FOR ALL
  USING (auth.role() = 'authenticated');
CREATE POLICY "Admin full access teams" ON teams FOR ALL
  USING (auth.role() = 'authenticated');
CREATE POLICY "Admin full access team_players" ON team_players FOR ALL
  USING (auth.role() = 'authenticated');
CREATE POLICY "Admin full access tournament_players" ON tournament_players FOR ALL
  USING (auth.role() = 'authenticated');
CREATE POLICY "Admin full access scores" ON scores FOR ALL
  USING (auth.role() = 'authenticated');
