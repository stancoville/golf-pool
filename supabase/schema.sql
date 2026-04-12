-- The Masters Pool — Supabase schema
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
  created_at timestamptz not null default now()
);

-- ----- Players -----
create table if not exists players (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  espn_id text unique,
  created_at timestamptz not null default now()
);

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
create index if not exists idx_scores_tournament_id
  on scores (tournament_id);

create index if not exists idx_team_players_team_id
  on team_players (team_id);

create index if not exists idx_teams_tournament_id
  on teams (tournament_id);
