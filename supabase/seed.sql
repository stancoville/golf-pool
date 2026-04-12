-- Masters Pool 2026 — Seed Data
-- Run this in the Supabase SQL editor AFTER running schema.sql
-- Generated from 'Masters Pool (2026) vMovingDay.pdf'

BEGIN;

-- ===== TOURNAMENT =====
INSERT INTO tournaments (id, name, year, venue, tour, start_date, end_date, current_round, status)
VALUES (
  '00000000-0000-0000-0000-000000000001',
  'The Masters',
  2026,
  'Augusta National',
  'PGA',
  '2026-04-09',
  '2026-04-12',
  3,
  'In Progress'
);

-- ===== PLAYERS =====
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000001', 'Aaron Rai');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000002', 'Adam Scott');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000003', 'Akshay Bhatia');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000004', 'Aldrich Potgieter');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000005', 'Alexander Noren');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000006', 'Andrew Novak');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000007', 'Angel Cabrera');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000008', 'Ben Griffin');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000009', 'Brandon Holtz');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000010', 'Brian Campbell');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000011', 'Brian Harman');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000012', 'Brooks Koepka');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000013', 'Bryson DeChambeau');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000014', 'Bubba Watson');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000015', 'Cameron Smith');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000016', 'Cameron Young');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000017', 'Carlos Ortiz');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000018', 'Casey Jarvis');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000019', 'Charl Schwartzel');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000020', 'Chris Gotterup');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000021', 'Collin Morikawa');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000022', 'Corey Conners');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000023', 'Daniel Berger');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000024', 'Danny Willett');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000025', 'Davis Riley');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000026', 'Dustin Johnson');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000027', 'Ethan Fang');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000028', 'Fifa Laopakdee');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000029', 'Fred Couples');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000030', 'Gary Woodland');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000031', 'Hao-Tong Li');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000032', 'Harris English');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000033', 'Harry Hall');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000034', 'Hideki Matsuyama');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000035', 'J.J. Spaun');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000036', 'Jackson Herrington');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000037', 'Jacob Bridgeman');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000038', 'Jake Knapp');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000039', 'Jason Day');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000040', 'John Keefer');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000041', 'Jon Rahm');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000042', 'Jordan Spieth');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000043', 'Jose Maria Olazabal');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000044', 'Justin Rose');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000045', 'Justin Thomas');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000046', 'Keegan Bradley');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000047', 'Kristoffer Reitan');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000048', 'Kurt Kitayama');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000049', 'Ludvig Aberg');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000050', 'Marco Penge');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000051', 'Mason Howell');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000052', 'Mateo Pulcini');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000053', 'Matt Fitzpatrick');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000054', 'Matthew McCarty');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000055', 'Maverick McNealy');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000056', 'Max Greyserman');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000057', 'Max Homa');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000058', 'Michael Brennan');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000059', 'Michael Kim');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000060', 'Mike Weir');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000061', 'Min Woo Lee');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000062', 'Naoyuki Kataoka');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000063', 'Nick Taylor');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000064', 'Nicolai Hojgaard');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000065', 'Nicolas Echavarria');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000066', 'Patrick Cantlay');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000067', 'Patrick Reed');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000068', 'Rasmus Hojgaard');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000069', 'Rasmus Neergaard-Petersen');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000070', 'Robert MacIntyre');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000071', 'Rory McIlroy');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000072', 'Russell Henley');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000073', 'Ryan Fox');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000074', 'Ryan Gerard');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000075', 'Sam Burns');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000076', 'Sam Stevens');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000077', 'Sami Valimaki');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000078', 'Scottie Scheffler');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000079', 'Sepp Straka');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000080', 'Sergio Garcia');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000081', 'Shane Lowry');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000082', 'Si Woo Kim');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000083', 'Sungjae Im');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000084', 'Tom McKibbin');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000085', 'Tommy Fleetwood');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000086', 'Tyrrell Hatton');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000087', 'Vijay Singh');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000088', 'Viktor Hovland');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000089', 'Wyndham Clark');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000090', 'Xander Schauffele');
INSERT INTO players (id, name) VALUES ('10000000-0000-0000-0000-000000000091', 'Zach Johnson');

-- ===== SCORES =====
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001', 71, 74, 78, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000001', 72, 74, 70, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000003', '00000000-0000-0000-0000-000000000001', 73, 77, 80, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000004', '00000000-0000-0000-0000-000000000001', 84, 75, 80, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000005', '00000000-0000-0000-0000-000000000001', 77, 71, 69, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000006', '00000000-0000-0000-0000-000000000001', 75, 76, 80, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000007', '00000000-0000-0000-0000-000000000001', 79, 81, 80, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000008', '00000000-0000-0000-0000-000000000001', 72, 69, 70, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000009', '00000000-0000-0000-0000-000000000001', NULL, NULL, NULL, NULL, 'wd');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000010', '00000000-0000-0000-0000-000000000001', 71, 73, 69, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000011', '00000000-0000-0000-0000-000000000001', 79, 69, 67, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000012', '00000000-0000-0000-0000-000000000001', 72, 69, 71, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000013', '00000000-0000-0000-0000-000000000001', 76, 74, 80, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000014', '00000000-0000-0000-0000-000000000001', 76, 73, 80, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000015', '00000000-0000-0000-0000-000000000001', 74, 77, 80, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000016', '00000000-0000-0000-0000-000000000001', 73, 67, 65, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000017', '00000000-0000-0000-0000-000000000001', 80, 75, 80, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000018', '00000000-0000-0000-0000-000000000001', 77, 75, 80, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000019', '00000000-0000-0000-0000-000000000001', 75, 73, 77, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000020', '00000000-0000-0000-0000-000000000001', 72, 69, 72, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000021', '00000000-0000-0000-0000-000000000001', 74, 69, 68, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000022', '00000000-0000-0000-0000-000000000001', 75, 73, 71, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000023', '00000000-0000-0000-0000-000000000001', 76, 76, 80, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000024', '00000000-0000-0000-0000-000000000001', 76, 73, 80, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000025', '00000000-0000-0000-0000-000000000001', 82, 80, 80, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000026', '00000000-0000-0000-0000-000000000001', 73, 71, 75, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000027', '00000000-0000-0000-0000-000000000001', 74, 78, 80, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000028', '00000000-0000-0000-0000-000000000001', NULL, NULL, NULL, NULL, 'wd');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000029', '00000000-0000-0000-0000-000000000001', 78, 75, 80, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000030', '00000000-0000-0000-0000-000000000001', 71, 75, 76, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000031', '00000000-0000-0000-0000-000000000001', 71, 69, 69, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000032', '00000000-0000-0000-0000-000000000001', 73, 71, 71, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000033', '00000000-0000-0000-0000-000000000001', 77, 72, 80, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000034', '00000000-0000-0000-0000-000000000001', 72, 70, 72, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000035', '00000000-0000-0000-0000-000000000001', 74, 75, 80, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000036', '00000000-0000-0000-0000-000000000001', 76, 76, 80, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000037', '00000000-0000-0000-0000-000000000001', 71, 74, 69, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000038', '00000000-0000-0000-0000-000000000001', 73, 69, 69, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000039', '00000000-0000-0000-0000-000000000001', 69, 71, 68, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000040', '00000000-0000-0000-0000-000000000001', 76, 79, 80, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000041', '00000000-0000-0000-0000-000000000001', 78, 70, 73, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000042', '00000000-0000-0000-0000-000000000001', 72, 73, 70, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000043', '00000000-0000-0000-0000-000000000001', NULL, NULL, NULL, NULL, 'wd');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000044', '00000000-0000-0000-0000-000000000001', 70, 69, 69, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000045', '00000000-0000-0000-0000-000000000001', 72, 74, 71, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000046', '00000000-0000-0000-0000-000000000001', 72, 74, 73, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000047', '00000000-0000-0000-0000-000000000001', 72, 68, 73, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000048', '00000000-0000-0000-0000-000000000001', 69, 79, 75, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000049', '00000000-0000-0000-0000-000000000001', 74, 70, 69, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000050', '00000000-0000-0000-0000-000000000001', 76, 69, 71, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000051', '00000000-0000-0000-0000-000000000001', 77, 76, 80, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000052', '00000000-0000-0000-0000-000000000001', NULL, NULL, NULL, NULL, 'wd');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000053', '00000000-0000-0000-0000-000000000001', 74, 69, 70, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000054', '00000000-0000-0000-0000-000000000001', NULL, NULL, NULL, NULL, 'wd');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000055', '00000000-0000-0000-0000-000000000001', 77, 70, 70, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000056', '00000000-0000-0000-0000-000000000001', 79, 77, 80, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000057', '00000000-0000-0000-0000-000000000001', 72, 70, 71, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000058', '00000000-0000-0000-0000-000000000001', 72, 71, 70, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000059', '00000000-0000-0000-0000-000000000001', 75, 77, 80, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000060', '00000000-0000-0000-0000-000000000001', NULL, NULL, NULL, NULL, 'wd');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000061', '00000000-0000-0000-0000-000000000001', 78, 77, 80, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000062', '00000000-0000-0000-0000-000000000001', NULL, NULL, NULL, NULL, 'wd');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000063', '00000000-0000-0000-0000-000000000001', 71, 72, 70, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000064', '00000000-0000-0000-0000-000000000001', 76, 74, 80, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000065', '00000000-0000-0000-0000-000000000001', 79, 78, 80, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000066', '00000000-0000-0000-0000-000000000001', 77, 67, 66, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000067', '00000000-0000-0000-0000-000000000001', 69, 69, 72, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000068', '00000000-0000-0000-0000-000000000001', 78, 70, 73, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000069', '00000000-0000-0000-0000-000000000001', 77, 74, 80, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000070', '00000000-0000-0000-0000-000000000001', 80, 71, 80, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000071', '00000000-0000-0000-0000-000000000001', 67, 65, 73, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000072', '00000000-0000-0000-0000-000000000001', 73, 71, 66, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000073', '00000000-0000-0000-0000-000000000001', 77, 72, 80, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000074', '00000000-0000-0000-0000-000000000001', 72, 72, 68, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000075', '00000000-0000-0000-0000-000000000001', 67, 71, 68, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000076', '00000000-0000-0000-0000-000000000001', 72, 74, 70, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000077', '00000000-0000-0000-0000-000000000001', 80, 75, 80, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000078', '00000000-0000-0000-0000-000000000001', 70, 74, 65, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000079', '00000000-0000-0000-0000-000000000001', 73, 72, 69, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000080', '00000000-0000-0000-0000-000000000001', 72, 75, 74, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000081', '00000000-0000-0000-0000-000000000001', 70, 69, 68, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000082', '00000000-0000-0000-0000-000000000001', 75, 73, 72, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000083', '00000000-0000-0000-0000-000000000001', 76, 69, 69, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000084', '00000000-0000-0000-0000-000000000001', NULL, NULL, NULL, NULL, 'wd');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000085', '00000000-0000-0000-0000-000000000001', 71, 68, 73, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000086', '00000000-0000-0000-0000-000000000001', 74, 66, 72, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000087', '00000000-0000-0000-0000-000000000001', NULL, NULL, NULL, NULL, 'wd');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000088', '00000000-0000-0000-0000-000000000001', 75, 71, 71, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000089', '00000000-0000-0000-0000-000000000001', 72, 68, 72, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000090', '00000000-0000-0000-0000-000000000001', 70, 72, 70, NULL, 'active');
INSERT INTO scores (player_id, tournament_id, round_1, round_2, round_3, round_4, status)
VALUES ('10000000-0000-0000-0000-000000000091', '00000000-0000-0000-0000-000000000001', 75, 75, 80, NULL, 'active');

