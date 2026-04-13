# Golf Pool

A self-hosted golf pool platform for PGA Tour tournaments. An admin picks a tournament, players are auto-tiered from ESPN rankings, contestants register teams by picking one golfer per tier, and the leaderboard updates live throughout the event.

## Features

- **Any PGA tournament** — browse the ESPN calendar and create a pool with one click
- **Tiered drafting** — field auto-divided into 6 tiers by ESPN ranking; pick one player per tier
- **Live leaderboard** — scores from ESPN refresh every 5 minutes with in-progress rounds, tee times, and tournament positions
- **Best 4 of 6 scoring** — worst two players on each team are dropped; cut/WD players get 80-stroke penalties per missed round
- **Dynamic theming** — auto-detected color schemes for the Masters (green/gold), US Open (navy/red), PGA Championship (blue/gold), and more
- **Admin panel** — manage tournaments, toggle registration, edit teams
- **Self-registration** — share the URL and contestants register their own teams before the tournament starts; registration auto-locks at tee time

## Tech Stack

- **Frontend**: React 18, Vite 5, React Router
- **Backend**: Supabase (Postgres + Auth + Row Level Security)
- **API**: Vercel Serverless Functions (ESPN proxy, registration, admin)
- **Hosting**: Vercel
- **Data**: ESPN PGA Scoreboard API (no key required)

## Deploy Your Own

### 1. Fork this repo

Click **Fork** on GitHub to create your own copy.

### 2. Set up Supabase

1. Create a free project at [supabase.com](https://supabase.com)
2. Go to **SQL Editor** and run the contents of `supabase/schema.sql` to create all tables, indexes, and RLS policies
4. Go to **Authentication > Users** and click **Create User** to make your admin account (email + password)
5. Note your project credentials from **Settings > API**:
   - Project URL
   - `anon` public key
   - `service_role` secret key

### 3. Deploy to Vercel

1. Go to [vercel.com](https://vercel.com) and import your forked repo
2. Add these **Environment Variables** in the Vercel project settings:

   | Variable | Value | Exposed to |
   |----------|-------|------------|
   | `VITE_SUPABASE_URL` | Your Supabase project URL | Browser + Serverless |
   | `VITE_SUPABASE_ANON_KEY` | Your `anon` public key | Browser + Serverless |
   | `SUPABASE_SERVICE_ROLE_KEY` | Your `service_role` secret key | Serverless only |

3. Deploy. Vercel auto-detects Vite and builds with `npm run build`.

### 4. Create your first pool

1. Visit `yoursite.vercel.app/admin` and log in with the admin email/password you created in Supabase
2. Browse upcoming PGA events and click **Create Pool**
3. Click **Open Registration** when you're ready for contestants to sign up
4. Share the site URL — the main page shows the registration form when registration is open
5. When the tournament starts, registration auto-closes and the page switches to the live leaderboard

## Local Development

```bash
npm install
npm run dev      # http://localhost:5173
```

Without Supabase env vars, the app runs against mock data for local development.

To test with Supabase locally, copy `.env.example` to `.env` and fill in your credentials:

```bash
cp .env.example .env
```

## Project Structure

```
golf-pool/
├── api/                          # Vercel serverless functions
│   ├── scores.js                 # ESPN score proxy (tournament-agnostic)
│   ├── register.js               # Public team registration (GET field, POST team)
│   ├── admin/tournaments.js      # Admin: browse ESPN calendar, create pools
│   ├── admin/tournaments/[id].js # Admin: update/delete tournaments
│   ├── admin/teams/[id].js       # Admin: edit/delete teams
│   └── lib/supabaseAdmin.js      # Server-side Supabase client + auth middleware
├── src/
│   ├── pages/
│   │   ├── MainPage.jsx          # Adaptive: registration form OR leaderboard
│   │   └── AdminPage.jsx         # Auth-gated admin panel
│   ├── components/
│   │   ├── Header.jsx            # Tournament header with dynamic name
│   │   ├── TeamCard.jsx          # Leaderboard team card
│   │   ├── TierPicker.jsx        # 6-tier player selection grid
│   │   ├── RegistrationForm.jsx  # Team registration flow
│   │   ├── TournamentSetup.jsx   # Admin tournament management
│   │   └── AdminLogin.jsx        # Admin login form
│   ├── hooks/
│   │   ├── useLeaderboard.js     # Supabase teams + ESPN scores + auto-refresh
│   │   ├── useAuth.js            # Supabase Auth state
│   │   └── useTournament.js      # Dynamic theming
│   ├── lib/
│   │   ├── scoring.js            # Best-4-of-6 ranking, par calculations
│   │   ├── supabase.js           # Browser Supabase client
│   │   └── api.js                # Authenticated fetch helper
│   ├── styles/app.css            # All component styles
│   ├── index.css                 # CSS variables + resets
│   └── data/mockData.js          # Offline/dev mock data
├── supabase/
│   └── schema.sql                # Full database schema + RLS policies
└── vercel.json                   # API routing + SPA rewrite
```

## Scoring Rules

- **Team**: 6 golfers, one from each tier. Best 4 of 6 count toward the team score.
- **Cut/WD penalty**: 80 strokes for each round the player doesn't complete.
- **Tiebreaker**: Closest guess to the winner's final score relative to par.
- **Ranking**: Teams sorted by total par-relative score (ascending). Ties broken by tiebreaker accuracy, then alphabetically.

## License

MIT
