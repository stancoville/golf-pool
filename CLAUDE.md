# CLAUDE.md

Guidance for AI coding assistants working in this repo. See `README.md` for product/user-facing docs.

## What this is

Self-hosted golf pool platform. Admin creates a pool for a PGA event, contestants register teams (6 picks, one per tier), live leaderboard updates from ESPN throughout the tournament. Originally Masters-only and hardcoded; rebuilt to handle any PGA event with odds-driven tiering.

## Stack & shape

- **Vite + React 18** single-page app, deployed on Vercel
- **Vercel serverless functions** in `api/` (file-based routing, ESM, no Next.js)
- **Supabase** for Postgres, Auth (email/password admin only), and RLS
- **External**: ESPN PGA Scoreboard (no key), The Odds API (key in `ODDS_API_KEY`)

## Architecture invariants

### Tiering rules
- Tiers 1–5: 15 players each, ranked by outright winner odds (lowest American price = most favored = Tier 1)
- Tier 6: everyone else (leftover priced players + all unpriced players)
- Threshold: if fewer than 75 players have odds, the whole field falls back to ESPN sort order
- Bookmaker preference: DraftKings > deepest field (in `api/lib/oddsApi.js`)
- Sport-key auto-detection from tournament name (the four majors only); other events use ESPN sort

### Field-source priority (in `api/lib/fieldBuilder.js`)
1. **ESPN competitors + Odds API prices** — best; ESPN gives canonical names and athlete IDs
2. **Odds API outcomes as the field** — fallback when ESPN hasn't posted the field yet
3. **ESPN sort order** — last resort when odds API has nothing

### Registration cutoff
- **Auto-locks at 11am UTC of `start_date`** (~7am Eastern) in both `src/pages/MainPage.jsx` (UI flip) and `api/register.js` (server reject). Coordinated — change both.
- East-Coast-specific assumption. West Coast events would need editing.
- Admin's "Close Registration" button is for closing *earlier* than the auto-flip.

### Refresh Field safety
- `buildAndWriteField` deletes `tournament_players` for the tournament then re-inserts. **Only deletes if new data is non-empty** (added after a refresh wiped the field when ESPN was empty).
- `team_players` and `teams` are untouched — picks FK by `player_id` which is stable.
- Tier numbers in `tournament_players` may shift between refreshes (e.g., new odds), so the endpoint also returns a "broken picks" report listing teams whose picks moved tiers. Display-only — scoring still works.

### Cut detection (ESPN signal)
- Cut players: `linescores.length === 2` (ESPN omits R3/R4 placeholders)
- Active players: `linescores.length === 4` (placeholders even before tee-off)
- Don't use `rounds[2] === null` — it's true for both cut players AND active players who haven't teed off R3 yet. Use `ls.length < 3` (gated by `currentRound >= 3`).

### Round-completion signal (ESPN)
- A round is complete when `linescores[r].linescores.length >= 18` (hole-by-hole count), **not** when `value >= 55` (an old stroke-count heuristic that fires prematurely for in-progress players past hole 12).

### Theme caching
- Active tournament's CSS variables are persisted to `localStorage` via `applyTheme` in `src/hooks/useTournament.js`
- An inline `<script>` in `index.html` reads the cache and applies it before React renders → no flash of default theme on return visits
- Default `:root` theme is intentionally neutral (forest green + cream), not Masters-iconic

## Common operations

### "Refresh Field returned 0 players"
1. Check ESPN: `curl 'https://site.api.espn.com/apis/site/v2/sports/golf/pga/scoreboard?dates=YYYYMMDD'` — does the event have competitors?
2. Check Odds API: `curl 'https://api.the-odds-api.com/v4/sports/golf_pga_championship_winner/odds?apiKey=...&regions=us&markets=outrights&oddsFormat=american'` — does any bookmaker have outright outcomes?
3. If both are empty, ESPN hasn't posted the field and odds aren't out — wait. Typical timeline: odds first (Monday of tournament week), ESPN field second (Tuesday/Wednesday).

