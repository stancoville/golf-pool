-- Golf Pool — Supabase schema
-- Run this in the Supabase SQL editor to bootstrap a fresh project.

-- ----- Tournaments -----
create table if not exists tournaments (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  year integer not null,
  venue text,
  tour text default 'PGA',
  start_date date,
  end_date date,
  current_round integer default 1,
  status text default 'Scheduled',
  espn_id text,
  course_par integer default 72,
  registration_open boolean default false,
  theme jsonb default '{}',
  created_at timestamptz not null default now()
);

-- ----- Players -----
create table if not exists players (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  espn_id text unique,
  created_at timestamptz not null default now()
);

-- ----- Tournament players (field + tier per event) -----
create table if not exists tournament_players (
  id uuid primary key default gen_random_uuid(),
  tournament_id uuid not null references tournaments(id) on delete cascade,
  player_id uuid not null references players(id) on delete cascade,
  tier integer not null,
  sort_order integer not null,
  odds integer,
  odds_source text,
  unique (tournament_id, player_id)
);

-- Migration for existing deployments: add odds columns if they were missing.
alter table tournament_players add column if not exists odds integer;
alter table tournament_players add column if not exists odds_source text;

-- ----- Teams (one per pool entry) -----
create table if not exists teams (
  id uuid primary key default gen_random_uuid(),
  tournament_id uuid not null references tournaments(id) on delete cascade,
  team_name text not null,
  submitted_by text not null,
  tiebreaker integer not null,
  created_at timestamptz not null default now()
);

-- ----- Roster (six players per team) -----
create table if not exists team_players (
  id uuid primary key default gen_random_uuid(),
  team_id uuid not null references teams(id) on delete cascade,
  player_id uuid not null references players(id) on delete cascade,
  tier integer,
  unique (team_id, player_id)
);

-- ----- Scores (one row per player per tournament) -----
create table if not exists scores (
  id uuid primary key default gen_random_uuid(),
  player_id uuid not null references players(id) on delete cascade,
  tournament_id uuid not null references tournaments(id) on delete cascade,
  round_1 integer,
  round_2 integer,
  round_3 integer,
  round_4 integer,
  status text not null default 'active',
  position text,
  total_score integer generated always as (
    coalesce(round_1, 0)
    + coalesce(round_2, 0)
    + coalesce(round_3, 0)
    + coalesce(round_4, 0)
  ) stored,
  updated_at timestamptz not null default now(),
  unique (player_id, tournament_id)
);

-- ----- Indexes -----
create index if not exists idx_scores_tournament_id on scores (tournament_id);
create index if not exists idx_team_players_team_id on team_players (team_id);
create index if not exists idx_teams_tournament_id on teams (tournament_id);
create index if not exists idx_tp_tournament on tournament_players (tournament_id);

-- ----- Row Level Security -----

alter table tournaments enable row level security;
alter table players enable row level security;
alter table teams enable row level security;
alter table team_players enable row level security;
alter table tournament_players enable row level security;
alter table scores enable row level security;

-- Everyone can read everything
create policy "Anyone can read tournaments" on tournaments for select using (true);
create policy "Anyone can read players" on players for select using (true);
create policy "Anyone can read teams" on teams for select using (true);
create policy "Anyone can read team_players" on team_players for select using (true);
create policy "Anyone can read tournament_players" on tournament_players for select using (true);
create policy "Anyone can read scores" on scores for select using (true);

-- Public registration: insert teams + team_players when registration is open
create policy "Insert teams when registration open" on teams for insert
  with check (
    exists (
      select 1 from tournaments
      where id = tournament_id and registration_open = true
    )
  );

create policy "Insert team_players when registration open" on team_players for insert
  with check (
    exists (
      select 1 from teams t
      join tournaments tn on tn.id = t.tournament_id
      where t.id = team_id and tn.registration_open = true
    )
  );

-- Authenticated users (admin) can do everything
create policy "Admin full access tournaments" on tournaments for all using (auth.role() = 'authenticated');
create policy "Admin full access players" on players for all using (auth.role() = 'authenticated');
create policy "Admin full access teams" on teams for all using (auth.role() = 'authenticated');
create policy "Admin full access team_players" on team_players for all using (auth.role() = 'authenticated');
create policy "Admin full access tournament_players" on tournament_players for all using (auth.role() = 'authenticated');
create policy "Admin full access scores" on scores for all using (auth.role() = 'authenticated');