-- ===== TEAMS & ROSTERS =====
INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001', 'Patrick Kane', 'Patrick Kane', -11);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000016');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000088');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000032');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000083');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000089');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000058');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000001', 'Walker Cook', 'Walker Cook', -12);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000078');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000070');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000022');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000083');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000059');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000010');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000003', '00000000-0000-0000-0000-000000000001', 'Mike Frasco', 'Mike Frasco', -11);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000003', '10000000-0000-0000-0000-000000000078');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000003', '10000000-0000-0000-0000-000000000070');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000003', '10000000-0000-0000-0000-000000000035');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000003', '10000000-0000-0000-0000-000000000005');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000003', '10000000-0000-0000-0000-000000000065');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000003', '10000000-0000-0000-0000-000000000058');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000004', '00000000-0000-0000-0000-000000000001', 'Nick Tortoriello', 'Nick Tortoriello', -14);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000004', '10000000-0000-0000-0000-000000000013');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000004', '10000000-0000-0000-0000-000000000003');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000004', '10000000-0000-0000-0000-000000000075');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000004', '10000000-0000-0000-0000-000000000030');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000004', '10000000-0000-0000-0000-000000000065');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000004', '10000000-0000-0000-0000-000000000077');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000005', '00000000-0000-0000-0000-000000000001', 'Max Betzig #1', 'Max Betzig #1', -16);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000005', '10000000-0000-0000-0000-000000000041');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000005', '10000000-0000-0000-0000-000000000067');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000005', '10000000-0000-0000-0000-000000000035');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000005', '10000000-0000-0000-0000-000000000046');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000005', '10000000-0000-0000-0000-000000000059');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000005', '10000000-0000-0000-0000-000000000051');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000006', '00000000-0000-0000-0000-000000000001', 'Max Betzig #2', 'Max Betzig #2', -15);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000006', '10000000-0000-0000-0000-000000000078');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000006', '10000000-0000-0000-0000-000000000038');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000006', '10000000-0000-0000-0000-000000000064');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000006', '10000000-0000-0000-0000-000000000033');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000006', '10000000-0000-0000-0000-000000000056');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000006', '10000000-0000-0000-0000-000000000027');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000007', '00000000-0000-0000-0000-000000000001', 'Kyle Gray', 'Kyle Gray', -14);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000007', '10000000-0000-0000-0000-000000000078');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000007', '10000000-0000-0000-0000-000000000067');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000007', '10000000-0000-0000-0000-000000000035');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000007', '10000000-0000-0000-0000-000000000030');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000007', '10000000-0000-0000-0000-000000000089');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000007', '10000000-0000-0000-0000-000000000004');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000008', '00000000-0000-0000-0000-000000000001', 'Nate Perna', 'Nate Perna', -14);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000008', '10000000-0000-0000-0000-000000000016');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000008', '10000000-0000-0000-0000-000000000082');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000008', '10000000-0000-0000-0000-000000000035');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000008', '10000000-0000-0000-0000-000000000083');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000008', '10000000-0000-0000-0000-000000000089');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000008', '10000000-0000-0000-0000-000000000014');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000009', '00000000-0000-0000-0000-000000000001', 'Tim Bell', 'Tim Bell', -14);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000009', '10000000-0000-0000-0000-000000000013');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000009', '10000000-0000-0000-0000-000000000067');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000009', '10000000-0000-0000-0000-000000000015');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000009', '10000000-0000-0000-0000-000000000063');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000009', '10000000-0000-0000-0000-000000000018');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000009', '10000000-0000-0000-0000-000000000025');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000010', '00000000-0000-0000-0000-000000000001', 'Jack Moore', 'Jack Moore', -13);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000078');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000039');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000081');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000083');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000089');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000091');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000011', '00000000-0000-0000-0000-000000000001', 'Kyle Griffith', 'Kyle Griffith', -10);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000013');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000067');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000064');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000030');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000056');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000051');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000012', '00000000-0000-0000-0000-000000000001', 'Rashad Masri', 'Rashad Masri', -12);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000078');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000003');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000035');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000063');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000056');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000058');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000013', '00000000-0000-0000-0000-000000000001', 'Stan Coville', 'Stan Coville', -13);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000049');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000020');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000035');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000083');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000040');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000004');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000014', '00000000-0000-0000-0000-000000000001', 'Alex McVey', 'Alex McVey', -11);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000078');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000072');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000022');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000083');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000080');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000019');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000015', '00000000-0000-0000-0000-000000000001', 'Chris Lynch', 'Chris Lynch', -14);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000085');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000066');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000022');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000011');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000059');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000025');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000016', '00000000-0000-0000-0000-000000000001', 'Lawrence Sutton', 'Lawrence Sutton', -10);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000016', '10000000-0000-0000-0000-000000000053');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000016', '10000000-0000-0000-0000-000000000020');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000016', '10000000-0000-0000-0000-000000000035');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000016', '10000000-0000-0000-0000-000000000050');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000016', '10000000-0000-0000-0000-000000000047');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000016', '10000000-0000-0000-0000-000000000004');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000017', '00000000-0000-0000-0000-000000000001', 'Ryan Bolanowski', 'Ryan Bolanowski', -13);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000017', '10000000-0000-0000-0000-000000000071');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000017', '10000000-0000-0000-0000-000000000072');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000017', '10000000-0000-0000-0000-000000000015');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000017', '10000000-0000-0000-0000-000000000046');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000017', '10000000-0000-0000-0000-000000000026');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000017', '10000000-0000-0000-0000-000000000014');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000018', '00000000-0000-0000-0000-000000000001', 'Dave Acton', 'Dave Acton', -13);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000018', '10000000-0000-0000-0000-000000000016');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000018', '10000000-0000-0000-0000-000000000070');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000018', '10000000-0000-0000-0000-000000000081');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000018', '10000000-0000-0000-0000-000000000030');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000018', '10000000-0000-0000-0000-000000000031');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000018', '10000000-0000-0000-0000-000000000004');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000019', '00000000-0000-0000-0000-000000000001', 'Jason Martens', 'Jason Martens', -11);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000019', '10000000-0000-0000-0000-000000000078');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000019', '10000000-0000-0000-0000-000000000067');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000019', '10000000-0000-0000-0000-000000000035');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000019', '10000000-0000-0000-0000-000000000030');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000019', '10000000-0000-0000-0000-000000000026');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000019', '10000000-0000-0000-0000-000000000091');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000020', '00000000-0000-0000-0000-000000000001', 'John Marchese', 'John Marchese', -10);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000020', '10000000-0000-0000-0000-000000000016');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000020', '10000000-0000-0000-0000-000000000070');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000020', '10000000-0000-0000-0000-000000000037');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000020', '10000000-0000-0000-0000-000000000083');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000020', '10000000-0000-0000-0000-000000000026');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000020', '10000000-0000-0000-0000-000000000058');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000021', '00000000-0000-0000-0000-000000000001', 'Peter Moran', 'Peter Moran', -12);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000021', '10000000-0000-0000-0000-000000000078');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000021', '10000000-0000-0000-0000-000000000061');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000021', '10000000-0000-0000-0000-000000000081');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000021', '10000000-0000-0000-0000-000000000083');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000021', '10000000-0000-0000-0000-000000000026');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000021', '10000000-0000-0000-0000-000000000014');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000022', '00000000-0000-0000-0000-000000000001', 'George Straub', 'George Straub', -9);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000022', '10000000-0000-0000-0000-000000000078');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000022', '10000000-0000-0000-0000-000000000045');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000022', '10000000-0000-0000-0000-000000000015');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000022', '10000000-0000-0000-0000-000000000001');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000022', '10000000-0000-0000-0000-000000000056');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000022', '10000000-0000-0000-0000-000000000025');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000023', '00000000-0000-0000-0000-000000000001', 'Jim Callahan', 'Jim Callahan', -9);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000023', '10000000-0000-0000-0000-000000000049');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000023', '10000000-0000-0000-0000-000000000070');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000023', '10000000-0000-0000-0000-000000000023');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000023', '10000000-0000-0000-0000-000000000046');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000023', '10000000-0000-0000-0000-000000000089');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000023', '10000000-0000-0000-0000-000000000091');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000024', '00000000-0000-0000-0000-000000000001', 'David Sweany', 'David Sweany', -14);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000024', '10000000-0000-0000-0000-000000000041');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000024', '10000000-0000-0000-0000-000000000020');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000024', '10000000-0000-0000-0000-000000000022');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000024', '10000000-0000-0000-0000-000000000030');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000024', '10000000-0000-0000-0000-000000000059');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000024', '10000000-0000-0000-0000-000000000058');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000025', '00000000-0000-0000-0000-000000000001', 'Kristin Davis', 'Kristin Davis', -13);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000025', '10000000-0000-0000-0000-000000000085');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000025', '10000000-0000-0000-0000-000000000088');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000025', '10000000-0000-0000-0000-000000000035');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000025', '10000000-0000-0000-0000-000000000057');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000025', '10000000-0000-0000-0000-000000000089');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000025', '10000000-0000-0000-0000-000000000004');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000026', '00000000-0000-0000-0000-000000000001', 'Brandon Davis', 'Brandon Davis', -12);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000026', '10000000-0000-0000-0000-000000000049');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000026', '10000000-0000-0000-0000-000000000070');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000026', '10000000-0000-0000-0000-000000000086');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000026', '10000000-0000-0000-0000-000000000057');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000026', '10000000-0000-0000-0000-000000000056');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000026', '10000000-0000-0000-0000-000000000025');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000027', '00000000-0000-0000-0000-000000000001', 'Brendan Ziegler', 'Brendan Ziegler', -13);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000027', '10000000-0000-0000-0000-000000000078');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000027', '10000000-0000-0000-0000-000000000067');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000027', '10000000-0000-0000-0000-000000000035');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000027', '10000000-0000-0000-0000-000000000057');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000027', '10000000-0000-0000-0000-000000000059');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000027', '10000000-0000-0000-0000-000000000025');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000028', '00000000-0000-0000-0000-000000000001', 'Alex Bronzo', 'Alex Bronzo', -12);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000028', '10000000-0000-0000-0000-000000000013');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000028', '10000000-0000-0000-0000-000000000038');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000028', '10000000-0000-0000-0000-000000000035');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000028', '10000000-0000-0000-0000-000000000083');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000028', '10000000-0000-0000-0000-000000000040');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000028', '10000000-0000-0000-0000-000000000077');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000029', '00000000-0000-0000-0000-000000000001', 'Pat Coughlin', 'Pat Coughlin', -15);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000029', '10000000-0000-0000-0000-000000000078');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000029', '10000000-0000-0000-0000-000000000067');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000029', '10000000-0000-0000-0000-000000000086');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000029', '10000000-0000-0000-0000-000000000046');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000029', '10000000-0000-0000-0000-000000000089');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000029', '10000000-0000-0000-0000-000000000077');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000030', '00000000-0000-0000-0000-000000000001', 'Nicholas Chipolet', 'Nicholas Chipolet', -13);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000030', '10000000-0000-0000-0000-000000000016');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000030', '10000000-0000-0000-0000-000000000070');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000030', '10000000-0000-0000-0000-000000000081');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000030', '10000000-0000-0000-0000-000000000083');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000030', '10000000-0000-0000-0000-000000000089');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000030', '10000000-0000-0000-0000-000000000058');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000031', '00000000-0000-0000-0000-000000000001', 'Ray Griffith', 'Ray Griffith', -13);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000031', '10000000-0000-0000-0000-000000000049');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000031', '10000000-0000-0000-0000-000000000070');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000031', '10000000-0000-0000-0000-000000000081');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000031', '10000000-0000-0000-0000-000000000030');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000031', '10000000-0000-0000-0000-000000000031');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000031', '10000000-0000-0000-0000-000000000004');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000032', '00000000-0000-0000-0000-000000000001', 'Aaron Kitchen', 'Aaron Kitchen', -10);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000032', '10000000-0000-0000-0000-000000000013');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000032', '10000000-0000-0000-0000-000000000020');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000032', '10000000-0000-0000-0000-000000000064');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000032', '10000000-0000-0000-0000-000000000083');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000032', '10000000-0000-0000-0000-000000000056');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000032', '10000000-0000-0000-0000-000000000004');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000033', '00000000-0000-0000-0000-000000000001', 'Blake Heim', 'Blake Heim', -13);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000033', '10000000-0000-0000-0000-000000000016');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000033', '10000000-0000-0000-0000-000000000067');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000033', '10000000-0000-0000-0000-000000000032');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000033', '10000000-0000-0000-0000-000000000083');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000033', '10000000-0000-0000-0000-000000000089');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000033', '10000000-0000-0000-0000-000000000058');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000034', '00000000-0000-0000-0000-000000000001', 'Andrew Stack', 'Andrew Stack', -13);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000034', '10000000-0000-0000-0000-000000000078');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000034', '10000000-0000-0000-0000-000000000070');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000034', '10000000-0000-0000-0000-000000000037');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000034', '10000000-0000-0000-0000-000000000005');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000034', '10000000-0000-0000-0000-000000000059');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000034', '10000000-0000-0000-0000-000000000004');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000035', '00000000-0000-0000-0000-000000000001', 'Joe Arnolde', 'Joe Arnolde', -13);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000035', '10000000-0000-0000-0000-000000000016');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000035', '10000000-0000-0000-0000-000000000088');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000035', '10000000-0000-0000-0000-000000000081');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000035', '10000000-0000-0000-0000-000000000057');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000035', '10000000-0000-0000-0000-000000000089');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000035', '10000000-0000-0000-0000-000000000014');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000036', '00000000-0000-0000-0000-000000000001', 'Derek Dubois #1', 'Derek Dubois #1', -14);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000036', '10000000-0000-0000-0000-000000000090');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000036', '10000000-0000-0000-0000-000000000088');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000036', '10000000-0000-0000-0000-000000000081');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000036', '10000000-0000-0000-0000-000000000011');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000036', '10000000-0000-0000-0000-000000000056');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000036', '10000000-0000-0000-0000-000000000025');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000037', '00000000-0000-0000-0000-000000000001', 'Derek Dubois #2', 'Derek Dubois #2', -15);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000037', '10000000-0000-0000-0000-000000000013');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000037', '10000000-0000-0000-0000-000000000067');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000037', '10000000-0000-0000-0000-000000000081');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000037', '10000000-0000-0000-0000-000000000068');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000037', '10000000-0000-0000-0000-000000000056');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000037', '10000000-0000-0000-0000-000000000077');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000038', '00000000-0000-0000-0000-000000000001', 'Brian Glennon', 'Brian Glennon', -13);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000038', '10000000-0000-0000-0000-000000000041');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000038', '10000000-0000-0000-0000-000000000082');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000038', '10000000-0000-0000-0000-000000000008');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000038', '10000000-0000-0000-0000-000000000011');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000038', '10000000-0000-0000-0000-000000000089');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000038', '10000000-0000-0000-0000-000000000014');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000039', '00000000-0000-0000-0000-000000000001', 'Olivier Liegeon', 'Olivier Liegeon', -13);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000039', '10000000-0000-0000-0000-000000000078');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000039', '10000000-0000-0000-0000-000000000072');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000039', '10000000-0000-0000-0000-000000000086');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000039', '10000000-0000-0000-0000-000000000057');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000039', '10000000-0000-0000-0000-000000000089');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000039', '10000000-0000-0000-0000-000000000004');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000040', '00000000-0000-0000-0000-000000000001', 'Andy Adams', 'Andy Adams', -10);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000040', '10000000-0000-0000-0000-000000000049');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000040', '10000000-0000-0000-0000-000000000003');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000040', '10000000-0000-0000-0000-000000000037');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000040', '10000000-0000-0000-0000-000000000057');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000040', '10000000-0000-0000-0000-000000000059');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000040', '10000000-0000-0000-0000-000000000058');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000041', '00000000-0000-0000-0000-000000000001', 'Jacob Solus', 'Jacob Solus', -14);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000041', '10000000-0000-0000-0000-000000000013');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000041', '10000000-0000-0000-0000-000000000082');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000041', '10000000-0000-0000-0000-000000000022');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000041', '10000000-0000-0000-0000-000000000068');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000041', '10000000-0000-0000-0000-000000000018');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000041', '10000000-0000-0000-0000-000000000004');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000042', '00000000-0000-0000-0000-000000000001', 'Amandeep Parmar', 'Amandeep Parmar', -12);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000042', '10000000-0000-0000-0000-000000000078');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000042', '10000000-0000-0000-0000-000000000038');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000042', '10000000-0000-0000-0000-000000000055');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000042', '10000000-0000-0000-0000-000000000083');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000042', '10000000-0000-0000-0000-000000000018');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000042', '10000000-0000-0000-0000-000000000025');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000043', '00000000-0000-0000-0000-000000000001', 'Joe Walsh', 'Joe Walsh', -12);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000043', '10000000-0000-0000-0000-000000000049');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000043', '10000000-0000-0000-0000-000000000079');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000043', '10000000-0000-0000-0000-000000000037');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000043', '10000000-0000-0000-0000-000000000046');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000043', '10000000-0000-0000-0000-000000000080');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000043', '10000000-0000-0000-0000-000000000077');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000044', '00000000-0000-0000-0000-000000000001', 'Owen Fried', 'Owen Fried', -11);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000044', '10000000-0000-0000-0000-000000000049');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000044', '10000000-0000-0000-0000-000000000088');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000044', '10000000-0000-0000-0000-000000000015');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000044', '10000000-0000-0000-0000-000000000083');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000044', '10000000-0000-0000-0000-000000000089');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000044', '10000000-0000-0000-0000-000000000004');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000045', '00000000-0000-0000-0000-000000000001', 'Sean Knightly', 'Sean Knightly', -12);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000045', '10000000-0000-0000-0000-000000000078');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000045', '10000000-0000-0000-0000-000000000072');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000045', '10000000-0000-0000-0000-000000000015');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000045', '10000000-0000-0000-0000-000000000083');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000045', '10000000-0000-0000-0000-000000000089');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000045', '10000000-0000-0000-0000-000000000014');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000046', '00000000-0000-0000-0000-000000000001', 'Eric Mutch', 'Eric Mutch', -13);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000046', '10000000-0000-0000-0000-000000000041');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000046', '10000000-0000-0000-0000-000000000088');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000046', '10000000-0000-0000-0000-000000000081');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000046', '10000000-0000-0000-0000-000000000030');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000046', '10000000-0000-0000-0000-000000000065');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000046', '10000000-0000-0000-0000-000000000058');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000047', '00000000-0000-0000-0000-000000000001', 'Sam Archibald', 'Sam Archibald', -17);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000047', '10000000-0000-0000-0000-000000000044');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000047', '10000000-0000-0000-0000-000000000067');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000047', '10000000-0000-0000-0000-000000000035');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000047', '10000000-0000-0000-0000-000000000030');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000047', '10000000-0000-0000-0000-000000000056');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000047', '10000000-0000-0000-0000-000000000024');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000048', '00000000-0000-0000-0000-000000000001', 'Michael Kologlu', 'Michael Kologlu', -15);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000048', '10000000-0000-0000-0000-000000000013');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000048', '10000000-0000-0000-0000-000000000003');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000048', '10000000-0000-0000-0000-000000000022');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000048', '10000000-0000-0000-0000-000000000030');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000048', '10000000-0000-0000-0000-000000000056');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000048', '10000000-0000-0000-0000-000000000004');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000049', '00000000-0000-0000-0000-000000000001', 'Lucas Foster', 'Lucas Foster', -10);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000049', '10000000-0000-0000-0000-000000000016');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000049', '10000000-0000-0000-0000-000000000045');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000049', '10000000-0000-0000-0000-000000000008');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000049', '10000000-0000-0000-0000-000000000046');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000049', '10000000-0000-0000-0000-000000000040');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000049', '10000000-0000-0000-0000-000000000091');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000050', '00000000-0000-0000-0000-000000000001', 'Dan Koziol', 'Dan Koziol', -8);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000050', '10000000-0000-0000-0000-000000000071');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000050', '10000000-0000-0000-0000-000000000067');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000050', '10000000-0000-0000-0000-000000000035');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000050', '10000000-0000-0000-0000-000000000083');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000050', '10000000-0000-0000-0000-000000000056');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000050', '10000000-0000-0000-0000-000000000051');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000051', '00000000-0000-0000-0000-000000000001', 'Mike McInnis', 'Mike McInnis', -14);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000051', '10000000-0000-0000-0000-000000000078');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000051', '10000000-0000-0000-0000-000000000002');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000051', '10000000-0000-0000-0000-000000000022');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000051', '10000000-0000-0000-0000-000000000011');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000051', '10000000-0000-0000-0000-000000000056');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000051', '10000000-0000-0000-0000-000000000019');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000052', '00000000-0000-0000-0000-000000000001', 'Matt McInnis', 'Matt McInnis', -11);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000052', '10000000-0000-0000-0000-000000000078');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000052', '10000000-0000-0000-0000-000000000067');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000052', '10000000-0000-0000-0000-000000000035');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000052', '10000000-0000-0000-0000-000000000083');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000052', '10000000-0000-0000-0000-000000000065');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000052', '10000000-0000-0000-0000-000000000077');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000053', '00000000-0000-0000-0000-000000000001', 'Kurt Gitchell', 'Kurt Gitchell', -11);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000053', '10000000-0000-0000-0000-000000000044');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000053', '10000000-0000-0000-0000-000000000003');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000053', '10000000-0000-0000-0000-000000000037');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000053', '10000000-0000-0000-0000-000000000057');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000053', '10000000-0000-0000-0000-000000000059');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000053', '10000000-0000-0000-0000-000000000091');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000054', '00000000-0000-0000-0000-000000000001', 'Conor Byrne', 'Conor Byrne', -10);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000054', '10000000-0000-0000-0000-000000000090');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000054', '10000000-0000-0000-0000-000000000072');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000054', '10000000-0000-0000-0000-000000000015');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000054', '10000000-0000-0000-0000-000000000046');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000054', '10000000-0000-0000-0000-000000000089');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000054', '10000000-0000-0000-0000-000000000058');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000055', '00000000-0000-0000-0000-000000000001', 'Bradley Cothran', 'Bradley Cothran', -12);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000055', '10000000-0000-0000-0000-000000000078');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000055', '10000000-0000-0000-0000-000000000072');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000055', '10000000-0000-0000-0000-000000000022');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000055', '10000000-0000-0000-0000-000000000073');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000055', '10000000-0000-0000-0000-000000000006');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000055', '10000000-0000-0000-0000-000000000036');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000056', '00000000-0000-0000-0000-000000000001', 'PJ Tierney', 'PJ Tierney', -12);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000056', '10000000-0000-0000-0000-000000000049');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000056', '10000000-0000-0000-0000-000000000070');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000056', '10000000-0000-0000-0000-000000000032');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000056', '10000000-0000-0000-0000-000000000046');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000056', '10000000-0000-0000-0000-000000000026');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000056', '10000000-0000-0000-0000-000000000091');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000057', '00000000-0000-0000-0000-000000000001', 'Kelsey King', 'Kelsey King', -9);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000057', '10000000-0000-0000-0000-000000000085');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000057', '10000000-0000-0000-0000-000000000045');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000057', '10000000-0000-0000-0000-000000000055');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000057', '10000000-0000-0000-0000-000000000030');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000057', '10000000-0000-0000-0000-000000000006');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000057', '10000000-0000-0000-0000-000000000058');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000058', '00000000-0000-0000-0000-000000000001', 'Judy Lucas', 'Judy Lucas', -12);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000058', '10000000-0000-0000-0000-000000000085');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000058', '10000000-0000-0000-0000-000000000061');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000058', '10000000-0000-0000-0000-000000000055');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000058', '10000000-0000-0000-0000-000000000046');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000058', '10000000-0000-0000-0000-000000000040');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000058', '10000000-0000-0000-0000-000000000091');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000059', '00000000-0000-0000-0000-000000000001', 'Jon Muir', 'Jon Muir', -15);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000059', '10000000-0000-0000-0000-000000000049');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000059', '10000000-0000-0000-0000-000000000082');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000059', '10000000-0000-0000-0000-000000000008');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000059', '10000000-0000-0000-0000-000000000046');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000059', '10000000-0000-0000-0000-000000000017');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000059', '10000000-0000-0000-0000-000000000058');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000060', '00000000-0000-0000-0000-000000000001', 'Liam Rigney', 'Liam Rigney', -11);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000060', '10000000-0000-0000-0000-000000000078');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000060', '10000000-0000-0000-0000-000000000067');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000060', '10000000-0000-0000-0000-000000000022');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000060', '10000000-0000-0000-0000-000000000083');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000060', '10000000-0000-0000-0000-000000000026');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000060', '10000000-0000-0000-0000-000000000014');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000061', '00000000-0000-0000-0000-000000000001', 'Alex Teresky', 'Alex Teresky', -16);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000061', '10000000-0000-0000-0000-000000000071');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000061', '10000000-0000-0000-0000-000000000088');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000061', '10000000-0000-0000-0000-000000000022');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000061', '10000000-0000-0000-0000-000000000083');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000061', '10000000-0000-0000-0000-000000000089');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000061', '10000000-0000-0000-0000-000000000025');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000062', '00000000-0000-0000-0000-000000000001', 'Sean Stevens', 'Sean Stevens', -15);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000062', '10000000-0000-0000-0000-000000000090');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000062', '10000000-0000-0000-0000-000000000079');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000062', '10000000-0000-0000-0000-000000000035');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000062', '10000000-0000-0000-0000-000000000083');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000062', '10000000-0000-0000-0000-000000000056');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000062', '10000000-0000-0000-0000-000000000019');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000063', '00000000-0000-0000-0000-000000000001', 'Kevin Kane', 'Kevin Kane', -11);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000063', '10000000-0000-0000-0000-000000000049');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000063', '10000000-0000-0000-0000-000000000003');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000063', '10000000-0000-0000-0000-000000000064');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000063', '10000000-0000-0000-0000-000000000068');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000063', '10000000-0000-0000-0000-000000000059');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000063', '10000000-0000-0000-0000-000000000091');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000064', '00000000-0000-0000-0000-000000000001', 'Layth Masri', 'Layth Masri', -12);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000064', '10000000-0000-0000-0000-000000000053');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000064', '10000000-0000-0000-0000-000000000070');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000064', '10000000-0000-0000-0000-000000000037');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000064', '10000000-0000-0000-0000-000000000074');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000064', '10000000-0000-0000-0000-000000000059');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000064', '10000000-0000-0000-0000-000000000004');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000065', '00000000-0000-0000-0000-000000000001', 'Tommy Walsh', 'Tommy Walsh', -12);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000065', '10000000-0000-0000-0000-000000000085');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000065', '10000000-0000-0000-0000-000000000061');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000065', '10000000-0000-0000-0000-000000000008');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000065', '10000000-0000-0000-0000-000000000068');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000065', '10000000-0000-0000-0000-000000000006');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000065', '10000000-0000-0000-0000-000000000091');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000066', '00000000-0000-0000-0000-000000000001', 'Kevin Hiller', 'Kevin Hiller', -11);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000066', '10000000-0000-0000-0000-000000000078');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000066', '10000000-0000-0000-0000-000000000072');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000066', '10000000-0000-0000-0000-000000000022');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000066', '10000000-0000-0000-0000-000000000083');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000066', '10000000-0000-0000-0000-000000000089');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000066', '10000000-0000-0000-0000-000000000025');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000067', '00000000-0000-0000-0000-000000000001', 'Ryan Blumberg', 'Ryan Blumberg', -11);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000067', '10000000-0000-0000-0000-000000000078');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000067', '10000000-0000-0000-0000-000000000067');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000067', '10000000-0000-0000-0000-000000000081');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000067', '10000000-0000-0000-0000-000000000057');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000067', '10000000-0000-0000-0000-000000000026');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000067', '10000000-0000-0000-0000-000000000091');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000068', '00000000-0000-0000-0000-000000000001', 'Jim Glennon', 'Jim Glennon', -10);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000068', '10000000-0000-0000-0000-000000000078');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000068', '10000000-0000-0000-0000-000000000070');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000068', '10000000-0000-0000-0000-000000000035');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000068', '10000000-0000-0000-0000-000000000046');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000068', '10000000-0000-0000-0000-000000000059');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000068', '10000000-0000-0000-0000-000000000077');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000069', '00000000-0000-0000-0000-000000000001', 'Kurt Kafka', 'Kurt Kafka', -12);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000069', '10000000-0000-0000-0000-000000000013');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000069', '10000000-0000-0000-0000-000000000020');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000069', '10000000-0000-0000-0000-000000000022');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000069', '10000000-0000-0000-0000-000000000011');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000069', '10000000-0000-0000-0000-000000000089');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000069', '10000000-0000-0000-0000-000000000019');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000070', '00000000-0000-0000-0000-000000000001', 'Rob Ruszkowski', 'Rob Ruszkowski', -12);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000070', '10000000-0000-0000-0000-000000000044');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000070', '10000000-0000-0000-0000-000000000088');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000070', '10000000-0000-0000-0000-000000000081');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000070', '10000000-0000-0000-0000-000000000046');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000070', '10000000-0000-0000-0000-000000000056');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000070', '10000000-0000-0000-0000-000000000024');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000071', '00000000-0000-0000-0000-000000000001', 'Kelly Mutch', 'Kelly Mutch', -11);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000071', '10000000-0000-0000-0000-000000000078');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000071', '10000000-0000-0000-0000-000000000045');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000071', '10000000-0000-0000-0000-000000000035');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000071', '10000000-0000-0000-0000-000000000046');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000071', '10000000-0000-0000-0000-000000000080');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000071', '10000000-0000-0000-0000-000000000014');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000072', '00000000-0000-0000-0000-000000000001', 'Matt Walsh', 'Matt Walsh', -15);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000072', '10000000-0000-0000-0000-000000000044');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000072', '10000000-0000-0000-0000-000000000039');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000072', '10000000-0000-0000-0000-000000000081');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000072', '10000000-0000-0000-0000-000000000057');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000072', '10000000-0000-0000-0000-000000000006');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000072', '10000000-0000-0000-0000-000000000029');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000073', '00000000-0000-0000-0000-000000000001', 'Phil Horvath', 'Phil Horvath', -17);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000073', '10000000-0000-0000-0000-000000000078');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000073', '10000000-0000-0000-0000-000000000072');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000073', '10000000-0000-0000-0000-000000000086');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000073', '10000000-0000-0000-0000-000000000046');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000073', '10000000-0000-0000-0000-000000000018');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000073', '10000000-0000-0000-0000-000000000019');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000074', '00000000-0000-0000-0000-000000000001', 'Lisa Gitchell', 'Lisa Gitchell', -9);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000074', '10000000-0000-0000-0000-000000000034');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000074', '10000000-0000-0000-0000-000000000082');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000074', '10000000-0000-0000-0000-000000000035');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000074', '10000000-0000-0000-0000-000000000046');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000074', '10000000-0000-0000-0000-000000000056');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000074', '10000000-0000-0000-0000-000000000058');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000075', '00000000-0000-0000-0000-000000000001', 'Colin Carstens', 'Colin Carstens', -14);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000075', '10000000-0000-0000-0000-000000000016');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000075', '10000000-0000-0000-0000-000000000061');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000075', '10000000-0000-0000-0000-000000000064');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000075', '10000000-0000-0000-0000-000000000057');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000075', '10000000-0000-0000-0000-000000000056');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000075', '10000000-0000-0000-0000-000000000077');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000076', '00000000-0000-0000-0000-000000000001', 'Nicole Arnolde', 'Nicole Arnolde', -11);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000076', '10000000-0000-0000-0000-000000000071');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000076', '10000000-0000-0000-0000-000000000079');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000076', '10000000-0000-0000-0000-000000000075');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000076', '10000000-0000-0000-0000-000000000057');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000076', '10000000-0000-0000-0000-000000000089');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000076', '10000000-0000-0000-0000-000000000004');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000077', '00000000-0000-0000-0000-000000000001', 'Matt Rindler', 'Matt Rindler', -13);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000077', '10000000-0000-0000-0000-000000000078');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000077', '10000000-0000-0000-0000-000000000061');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000077', '10000000-0000-0000-0000-000000000064');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000077', '10000000-0000-0000-0000-000000000050');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000077', '10000000-0000-0000-0000-000000000047');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000077', '10000000-0000-0000-0000-000000000004');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000078', '00000000-0000-0000-0000-000000000001', 'Shawn Williamsen', 'Shawn Williamsen', -13);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000078', '10000000-0000-0000-0000-000000000013');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000078', '10000000-0000-0000-0000-000000000066');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000078', '10000000-0000-0000-0000-000000000035');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000078', '10000000-0000-0000-0000-000000000083');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000078', '10000000-0000-0000-0000-000000000026');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000078', '10000000-0000-0000-0000-000000000014');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000079', '00000000-0000-0000-0000-000000000001', 'Ted Orben', 'Ted Orben', -11);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000079', '10000000-0000-0000-0000-000000000071');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000079', '10000000-0000-0000-0000-000000000088');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000079', '10000000-0000-0000-0000-000000000081');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000079', '10000000-0000-0000-0000-000000000057');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000079', '10000000-0000-0000-0000-000000000089');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000079', '10000000-0000-0000-0000-000000000004');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000080', '00000000-0000-0000-0000-000000000001', 'Mike Kane', 'Mike Kane', -12);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000080', '10000000-0000-0000-0000-000000000041');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000080', '10000000-0000-0000-0000-000000000088');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000080', '10000000-0000-0000-0000-000000000022');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000080', '10000000-0000-0000-0000-000000000083');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000080', '10000000-0000-0000-0000-000000000089');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000080', '10000000-0000-0000-0000-000000000091');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000081', '00000000-0000-0000-0000-000000000001', 'Catherine Kane', 'Catherine Kane', -11);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000081', '10000000-0000-0000-0000-000000000078');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000081', '10000000-0000-0000-0000-000000000088');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000081', '10000000-0000-0000-0000-000000000075');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000081', '10000000-0000-0000-0000-000000000083');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000081', '10000000-0000-0000-0000-000000000089');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000081', '10000000-0000-0000-0000-000000000025');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000082', '00000000-0000-0000-0000-000000000001', 'Kevin Murphy', 'Kevin Murphy', -13);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000082', '10000000-0000-0000-0000-000000000016');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000082', '10000000-0000-0000-0000-000000000020');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000082', '10000000-0000-0000-0000-000000000035');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000082', '10000000-0000-0000-0000-000000000046');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000082', '10000000-0000-0000-0000-000000000059');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000082', '10000000-0000-0000-0000-000000000091');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000083', '00000000-0000-0000-0000-000000000001', 'Erin Murphy', 'Erin Murphy', -12);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000083', '10000000-0000-0000-0000-000000000041');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000083', '10000000-0000-0000-0000-000000000088');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000083', '10000000-0000-0000-0000-000000000015');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000083', '10000000-0000-0000-0000-000000000057');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000083', '10000000-0000-0000-0000-000000000026');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000083', '10000000-0000-0000-0000-000000000004');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000084', '00000000-0000-0000-0000-000000000001', 'Alyssa Louison', 'Alyssa Louison', -15);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000084', '10000000-0000-0000-0000-000000000078');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000084', '10000000-0000-0000-0000-000000000088');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000084', '10000000-0000-0000-0000-000000000055');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000084', '10000000-0000-0000-0000-000000000046');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000084', '10000000-0000-0000-0000-000000000047');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000084', '10000000-0000-0000-0000-000000000077');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000085', '00000000-0000-0000-0000-000000000001', 'Steve Jacobs', 'Steve Jacobs', -12);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000085', '10000000-0000-0000-0000-000000000013');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000085', '10000000-0000-0000-0000-000000000003');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000085', '10000000-0000-0000-0000-000000000008');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000085', '10000000-0000-0000-0000-000000000030');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000085', '10000000-0000-0000-0000-000000000089');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000085', '10000000-0000-0000-0000-000000000058');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000086', '00000000-0000-0000-0000-000000000001', 'Lauren Seymour #1', 'Lauren Seymour #1', -10);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000086', '10000000-0000-0000-0000-000000000078');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000086', '10000000-0000-0000-0000-000000000079');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000086', '10000000-0000-0000-0000-000000000075');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000086', '10000000-0000-0000-0000-000000000076');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000086', '10000000-0000-0000-0000-000000000080');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000086', '10000000-0000-0000-0000-000000000077');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000087', '00000000-0000-0000-0000-000000000001', 'Lauren Seymour #2', 'Lauren Seymour #2', -10);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000087', '10000000-0000-0000-0000-000000000016');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000087', '10000000-0000-0000-0000-000000000020');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000087', '10000000-0000-0000-0000-000000000015');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000087', '10000000-0000-0000-0000-000000000076');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000087', '10000000-0000-0000-0000-000000000047');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000087', '10000000-0000-0000-0000-000000000051');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000088', '00000000-0000-0000-0000-000000000001', 'Lauren Seymour #3', 'Lauren Seymour #3', -10);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000088', '10000000-0000-0000-0000-000000000078');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000088', '10000000-0000-0000-0000-000000000067');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000088', '10000000-0000-0000-0000-000000000032');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000088', '10000000-0000-0000-0000-000000000050');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000088', '10000000-0000-0000-0000-000000000056');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000088', '10000000-0000-0000-0000-000000000014');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000089', '00000000-0000-0000-0000-000000000001', 'Lauren Seymour #4', 'Lauren Seymour #4', -10);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000089', '10000000-0000-0000-0000-000000000090');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000089', '10000000-0000-0000-0000-000000000061');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000089', '10000000-0000-0000-0000-000000000035');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000089', '10000000-0000-0000-0000-000000000005');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000089', '10000000-0000-0000-0000-000000000089');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000089', '10000000-0000-0000-0000-000000000091');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000090', '00000000-0000-0000-0000-000000000001', 'Lauren Seymour #5', 'Lauren Seymour #5', -10);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000090', '10000000-0000-0000-0000-000000000021');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000090', '10000000-0000-0000-0000-000000000067');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000090', '10000000-0000-0000-0000-000000000086');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000090', '10000000-0000-0000-0000-000000000068');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000090', '10000000-0000-0000-0000-000000000069');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000090', '10000000-0000-0000-0000-000000000019');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000091', '00000000-0000-0000-0000-000000000001', 'Lauren Seymour #6', 'Lauren Seymour #6', -10);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000091', '10000000-0000-0000-0000-000000000013');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000091', '10000000-0000-0000-0000-000000000020');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000091', '10000000-0000-0000-0000-000000000032');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000091', '10000000-0000-0000-0000-000000000005');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000091', '10000000-0000-0000-0000-000000000006');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000091', '10000000-0000-0000-0000-000000000024');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000092', '00000000-0000-0000-0000-000000000001', 'Jeff Headean', 'Jeff Headean', -13);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000092', '10000000-0000-0000-0000-000000000078');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000092', '10000000-0000-0000-0000-000000000067');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000092', '10000000-0000-0000-0000-000000000037');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000092', '10000000-0000-0000-0000-000000000074');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000092', '10000000-0000-0000-0000-000000000089');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000092', '10000000-0000-0000-0000-000000000051');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000093', '00000000-0000-0000-0000-000000000001', 'Tyler Headean', 'Tyler Headean', -15);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000093', '10000000-0000-0000-0000-000000000078');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000093', '10000000-0000-0000-0000-000000000067');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000093', '10000000-0000-0000-0000-000000000055');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000093', '10000000-0000-0000-0000-000000000083');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000093', '10000000-0000-0000-0000-000000000031');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000093', '10000000-0000-0000-0000-000000000025');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000094', '00000000-0000-0000-0000-000000000001', 'Oliver Morton', 'Oliver Morton', -8);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000094', '10000000-0000-0000-0000-000000000090');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000094', '10000000-0000-0000-0000-000000000020');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000094', '10000000-0000-0000-0000-000000000035');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000094', '10000000-0000-0000-0000-000000000057');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000094', '10000000-0000-0000-0000-000000000059');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000094', '10000000-0000-0000-0000-000000000007');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000095', '00000000-0000-0000-0000-000000000001', 'Devin Glennon', 'Devin Glennon', -14);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000095', '10000000-0000-0000-0000-000000000053');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000095', '10000000-0000-0000-0000-000000000061');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000095', '10000000-0000-0000-0000-000000000037');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000095', '10000000-0000-0000-0000-000000000068');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000095', '10000000-0000-0000-0000-000000000056');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000095', '10000000-0000-0000-0000-000000000025');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000096', '00000000-0000-0000-0000-000000000001', 'Tom Hiller', 'Tom Hiller', -12);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000096', '10000000-0000-0000-0000-000000000053');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000096', '10000000-0000-0000-0000-000000000020');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000096', '10000000-0000-0000-0000-000000000064');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000096', '10000000-0000-0000-0000-000000000001');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000096', '10000000-0000-0000-0000-000000000006');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000096', '10000000-0000-0000-0000-000000000077');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000097', '00000000-0000-0000-0000-000000000001', 'Mary Ellen Hiller', 'Mary Ellen Hiller', -11);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000097', '10000000-0000-0000-0000-000000000078');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000097', '10000000-0000-0000-0000-000000000020');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000097', '10000000-0000-0000-0000-000000000035');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000097', '10000000-0000-0000-0000-000000000068');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000097', '10000000-0000-0000-0000-000000000089');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000097', '10000000-0000-0000-0000-000000000019');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000098', '00000000-0000-0000-0000-000000000001', 'Colin Rapson', 'Colin Rapson', -14);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000098', '10000000-0000-0000-0000-000000000049');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000098', '10000000-0000-0000-0000-000000000066');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000098', '10000000-0000-0000-0000-000000000086');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000098', '10000000-0000-0000-0000-000000000083');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000098', '10000000-0000-0000-0000-000000000059');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000098', '10000000-0000-0000-0000-000000000004');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000099', '00000000-0000-0000-0000-000000000001', 'Jack Griffin', 'Jack Griffin', -11);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000099', '10000000-0000-0000-0000-000000000078');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000099', '10000000-0000-0000-0000-000000000088');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000099', '10000000-0000-0000-0000-000000000081');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000099', '10000000-0000-0000-0000-000000000057');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000099', '10000000-0000-0000-0000-000000000026');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000099', '10000000-0000-0000-0000-000000000014');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000100', '00000000-0000-0000-0000-000000000001', 'Tyler Tuttle', 'Tyler Tuttle', -12);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000100', '10000000-0000-0000-0000-000000000041');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000100', '10000000-0000-0000-0000-000000000061');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000100', '10000000-0000-0000-0000-000000000032');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000100', '10000000-0000-0000-0000-000000000033');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000100', '10000000-0000-0000-0000-000000000069');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000100', '10000000-0000-0000-0000-000000000010');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000101', '00000000-0000-0000-0000-000000000001', 'Matt Couri', 'Matt Couri', -12);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000101', '10000000-0000-0000-0000-000000000013');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000101', '10000000-0000-0000-0000-000000000020');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000101', '10000000-0000-0000-0000-000000000037');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000101', '10000000-0000-0000-0000-000000000057');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000101', '10000000-0000-0000-0000-000000000089');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000101', '10000000-0000-0000-0000-000000000091');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000102', '00000000-0000-0000-0000-000000000001', 'Kyle Carstens', 'Kyle Carstens', -12);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000102', '10000000-0000-0000-0000-000000000013');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000102', '10000000-0000-0000-0000-000000000003');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000102', '10000000-0000-0000-0000-000000000037');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000102', '10000000-0000-0000-0000-000000000076');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000102', '10000000-0000-0000-0000-000000000056');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000102', '10000000-0000-0000-0000-000000000004');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000103', '00000000-0000-0000-0000-000000000001', 'Nate Gray', 'Nate Gray', -13);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000103', '10000000-0000-0000-0000-000000000078');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000103', '10000000-0000-0000-0000-000000000067');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000103', '10000000-0000-0000-0000-000000000015');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000103', '10000000-0000-0000-0000-000000000083');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000103', '10000000-0000-0000-0000-000000000059');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000103', '10000000-0000-0000-0000-000000000091');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000104', '00000000-0000-0000-0000-000000000001', 'Tyler Allison', 'Tyler Allison', -11);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000104', '10000000-0000-0000-0000-000000000049');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000104', '10000000-0000-0000-0000-000000000070');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000104', '10000000-0000-0000-0000-000000000022');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000104', '10000000-0000-0000-0000-000000000083');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000104', '10000000-0000-0000-0000-000000000089');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000104', '10000000-0000-0000-0000-000000000091');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000105', '00000000-0000-0000-0000-000000000001', 'Craig Allison', 'Craig Allison', -10);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000105', '10000000-0000-0000-0000-000000000078');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000105', '10000000-0000-0000-0000-000000000067');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000105', '10000000-0000-0000-0000-000000000081');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000105', '10000000-0000-0000-0000-000000000083');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000105', '10000000-0000-0000-0000-000000000059');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000105', '10000000-0000-0000-0000-000000000004');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000106', '00000000-0000-0000-0000-000000000001', 'Craig Allison #2', 'Craig Allison #2', -12);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000106', '10000000-0000-0000-0000-000000000016');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000106', '10000000-0000-0000-0000-000000000061');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000106', '10000000-0000-0000-0000-000000000022');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000106', '10000000-0000-0000-0000-000000000057');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000106', '10000000-0000-0000-0000-000000000089');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000106', '10000000-0000-0000-0000-000000000091');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000107', '00000000-0000-0000-0000-000000000001', 'Michael Conticello', 'Michael Conticello', -13);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000107', '10000000-0000-0000-0000-000000000013');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000107', '10000000-0000-0000-0000-000000000045');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000107', '10000000-0000-0000-0000-000000000035');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000107', '10000000-0000-0000-0000-000000000001');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000107', '10000000-0000-0000-0000-000000000026');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000107', '10000000-0000-0000-0000-000000000004');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000108', '00000000-0000-0000-0000-000000000001', 'Ben Hart', 'Ben Hart', -12);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000108', '10000000-0000-0000-0000-000000000049');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000108', '10000000-0000-0000-0000-000000000082');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000108', '10000000-0000-0000-0000-000000000022');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000108', '10000000-0000-0000-0000-000000000083');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000108', '10000000-0000-0000-0000-000000000059');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000108', '10000000-0000-0000-0000-000000000058');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000109', '00000000-0000-0000-0000-000000000001', 'Karli Mertins', 'Karli Mertins', -10);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000109', '10000000-0000-0000-0000-000000000049');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000109', '10000000-0000-0000-0000-000000000045');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000109', '10000000-0000-0000-0000-000000000081');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000109', '10000000-0000-0000-0000-000000000057');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000109', '10000000-0000-0000-0000-000000000065');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000109', '10000000-0000-0000-0000-000000000058');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000110', '00000000-0000-0000-0000-000000000001', 'TJ Stembridge', 'TJ Stembridge', -11);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000110', '10000000-0000-0000-0000-000000000078');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000110', '10000000-0000-0000-0000-000000000067');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000110', '10000000-0000-0000-0000-000000000035');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000110', '10000000-0000-0000-0000-000000000057');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000110', '10000000-0000-0000-0000-000000000056');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000110', '10000000-0000-0000-0000-000000000025');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000111', '00000000-0000-0000-0000-000000000001', 'Mike Adler', 'Mike Adler', -12);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000111', '10000000-0000-0000-0000-000000000078');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000111', '10000000-0000-0000-0000-000000000072');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000111', '10000000-0000-0000-0000-000000000075');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000111', '10000000-0000-0000-0000-000000000046');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000111', '10000000-0000-0000-0000-000000000059');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000111', '10000000-0000-0000-0000-000000000058');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000112', '00000000-0000-0000-0000-000000000001', 'Don Mrofcza', 'Don Mrofcza', -14);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000112', '10000000-0000-0000-0000-000000000016');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000112', '10000000-0000-0000-0000-000000000003');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000112', '10000000-0000-0000-0000-000000000035');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000112', '10000000-0000-0000-0000-000000000030');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000112', '10000000-0000-0000-0000-000000000059');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000112', '10000000-0000-0000-0000-000000000004');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000113', '00000000-0000-0000-0000-000000000001', 'Conticello Haliskoe #1', 'Conticello Haliskoe #1', -13);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000113', '10000000-0000-0000-0000-000000000049');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000113', '10000000-0000-0000-0000-000000000070');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000113', '10000000-0000-0000-0000-000000000035');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000113', '10000000-0000-0000-0000-000000000030');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000113', '10000000-0000-0000-0000-000000000065');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000113', '10000000-0000-0000-0000-000000000024');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000114', '00000000-0000-0000-0000-000000000001', 'Conticello Haliskoe #2', 'Conticello Haliskoe #2', -11);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000114', '10000000-0000-0000-0000-000000000085');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000114', '10000000-0000-0000-0000-000000000020');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000114', '10000000-0000-0000-0000-000000000035');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000114', '10000000-0000-0000-0000-000000000057');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000114', '10000000-0000-0000-0000-000000000089');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000114', '10000000-0000-0000-0000-000000000029');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000115', '00000000-0000-0000-0000-000000000001', 'Chris James Conticello #1', 'Chris James Conticello #1', -10);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000115', '10000000-0000-0000-0000-000000000049');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000115', '10000000-0000-0000-0000-000000000020');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000115', '10000000-0000-0000-0000-000000000081');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000115', '10000000-0000-0000-0000-000000000083');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000115', '10000000-0000-0000-0000-000000000089');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000115', '10000000-0000-0000-0000-000000000029');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000116', '00000000-0000-0000-0000-000000000001', 'Chris James Conticello #2', 'Chris James Conticello #2', -9);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000116', '10000000-0000-0000-0000-000000000012');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000116', '10000000-0000-0000-0000-000000000067');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000116', '10000000-0000-0000-0000-000000000048');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000116', '10000000-0000-0000-0000-000000000057');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000116', '10000000-0000-0000-0000-000000000056');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000116', '10000000-0000-0000-0000-000000000014');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000117', '00000000-0000-0000-0000-000000000001', 'Matt Hart', 'Matt Hart', -12);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000117', '10000000-0000-0000-0000-000000000049');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000117', '10000000-0000-0000-0000-000000000020');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000117', '10000000-0000-0000-0000-000000000022');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000117', '10000000-0000-0000-0000-000000000068');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000117', '10000000-0000-0000-0000-000000000059');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000117', '10000000-0000-0000-0000-000000000014');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000118', '00000000-0000-0000-0000-000000000001', 'Brooke Silverberg', 'Brooke Silverberg', -11);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000118', '10000000-0000-0000-0000-000000000041');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000118', '10000000-0000-0000-0000-000000000088');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000118', '10000000-0000-0000-0000-000000000064');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000118', '10000000-0000-0000-0000-000000000033');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000118', '10000000-0000-0000-0000-000000000089');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000118', '10000000-0000-0000-0000-000000000025');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000119', '00000000-0000-0000-0000-000000000001', 'Wayne Westwood', 'Wayne Westwood', -13);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000119', '10000000-0000-0000-0000-000000000041');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000119', '10000000-0000-0000-0000-000000000003');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000119', '10000000-0000-0000-0000-000000000075');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000119', '10000000-0000-0000-0000-000000000030');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000119', '10000000-0000-0000-0000-000000000089');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000119', '10000000-0000-0000-0000-000000000091');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000120', '00000000-0000-0000-0000-000000000001', 'Nick DeAngelis', 'Nick DeAngelis', -10);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000120', '10000000-0000-0000-0000-000000000016');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000120', '10000000-0000-0000-0000-000000000003');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000120', '10000000-0000-0000-0000-000000000037');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000120', '10000000-0000-0000-0000-000000000001');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000120', '10000000-0000-0000-0000-000000000059');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000120', '10000000-0000-0000-0000-000000000004');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000121', '00000000-0000-0000-0000-000000000001', 'Nick Buonanno', 'Nick Buonanno', -10);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000121', '10000000-0000-0000-0000-000000000041');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000121', '10000000-0000-0000-0000-000000000020');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000121', '10000000-0000-0000-0000-000000000015');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000121', '10000000-0000-0000-0000-000000000083');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000121', '10000000-0000-0000-0000-000000000026');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000121', '10000000-0000-0000-0000-000000000014');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000122', '00000000-0000-0000-0000-000000000001', 'Jeremy Conner', 'Jeremy Conner', -9);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000122', '10000000-0000-0000-0000-000000000090');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000122', '10000000-0000-0000-0000-000000000067');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000122', '10000000-0000-0000-0000-000000000022');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000122', '10000000-0000-0000-0000-000000000073');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000122', '10000000-0000-0000-0000-000000000059');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000122', '10000000-0000-0000-0000-000000000077');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000123', '00000000-0000-0000-0000-000000000001', 'Todd Andre', 'Todd Andre', -10);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000123', '10000000-0000-0000-0000-000000000090');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000123', '10000000-0000-0000-0000-000000000070');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000123', '10000000-0000-0000-0000-000000000022');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000123', '10000000-0000-0000-0000-000000000083');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000123', '10000000-0000-0000-0000-000000000056');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000123', '10000000-0000-0000-0000-000000000014');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000124', '00000000-0000-0000-0000-000000000001', 'Rob Lewis', 'Rob Lewis', -14);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000124', '10000000-0000-0000-0000-000000000071');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000124', '10000000-0000-0000-0000-000000000088');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000124', '10000000-0000-0000-0000-000000000035');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000124', '10000000-0000-0000-0000-000000000050');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000124', '10000000-0000-0000-0000-000000000089');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000124', '10000000-0000-0000-0000-000000000058');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000125', '00000000-0000-0000-0000-000000000001', 'Charlie Ruff', 'Charlie Ruff', -10);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000125', '10000000-0000-0000-0000-000000000041');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000125', '10000000-0000-0000-0000-000000000067');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000125', '10000000-0000-0000-0000-000000000022');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000125', '10000000-0000-0000-0000-000000000063');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000125', '10000000-0000-0000-0000-000000000080');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000125', '10000000-0000-0000-0000-000000000014');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000126', '00000000-0000-0000-0000-000000000001', 'Pat Garrity', 'Pat Garrity', -11);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000126', '10000000-0000-0000-0000-000000000013');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000126', '10000000-0000-0000-0000-000000000070');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000126', '10000000-0000-0000-0000-000000000037');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000126', '10000000-0000-0000-0000-000000000030');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000126', '10000000-0000-0000-0000-000000000026');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000126', '10000000-0000-0000-0000-000000000014');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000127', '00000000-0000-0000-0000-000000000001', 'Alan Arocho', 'Alan Arocho', -9);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000127', '10000000-0000-0000-0000-000000000078');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000127', '10000000-0000-0000-0000-000000000079');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000127', '10000000-0000-0000-0000-000000000032');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000127', '10000000-0000-0000-0000-000000000001');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000127', '10000000-0000-0000-0000-000000000040');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000127', '10000000-0000-0000-0000-000000000058');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000128', '00000000-0000-0000-0000-000000000001', 'Will Headean', 'Will Headean', -13);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000128', '10000000-0000-0000-0000-000000000041');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000128', '10000000-0000-0000-0000-000000000067');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000128', '10000000-0000-0000-0000-000000000064');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000128', '10000000-0000-0000-0000-000000000050');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000128', '10000000-0000-0000-0000-000000000018');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000128', '10000000-0000-0000-0000-000000000004');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000129', '00000000-0000-0000-0000-000000000001', 'Will Hanek', 'Will Hanek', -13);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000129', '10000000-0000-0000-0000-000000000034');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000129', '10000000-0000-0000-0000-000000000002');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000129', '10000000-0000-0000-0000-000000000064');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000129', '10000000-0000-0000-0000-000000000046');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000129', '10000000-0000-0000-0000-000000000089');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000129', '10000000-0000-0000-0000-000000000091');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000130', '00000000-0000-0000-0000-000000000001', 'Jeremy Kellehan', 'Jeremy Kellehan', -13);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000130', '10000000-0000-0000-0000-000000000021');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000130', '10000000-0000-0000-0000-000000000003');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000130', '10000000-0000-0000-0000-000000000015');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000130', '10000000-0000-0000-0000-000000000057');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000130', '10000000-0000-0000-0000-000000000026');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000130', '10000000-0000-0000-0000-000000000004');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000131', '00000000-0000-0000-0000-000000000001', 'Derek F J Conticello', 'Derek F J Conticello', -11);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000131', '10000000-0000-0000-0000-000000000042');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000131', '10000000-0000-0000-0000-000000000067');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000131', '10000000-0000-0000-0000-000000000022');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000131', '10000000-0000-0000-0000-000000000011');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000131', '10000000-0000-0000-0000-000000000026');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000131', '10000000-0000-0000-0000-000000000025');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000132', '00000000-0000-0000-0000-000000000001', 'Aaron Murray', 'Aaron Murray', -14);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000132', '10000000-0000-0000-0000-000000000049');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000132', '10000000-0000-0000-0000-000000000067');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000132', '10000000-0000-0000-0000-000000000086');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000132', '10000000-0000-0000-0000-000000000057');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000132', '10000000-0000-0000-0000-000000000026');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000132', '10000000-0000-0000-0000-000000000091');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000133', '00000000-0000-0000-0000-000000000001', 'Jack Deegan', 'Jack Deegan', -14);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000133', '10000000-0000-0000-0000-000000000016');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000133', '10000000-0000-0000-0000-000000000003');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000133', '10000000-0000-0000-0000-000000000015');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000133', '10000000-0000-0000-0000-000000000083');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000133', '10000000-0000-0000-0000-000000000059');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000133', '10000000-0000-0000-0000-000000000024');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000134', '00000000-0000-0000-0000-000000000001', 'Chris Trimbach', 'Chris Trimbach', -13);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000134', '10000000-0000-0000-0000-000000000016');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000134', '10000000-0000-0000-0000-000000000020');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000134', '10000000-0000-0000-0000-000000000055');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000134', '10000000-0000-0000-0000-000000000005');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000134', '10000000-0000-0000-0000-000000000089');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000134', '10000000-0000-0000-0000-000000000051');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000135', '00000000-0000-0000-0000-000000000001', 'J Conticello Derek F', 'J Conticello Derek F', -13);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000135', '10000000-0000-0000-0000-000000000044');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000135', '10000000-0000-0000-0000-000000000020');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000135', '10000000-0000-0000-0000-000000000035');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000135', '10000000-0000-0000-0000-000000000030');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000135', '10000000-0000-0000-0000-000000000026');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000135', '10000000-0000-0000-0000-000000000051');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000136', '00000000-0000-0000-0000-000000000001', 'Chris Burns', 'Chris Burns', -14);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000136', '10000000-0000-0000-0000-000000000078');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000136', '10000000-0000-0000-0000-000000000088');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000136', '10000000-0000-0000-0000-000000000022');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000136', '10000000-0000-0000-0000-000000000030');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000136', '10000000-0000-0000-0000-000000000089');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000136', '10000000-0000-0000-0000-000000000077');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000137', '00000000-0000-0000-0000-000000000001', 'Sara Hill', 'Sara Hill', -12);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000137', '10000000-0000-0000-0000-000000000085');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000137', '10000000-0000-0000-0000-000000000088');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000137', '10000000-0000-0000-0000-000000000022');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000137', '10000000-0000-0000-0000-000000000083');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000137', '10000000-0000-0000-0000-000000000089');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000137', '10000000-0000-0000-0000-000000000025');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000138', '00000000-0000-0000-0000-000000000001', 'Caitlin Adler', 'Caitlin Adler', -12);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000138', '10000000-0000-0000-0000-000000000013');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000138', '10000000-0000-0000-0000-000000000045');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000138', '10000000-0000-0000-0000-000000000008');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000138', '10000000-0000-0000-0000-000000000046');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000138', '10000000-0000-0000-0000-000000000026');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000138', '10000000-0000-0000-0000-000000000027');

INSERT INTO teams (id, tournament_id, team_name, submitted_by, tiebreaker)
VALUES ('20000000-0000-0000-0000-000000000139', '00000000-0000-0000-0000-000000000001', 'Mike Head', 'Mike Head', -12);
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000139', '10000000-0000-0000-0000-000000000078');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000139', '10000000-0000-0000-0000-000000000079');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000139', '10000000-0000-0000-0000-000000000008');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000139', '10000000-0000-0000-0000-000000000057');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000139', '10000000-0000-0000-0000-000000000018');
INSERT INTO team_players (team_id, player_id) VALUES ('20000000-0000-0000-0000-000000000139', '10000000-0000-0000-0000-000000000058');

COMMIT;