### "Player shows as 'Unknown player' on leaderboard"
- The team's player slug doesn't match any slug in ESPN's live data
- Two fix paths: (a) update the player's name in DB to match ESPN's canonical form (slug derives from name at runtime), (b) add an entry to `ESPN_ALIASES` in `api/scores.js`. Path (a) is preferred — keeps DB aligned.
- Common cause: The Odds API uses full given names ("Christopher Gotterup"), ESPN uses short forms ("Chris Gotterup"). The `feat/auto-reconcile-names` branch automates this via fuzzy matching during Refresh Field.

### "Scores look wrong (stroke totals off)"
Likely an ESPN data shape change. Compare what the live scoreboard returns:

```bash
curl -s "https://site.api.espn.com/apis/site/v2/sports/golf/pga/scoreboard" | \
  python3 -c "import json,sys; d=json.load(sys.stdin); \
    e=next(e for e in d['events'] if e['id']=='401811947'); \
    [print(c['athlete']['displayName'], c.get('score'), [(p.get('value'), p.get('displayValue'), len(p.get('linescores',[]))) for p in c.get('linescores',[])]) for c in e['competitions'][0]['competitors'][:5]]"
```

…against what `api/scores.js` parses. The parsing logic is fiddly because ESPN's `value` field is "strokes so far in this round" (not "completed round total"), and `displayValue` is to-par for the round.

### Adding a new tournament alias / name normalization
- Add to `ESPN_ALIASES` in `api/scores.js` for one-off slug mappings (e.g., `'jj-spaun': ['jj-spaun', 'j-j-spaun']`)
- Better: just rename the player in the DB (`update players set name = '...' where ...`) so slugs align naturally

### Course par
- Editable per-tournament via the admin UI (`course_par` field)
- Threaded through `useLeaderboard` → `TeamCard` for par-relative calculations
- Default is 72 (Augusta National). Most other majors are 70.

## File map (where to look)

- **Field building**: `api/lib/fieldBuilder.js` — ESPN fetch, odds attach, tier assignment, name upsert
- **Odds**: `api/lib/oddsApi.js` — The Odds API client, sport key detection, bookmaker selection
- **Score parsing**: `api/scores.js` — ESPN scoreboard → per-player per-round data
- **Tier UI**: `src/components/TierPicker.jsx` — registration grid (shows odds inline)
- **Adaptive homepage**: `src/pages/MainPage.jsx` — registration ↔ leaderboard switch, tee-time cutoff
- **Theming**: `src/hooks/useTournament.js` + `index.html` inline script + `src/index.css`

## Things NOT to do

- **Don't wipe `tournament_players` without ESPN data.** Existing safety check in `buildAndWriteField` — keep it.
- **Don't bypass `requireAdmin`** on admin endpoints. RLS protects against direct Supabase writes but admin API routes use the service role key.
- **Don't add a file `api/admin/tournaments.js` next to the `api/admin/tournaments/` directory.** Vercel's file-system router collides — file-vs-directory at the same name level eats DELETE/PATCH requests with an empty 405. Use `api/admin/tournaments/index.js` for the parent path.
- **Don't grow `ESPN_ALIASES` unbounded.** Prefer fixing the DB name. The aliases map is a safety net, not the canonical solution.

## In-flight work

- **`feat/auto-reconcile-names`** branch — adds fuzzy name matching to `upsertPlayer` so The Odds API → ESPN canonical reconciliation happens automatically during Refresh Field. Not merged yet; deferred until after a tournament wraps so it doesn't affect a live pool.

## Public repo

This is a public GitHub repo. Don't commit:
- API keys (anon keys are fine — they're public; service role and Odds API keys are not)
- Real user emails or production data
- `.env` (already in `.gitignore`)
