# golf-pool

A React + Vite leaderboard for a Masters / PGA Tour pool. Each contestant
picks six players; lowest total stroke score across all four rounds wins.
Players who miss the cut or withdraw are charged 80 strokes for each round
they didn't complete. Ties are broken by whichever pool member guessed
closest to the winner's final score relative to par.

The app currently runs against mock data so it can be deployed before the
Supabase backend is wired up. Flip `USE_MOCK` in
`src/hooks/useLeaderboard.js` once the database is live.

## Tech stack

- React 18 + Vite 5
- Supabase JS client (Phase 2)
- Deployed on Vercel via auto-deploy from GitHub

## Local development

```bash
npm install
npm run dev      # http://localhost:5173
npm run build    # production bundle in dist/
npm run preview  # serve the built bundle locally
```

## Environment

Copy `.env.example` to `.env` and fill in the Supabase credentials when you
are ready to switch off the mock data.

```bash
cp .env.example .env
```

| Variable | Description |
| --- | --- |
| `VITE_SUPABASE_URL` | Your Supabase project URL |
| `VITE_SUPABASE_ANON_KEY` | Public anon key for the project |

## Project layout

```
golf-pool/
├── index.html
├── public/flag.svg
├── src/
│   ├── App.jsx                 # main UI, search, round tabs, grid
│   ├── main.jsx
│   ├── index.css               # CSS variables + global resets
│   ├── components/
│   │   ├── Header.jsx
│   │   └── TeamCard.jsx
│   ├── data/mockData.js        # realistic 2026 Masters mock data
│   ├── hooks/useLeaderboard.js # auto-refreshing data hook
│   └── lib/
│       ├── scoring.js          # rank + par helpers
│       └── supabase.js         # Supabase client (Phase 2)
└── supabase/schema.sql         # tables + indexes for Phase 2
```

## Scoring rules

- Team score = sum of every player's four-round stroke total.
- Cut or WD players → 80-stroke penalty for each missed round.
- Tiebreaker = closest guess to the winner's final score relative to par.

## Deployment

The repo is configured for Vercel's free tier. Connect the GitHub repo,
accept the defaults (`npm run build`, output `dist/`), and Vercel will
auto-deploy every push to `main`.
