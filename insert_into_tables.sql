INSERT INTO ranks (rank_id, rank_name, rank_level)
VALUES (1, 'Private', 1),
       (2, 'Corporal', 2),
       (3, 'Sergeant', 3),
       (4, 'Lieutenant', 4),
       (5, 'Captain', 5),
       (6, 'Major', 6);


INSERT INTO units (unit_id, unit_name, locations) VALUES
(1, 'Alpha Company', 'North Camp'),
(2, 'Bravo Company', 'South Camp'),
(3, 'Charlie Company', 'East Camp'),
(4, 'Delta Company', 'West Camp'),
(5, 'Signals Unit', 'Central Camp'),
(6, 'Medical Unit', 'Central Camp');


INSERT INTO missions (mission_id, mission_name, start_date, end_date) VALUES
(1, 'Exercise Falcon', '2025-02-03', '2025-02-28'),
(2, 'Flood Relief', '2025-04-14', '2025-05-30'),
(3, 'Border Patrol', '2025-07-01', NULL),
(4, 'Peace Support', '2025-09-15', NULL),
(5, 'Field Medical Camp', '2026-01-12', '2026-01-23');
INSERT INTO soldiers
(soldier_id, service_no, first_name, last_name,
 date_of_birth, enlistment_date, status, rank_id, unit_id)
VALUES
(1, 'ST-001', 'Jean', 'Mugisha', '1995-02-10', '2020-01-15', 'Active', 1, 1),
(2, 'ST-002', 'Eric', 'Niyonzima', '1992-05-12', '2018-03-20', 'Active', 2, 2),
(3, 'ST-003', 'David', 'Uwimana', '1990-08-15', '2016-06-10', 'Active', 3, 3),
(4, 'ST-004', 'Patrick', 'Habimana', '1994-04-18', '2019-02-11', 'Active', 4, 4),
(5, 'ST-005', 'Samuel', 'Nsengiyumva', '1988-09-22', '2012-05-14', 'Active', 5, 5),
(6, 'ST-006', 'Emmanuel', 'Iradukunda', '1996-11-03', '2021-01-10', 'Active', 1, 6),
(7, 'ST-007', 'Daniel', 'Bizimana', '1993-07-19', '2017-04-12', 'On Leave', 2, 1),
(8, 'ST-008', 'Alex', 'Nkurunziza', '1991-12-25', '2015-08-20', 'Active', 3, 2),
(9, 'ST-009', 'Peter', 'Manzi', '1995-03-08', '2020-09-15', 'Active', 4, 3),
(10, 'ST-010', 'Joseph', 'Rukundo', '1989-06-14', '2013-07-01', 'Active', 5, 4),
(11, 'ST-011', 'Claude', 'Hakizimana', '1997-01-17', '2022-02-01', 'Active', 1, 5),
(12, 'ST-012', 'Fabrice', 'Munyaneza', '1992-10-09', '2018-11-12', 'Active', 2, 6),
(13, 'ST-013', 'Kevin', 'Rugamba', '1990-02-21', '2014-03-18', 'Retired', 3, 1),
(14, 'ST-014', 'Michael', 'Twagirayezu', '1994-05-30', '2019-06-25', 'Active', 4, 2),
(15, 'ST-015', 'Brian', 'Nshimiyimana', '1991-08-11', '2015-10-05', 'Active', 5, 3),
(16, 'ST-016', 'Oscar', 'Mbarushimana', '1996-04-07', '2021-07-19', 'Active', 1, 4),
(17, 'ST-017', 'Frank', 'Rukeratabaro', '1993-09-13', '2017-12-01', 'Active', 2, 5),
(18, 'ST-018', 'Albert', 'Gatera', '1987-11-28', '2011-02-14', 'Active', 3, 6),
(19, 'ST-019', 'Vincent', 'Murenzi', '1995-01-05', '2020-04-20', 'On Leave', 4, 1),
(20, 'ST-020', 'Diane', 'Mukamana', '1998-06-16', '2023-01-09', 'Active', 1, 2),
(21, 'ST-021', 'Alice', 'Uwase', '1994-12-02', '2019-09-10', 'Active', 2, 3),
(22, 'ST-022', 'Sarah', 'Ineza', '1997-03-24', '2022-05-16', 'Active', 3, 4),
(23, 'ST-023', 'Grace', 'Uwamahoro', '1991-07-07', '2015-11-23', 'Active', 4, 5),
(24, 'ST-024', 'Olivia', 'Nyirahabimana', '1993-10-19', '2017-08-14', 'Active', 5, 6),
(25, 'ST-025', 'Esther', 'Mukeshimana', '1996-02-27', '2021-03-08', 'Active', 1, 1),
(26, 'ST-026', 'Chantal', 'Umutoni', '1992-04-13', '2018-07-17', 'Active', 2, 2),
(27, 'ST-027', 'Beatrice', 'Nyiransabimana', '1990-09-06', '2014-12-03', 'Active', 3, 3),
(28, 'ST-028', 'Patrick', 'Ndayisenga', '1988-01-29', '2012-04-16', 'Retired', 4, 4),
(29, 'ST-029', 'Alexis', 'Nsabimana', '1995-05-21', '2020-08-11', 'Active', 5, 5),
(30, 'ST-030', 'Theogene', 'Ruzindana', '1993-12-15', '2017-06-22', 'Active', 6, 6),

(31, 'ST-202520363', 'Giscard', 'Bahati', '2003-05-12', '2025-01-15', 'Active', 1, 1),
(32, 'ST-202520534-2', 'Nathan', 'Poma', '2002-08-20', '2025-02-10', 'Active', 3, 2),
(33, 'ST-202520770-3', 'Sylvain', 'Madula', '2004-03-18', '2025-03-05', 'Active', 2, 5);


INSERT INTO soldier_mission (soldier_id, mission_id, mission_role)
VALUES
(1, 1, 'Team Leader'),
(2, 1, 'Security Officer'),
(3, 2, 'Medical Support'),
(4, 2, 'Field Commander'),
(5, 3, 'Patrol Leader'),
(6, 3, 'Communications Officer'),
(7, 4, 'Security Personnel'),
(8, 4, 'Team Leader'),
(9, 5, 'Medical Officer'),
(10, 5, 'Support Personnel'),
(11, 1, 'Security Personnel'),
(12, 2, 'Logistics Officer'),
(13, 3, 'Patrol Personnel'),
(14, 4, 'Communications Officer'),
(15, 5, 'Medical Support'),
(16, 1, 'Team Member'),
(17, 2, 'Team Member'),
(18, 3, 'Team Member'),
(19, 4, 'Team Member'),
(20, 5, 'Team Member'),
(21, 1, 'Security Personnel'),
(22, 2, 'Medical Support'),
(23, 3, 'Patrol Personnel'),
(24, 4, 'Logistics Officer'),
(25, 5, 'Medical Officer'),
(26, 1, 'Team Member'),
(27, 2, 'Team Member'),
(28, 3, 'Team Member'),
(29, 4, 'Team Member'),
(30, 5, 'Team Member'),
(31, 1, 'Team Leader'),
(32, 1, 'Communications Officer');
