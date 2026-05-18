# PGA Tournament Pools

A self-hosted golf pool for any PGA Tour or major championship. An admin spins up a pool for an event, players are auto-tiered by Vegas odds, contestants pick one golfer per tier, and the leaderboard updates live throughout the tournament.

![Workflow](https://img.shields.io/badge/Stack-Vite%20%2B%20Supabase%20%2B%20Vercel-006747)

## Features

- **Any PGA event.** Browse ESPN's calendar in the admin panel, click Create Pool.
- **Odds-based tiering.** For the four majors, the field is split 15/15/15/15/15/rest by outright winner odds from [The Odds API](https://the-odds-api.com) — DraftKings preferred, falls back to deepest available. For non-majors, falls back to ESPN sort order.
- **ESPN-or-odds field source.** If ESPN hasn't posted the field yet (typical until tournament week), the pool builds from The Odds API's outright market — usually ~150 players priced by Monday.
- **Live leaderboard.** Scores refresh every 5 minutes from ESPN with in-progress rounds, tee times, and tournament positions.
- **Best 4 of 6 scoring.** Worst two players are dropped; cut/WD players get an 80-stroke penalty per missed round.
- **Auto-locking registration.** Homepage flips from registration form → leaderboard at the earliest tee time (11am UTC of the start date — ~7am Eastern, the standard early tee time for East Coast majors).
- **Dynamic theming.** Auto-detected color schemes per tournament (Masters green/gold, US Open navy/red, PGA Championship navy/gold, The Open navy/gold). First-paint flash eliminated via localStorage cache.
- **Admin panel.** Tournament setup, field refresh, team management with edit/delete/paid-tracking, collapsible sections.

## Tech Stack

- **Frontend**: React 18 + Vite 5 + React Router
- **Backend**: Supabase (Postgres + Auth + Row Level Security)
- **API**: Vercel Serverless Functions
- **External data**: ESPN PGA Scoreboard (free, no key) + The Odds API (free tier: 500 req/month — plenty)

## Deploy Your Own

### 1. Fork this repo

Click **Fork** on GitHub to create your own copy.

### 2. Set up Supabase

1. Create a free project at [supabase.com](https://supabase.com).
2. Go to **SQL Editor** and run the entire contents of `supabase/schema.sql`. This creates all tables, indexes, RLS policies, and the optional `add column if not exists` migration statements at the bottom (safe to re-run on existing deployments).
3. Go to **Authentication → Users** and click **Add user → Create new user** to make your admin account (email + password).
4. Note your credentials from **Project Settings → API**:
   - Project URL
   - `anon` public key
   - `service_role` secret key (keep this safe — it bypasses RLS)

### 3. (Optional) Get an Odds API key

If you want odds-based tiering for the four majors:

1. Sign up at [the-odds-api.com](https://the-odds-api.com). The free tier (500 requests/month) is plenty — the app only calls the API on Create Pool and Refresh Field.
2. Copy your API key.

Without this key, the pool uses ESPN sort order for tiering (still works, just less odds-accurate for tier assignments).

### 4. Deploy to Vercel

1. Go to [vercel.com](https://vercel.com) and import your forked repo.
2. Add these **Environment Variables** in project settings:

   | Variable | Required? | Value | Exposed to |
   |----------|-----------|-------|------------|
   | `VITE_SUPABASE_URL` | Yes | Your Supabase project URL | Browser + Serverless |
   | `VITE_SUPABASE_ANON_KEY` | Yes | Your `anon` public key | Browser + Serverless |
   | `SUPABASE_SERVICE_ROLE_KEY` | Yes | Your `service_role` secret key | Serverless only |
   | `ODDS_API_KEY` | Optional | Your Odds API key | Serverless only |

3. Deploy. Vercel auto-detects Vite and builds with `npm run build`.

## Running a Pool

### 1. Create the pool

1. Visit `yoursite.vercel.app/admin` and sign in with your admin credentials.
2. Open the **Tournament Management** section. Find the event in **Upcoming PGA Events** and click **Create Pool**.
3. The result message tells you what was built — for example:
   - `Field of 156 players from DraftKings (ESPN field not yet posted). Tiers 1–5 by odds rank (15 each), tier 6 = 81 players.` (Odds API as field source)
   - `Field of 156 players, 142 with odds from DraftKings. Tiers 1–5 by odds rank (15 each), tier 6 = 81 players.` (ESPN field + odds)
   - `No odds available from The Odds API yet. Using ESPN sort order. Refresh later when odds are posted.` (ESPN-only fallback)

### 2. Set course par and venue

Each tournament card has inline editors for **Par** and **Venue**. Set these before opening registration — they show on the leaderboard and feed the par-relative scoring calculations.

| Major | Common venue | Par |
|-------|---|---|
| Masters | Augusta National | 72 |
| PGA Championship | varies (Quail Hollow, Aronimink, Valhalla, etc.) | 70–72 |
| U.S. Open | varies | 70 |
| The Open Championship | varies (links) | 70–72 |

### 3. Refresh as the field firms up

Click **Refresh Field** whenever you want to re-pull ESPN's field and current odds. Run this safely as many times as you like *before* opening registration — there's nothing to break. After registration is open, refreshing surfaces a "broken picks" report flagging any team whose picks landed in a different tier after the refresh.

Note: refreshing during a live tournament is safe (team picks FK by player_id, not tier) but pointless — tiering is only displayed during registration.

### 4. Open registration

Click **Open Registration** on the tournament card. Share the site URL — the homepage now shows the registration form.

Each registrant:
- Picks one player per tier (6 picks total)
- Enters team name, their name, and a tiebreaker (winner's final score relative to par)

### 5. Tournament starts

At **11am UTC of the start date** (~7am Eastern), the homepage auto-flips to the live leaderboard, and the registration POST endpoint starts rejecting new submissions. You don't need to click Close Registration — though you can manually close earlier (e.g., Wednesday night) if you want to lock the field before tee time.

Tournament-time UTC offset is currently hardcoded for East Coast majors. For West Coast events, edit the `11:00:00Z` constant in `src/pages/MainPage.jsx` and `api/register.js`.

### 6. Team management

The **Team Management** section in admin shows every registered team with their picks. From here you can:

- Toggle the **Paid** checkbox to track who's paid the entry fee
- Click **Edit** to fix typos, swap players, or adjust the tiebreaker
- Click **Delete** if someone needs out

Renaming or swapping picks here updates the underlying data — leaderboard reflects changes on the next refresh (within 5 minutes, or hard-reload to force).

## Local Development

```bash
npm install
npm run dev      # http://localhost:5173
```

Without Supabase env vars, the app runs against mock data (`src/data/mockData.js`).

For testing against your Supabase instance locally, copy `.env.example` to `.env` and fill in your credentials:

```bash
cp .env.example .env
```

## Scoring Rules

- **Team**: 6 golfers, one from each tier. Best 4 of 6 count toward the team score each round.
- **Cut/WD penalty**: 80 strokes per round the player doesn't complete.
- **Tiebreaker**: Closest guess to the winner's final score relative to par.
- **Ranking**: Teams sorted by total par-relative score (ascending). Ties broken by tiebreaker accuracy, then alphabetically.

## Project Structure

```
golf-pool/
├── api/                                  # Vercel serverless functions
│   ├── scores.js                         # ESPN score proxy
│   ├── register.js                       # Public registration GET field / POST team
│   ├── admin/
│   │   ├── tournaments/
│   │   │   ├── index.js                  # List + create pools
│   │   │   └── [id].js                   # POST(refresh) / PATCH / DELETE
│   │   └── teams/[id].js                 # Admin: edit / delete teams
│   └── lib/
│       ├── supabaseAdmin.js              # Service-role client + auth middleware
│       ├── oddsApi.js                    # The Odds API integration
│       └── fieldBuilder.js               # ESPN + odds → tiered tournament_players
├── src/
│   ├── pages/
│   │   ├── MainPage.jsx                  # Adaptive: registration OR leaderboard
│   │   └── AdminPage.jsx                 # Auth-gated admin (with accordions)
│   ├── components/
│   │   ├── Header.jsx                    # Tournament header
│   │   ├── TeamCard.jsx                  # Leaderboard team card
│   │   ├── TierPicker.jsx                # 6-tier player selection grid (shows odds)
│   │   ├── RegistrationForm.jsx          # Team registration flow
│   │   ├── TournamentSetup.jsx           # Admin tournament management
│   │   ├── TeamManagement.jsx            # Admin team list + edit + paid
│   │   └── AdminLogin.jsx                # Admin login form
│   ├── hooks/
│   │   ├── useLeaderboard.js             # Teams + ESPN scores + auto-refresh
│   │   ├── useAuth.js                    # Supabase Auth state
│   │   └── useTournament.js              # Dynamic theming + cache
│   ├── lib/
│   │   ├── scoring.js                    # Best-4-of-6 ranking
│   │   ├── supabase.js                   # Browser Supabase client
│   │   └── api.js                        # Authenticated fetch (handles empty bodies)
│   └── styles/app.css                    # All component styles
├── supabase/schema.sql                   # Full DB schema + RLS + migrations
├── index.html                            # Pre-paint theme script
└── vercel.json                           # SPA rewrite (negative-lookahead for /api)
```

## Known Limitations

- **Name drift between data sources.** The Odds API uses full given names ("Christopher", "Matthew"); ESPN uses short forms ("Chris", "Matt"). If you build the field from The Odds API before ESPN's field is up, you'll have to either (a) run a quick SQL `update players set name = '...'` after ESPN comes online, or (b) merge the auto-reconcile feature branch (`feat/auto-reconcile-names`) which does fuzzy matching automatically during Refresh Field.
- **East-Coast tee-time assumption.** Registration cutoff is hardcoded at 11am UTC. For West Coast tournaments, edit `src/pages/MainPage.jsx` and `api/register.js`.
- **PGA Championship and PGA Tour are different orgs.** The PGA Championship is run by the PGA of America, not the PGA Tour, but ESPN groups everything under `golf/pga`. This works fine for both.

## License

MIT
