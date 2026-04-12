// Mock data for The Masters 2026 Pool.
// Replace with live Supabase data once Phase 2 is wired up.

export const COURSE_PAR = 72;

export const TOURNAMENT = {
  name: 'The Masters',
  year: 2026,
  venue: 'Augusta National',
  currentRound: 3,
  status: 'In Progress',
};

// Players keyed by slug.
//
// r1..r4 are integer stroke totals for COMPLETED rounds, or null if the round
// has not been completed yet (in progress, not yet teed off, cut, or WD).
//
// For the active round only, two extra fields describe live progress:
//   thru:  number of holes played in the current round (0 = not yet teed off,
//          1..17 = on the course, 18 / null once the round is final)
//   toPar: that round's score relative to par (e.g. -2)
//
// status: 'active' | 'cut' | 'wd'
// pos:    live ESPN-style position string (e.g. "1", "T4", "CUT", "WD")
export const PLAYERS = {
  // ----- R3 complete -----
  'rory-mcilroy': {
    name: 'Rory McIlroy',
    r1: 67, r2: 65, r3: 69, r4: null,
    thru: null, toPar: null,
    status: 'active', pos: '1',
  },
  'scottie-scheffler': {
    name: 'Scottie Scheffler',
    r1: 68, r2: 67, r3: 70, r4: null,
    thru: null, toPar: null,
    status: 'active', pos: 'T2',
  },
  'jon-rahm': {
    name: 'Jon Rahm',
    r1: 69, r2: 68, r3: 70, r4: null,
    thru: null, toPar: null,
    status: 'active', pos: 'T3',
  },
  'ludvig-aberg': {
    name: 'Ludvig Aberg',
    r1: 68, r2: 68, r3: 71, r4: null,
    thru: null, toPar: null,
    status: 'active', pos: 'T3',
  },
  'hideki-matsuyama': {
    name: 'Hideki Matsuyama',
    r1: 72, r2: 68, r3: 70, r4: null,
    thru: null, toPar: null,
    status: 'active', pos: 'T6',
  },
  'viktor-hovland': {
    name: 'Viktor Hovland',
    r1: 71, r2: 68, r3: 71, r4: null,
    thru: null, toPar: null,
    status: 'active', pos: 'T6',
  },
  'patrick-cantlay': {
    name: 'Patrick Cantlay',
    r1: 70, r2: 69, r3: 72, r4: null,
    thru: null, toPar: null,
    status: 'active', pos: 'T9',
  },
  'shane-lowry': {
    name: 'Shane Lowry',
    r1: 72, r2: 70, r3: 72, r4: null,
    thru: null, toPar: null,
    status: 'active', pos: 'T13',
  },
  'jordan-spieth': {
    name: 'Jordan Spieth',
    r1: 70, r2: 71, r3: 73, r4: null,
    thru: null, toPar: null,
    status: 'active', pos: 'T15',
  },

  // ----- R3 in progress -----
  'collin-morikawa': {
    name: 'Collin Morikawa',
    r1: 70, r2: 67, r3: null, r4: null,
    thru: 9, toPar: -3,
    status: 'active', pos: 'T5',
  },
  'xander-schauffele': {
    name: 'Xander Schauffele',
    r1: 69, r2: 67, r3: null, r4: null,
    thru: 12, toPar: -1,
    status: 'active', pos: 'T6',
  },
  'bryson-dechambeau': {
    name: 'Bryson DeChambeau',
    r1: 71, r2: 67, r3: null, r4: null,
    thru: 11, toPar: -2,
    status: 'active', pos: 'T8',
  },
  'tommy-fleetwood': {
    name: 'Tommy Fleetwood',
    r1: 70, r2: 68, r3: null, r4: null,
    thru: 14, toPar: 0,
    status: 'active', pos: 'T9',
  },
  'justin-thomas': {
    name: 'Justin Thomas',
    r1: 71, r2: 69, r3: null, r4: null,
    thru: 8, toPar: 1,
    status: 'active', pos: 'T13',
  },

  // ----- R3 not yet teed off -----
  'sahith-theegala': {
    name: 'Sahith Theegala',
    r1: 73, r2: 70, r3: null, r4: null,
    thru: 0, toPar: 0,
    status: 'active', pos: 'T18',
  },

  // ----- Missed cut -----
  'will-zalatoris': {
    name: 'Will Zalatoris',
    r1: 74, r2: 75, r3: null, r4: null,
    thru: null, toPar: null,
    status: 'cut', pos: 'CUT',
  },
  'jason-day': {
    name: 'Jason Day',
    r1: 75, r2: 76, r3: null, r4: null,
    thru: null, toPar: null,
    status: 'cut', pos: 'CUT',
  },

  // ----- Withdrew -----
  'sergio-garcia': {
    name: 'Sergio Garcia',
    r1: 78, r2: null, r3: null, r4: null,
    thru: null, toPar: null,
    status: 'wd', pos: 'WD',
  },
};

// 12 sample teams. Each team picks 6 player slugs.
// tiebreaker is the pool member's guess for the winner's final score relative to par.
export const TEAMS = [
  {
    id: 't01',
    teamName: 'Azalea Assassins',
    submittedBy: 'Mark Donovan',
    tiebreaker: -16,
    players: [
      'rory-mcilroy',
      'scottie-scheffler',
      'collin-morikawa',
      'tommy-fleetwood',
      'patrick-cantlay',
      'jordan-spieth',
    ],
  },
  {
    id: 't02',
    teamName: 'Magnolia Mafia',
    submittedBy: 'Jenna Ortiz',
    tiebreaker: -14,
    players: [
      'scottie-scheffler',
      'xander-schauffele',
      'ludvig-aberg',
      'jon-rahm',
      'viktor-hovland',
      'hideki-matsuyama',
    ],
  },
  {
    id: 't03',
    teamName: 'Amen Corner Crew',
    submittedBy: 'Tyler Brooks',
    tiebreaker: -18,
    players: [
      'rory-mcilroy',
      'ludvig-aberg',
      'bryson-dechambeau',
      'tommy-fleetwood',
      'justin-thomas',
      'shane-lowry',
    ],
  },
  {
    id: 't04',
    teamName: 'Green Jacket Bandits',
    submittedBy: 'Priya Shah',
    tiebreaker: -12,
    players: [
      'scottie-scheffler',
      'collin-morikawa',
      'jon-rahm',
      'patrick-cantlay',
      'hideki-matsuyama',
      'will-zalatoris',
    ],
  },
  {
    id: 't05',
    teamName: 'Pimento Cheese Patrol',
    submittedBy: 'Reggie Fontaine',
    tiebreaker: -15,
    players: [
      'rory-mcilroy',
      'xander-schauffele',
      'bryson-dechambeau',
      'viktor-hovland',
      'jordan-spieth',
      'sahith-theegala',
    ],
  },
  {
    id: 't06',
    teamName: "Hogan's Alley Cats",
    submittedBy: 'Aaron Whitlock',
    tiebreaker: -17,
    players: [
      'rory-mcilroy',
      'scottie-scheffler',
      'ludvig-aberg',
      'tommy-fleetwood',
      'shane-lowry',
      'jason-day',
    ],
  },
  {
    id: 't07',
    teamName: 'Rae Creek Rascals',
    submittedBy: 'Lena Park',
    tiebreaker: -13,
    players: [
      'xander-schauffele',
      'collin-morikawa',
      'bryson-dechambeau',
      'patrick-cantlay',
      'justin-thomas',
      'sahith-theegala',
    ],
  },
  {
    id: 't08',
    teamName: 'Butler Cabin Boys',
    submittedBy: 'Sam Kowalski',
    tiebreaker: -19,
    players: [
      'rory-mcilroy',
      'ludvig-aberg',
      'jon-rahm',
      'viktor-hovland',
      'hideki-matsuyama',
      'sergio-garcia',
    ],
  },
  {
    id: 't09',
    teamName: 'Eisenhower Tree Huggers',
    submittedBy: 'Diane Vargas',
    tiebreaker: -11,
    players: [
      'scottie-scheffler',
      'xander-schauffele',
      'tommy-fleetwood',
      'patrick-cantlay',
      'jordan-spieth',
      'shane-lowry',
    ],
  },
  {
    id: 't10',
    teamName: 'Pin High Posse',
    submittedBy: 'Hank Mueller',
    tiebreaker: -16,
    players: [
      'rory-mcilroy',
      'bryson-dechambeau',
      'collin-morikawa',
      'viktor-hovland',
      'justin-thomas',
      'will-zalatoris',
    ],
  },
  {
    id: 't11',
    teamName: 'Bogey Free Brigade',
    submittedBy: 'Ellie Chen',
    tiebreaker: -20,
    players: [
      'scottie-scheffler',
      'ludvig-aberg',
      'jon-rahm',
      'tommy-fleetwood',
      'hideki-matsuyama',
      'jordan-spieth',
    ],
  },
  {
    id: 't12',
    teamName: 'Sandtrap Saints',
    submittedBy: 'Marcus Webb',
    tiebreaker: -14,
    players: [
      'rory-mcilroy',
      'xander-schauffele',
      'patrick-cantlay',
      'shane-lowry',
      'sahith-theegala',
      'jason-day',
    ],
  },
];
