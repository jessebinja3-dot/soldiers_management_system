SELECT setval(
    pg_get_serial_sequence('soldiers', 'soldier_id'),
    (SELECT MAX(soldier_id) FROM soldiers)
);

SELECT COUNT(*) AS total_soldiers
FROM soldiers;

SELECT COUNT(*) AS total_assignments
FROM soldier_mission;

SELECT *
FROM soldiers
ORDER BY soldier_id;

SELECT *
FROM soldier_mission
ORDER BY soldier_id;

-- Synchronize the automatic soldier ID sequence.
-- This prevents PostgreSQL from generating an ID that already exists.

SELECT setval(
    pg_get_serial_sequence('soldiers', 'soldier_id'),
    (SELECT MAX(soldier_id) FROM soldiers)
);

-- Display the last 10 soldiers added to the database.
-- The newest soldier appears first.
-- Expected rows: 10.

SELECT *
FROM soldiers
ORDER BY soldier_id DESC
LIMIT 10;

-- Display the last 10 soldiers in ascending ID order.
-- A subquery first selects the newest 10 soldiers.
-- Expected rows: 10.

SELECT *
FROM (
    SELECT *
    FROM soldiers
    ORDER BY soldier_id DESC
    LIMIT 10
) AS last_soldiers
ORDER BY soldier_id ASC;

-- Display soldiers whose IDs are 10, 15 or 20.
-- IN allows us to search for several specific values.
-- Expected rows: 3, if all three IDs exist.

SELECT *
FROM soldiers
WHERE soldier_id IN (10, 15, 20);

-- Display soldiers whose IDs are 13, 18 or 23.
-- These values are calculated using P = 3.
-- IN checks multiple possible soldier IDs.
-- Expected rows: 3, if all three IDs exist.

SELECT *
FROM soldiers
WHERE soldier_id IN (10 + 3, 15 + 3, 20 + 3);


-- Display active soldiers whose IDs are between 10 and 20.
-- BETWEEN includes both 10 and 20.
-- Expected rows: Depends on the soldiers' status.

SELECT *
FROM soldiers
WHERE status = 'Active'
AND soldier_id BETWEEN 10 AND 20;


-- Display soldier IDs, full names and their rank names.
-- Soldiers with higher rank levels appear first.
-- Last name is used for the second sorting condition.
-- Expected rows: Number of soldiers in the database.

SELECT
    s.soldier_id,
    s.first_name,
    s.last_name,
    r.rank_name,
    r.rank_level
FROM soldiers s
JOIN ranks r
ON s.rank_id = r.rank_id
ORDER BY r.rank_level DESC, s.last_name ASC;



-- Display active soldiers belonging to unit 1.
-- Show their names, ranks, unit names and locations.
-- Expected rows: Depends on the number of active soldiers in unit 1.

SELECT
    s.first_name,
    s.last_name,
    r.rank_name,
    u.unit_name,
    u.locations
FROM soldiers s
JOIN ranks r
ON s.rank_id = r.rank_id
JOIN units u
ON s.unit_id = u.unit_id
WHERE s.status = 'Active'
AND s.unit_id = 1;


-- Display all soldiers assigned to mission 1.
-- Show the mission name, soldier name, role and unit name.
-- Expected rows: Depends on the number of assignments to mission 1.

SELECT
    m.mission_name,
    s.first_name,
    s.last_name,
    sm.mission_role,
    u.unit_name
FROM soldier_mission sm
JOIN soldiers s
ON sm.soldier_id = s.soldier_id
JOIN missions m
ON sm.mission_id = m.mission_id
JOIN units u
ON s.unit_id = u.unit_id
WHERE m.mission_id = 1;

-- Display soldiers who have never participated in any mission.
-- NOT EXISTS checks that no mission assignment exists for a soldier.
-- Expected rows: Depends on the existing mission assignments.
-- Soldier 33 should appear here.

SELECT
    s.soldier_id,
    s.first_name,
    s.last_name,
    s.service_no
FROM soldiers s
WHERE NOT EXISTS (
    SELECT 1
    FROM soldier_mission sm
    WHERE sm.soldier_id = s.soldier_id
);

-- Count the number of soldiers in each military unit.
-- LEFT JOIN also displays units with zero soldiers.
-- GROUP BY groups soldiers according to their units.
-- Largest unit appears first.
-- Expected rows: 6.

SELECT
    u.unit_name,
    COUNT(s.soldier_id) AS number_of_soldiers
FROM units u
LEFT JOIN soldiers s
ON u.unit_id = s.unit_id
GROUP BY u.unit_id, u.unit_name
ORDER BY number_of_soldiers DESC;



-- Examine how PostgreSQL searches for soldiers
-- whose last name is Mugisha before creating an index.

EXPLAIN
SELECT *
FROM soldiers
WHERE last_name = 'Mugisha';


-- Create an index on the last_name column.
-- This index can help PostgreSQL search soldiers by last name.

CREATE INDEX idx_soldiers_last_name
ON soldiers(last_name);


-- Create a view called v_soldier_profile.
-- The view combines information from soldiers, ranks and units.
-- Full name is created by combining first name and last name.

CREATE VIEW v_soldier_profile AS
SELECT
    s.soldier_id,
    CONCAT(s.first_name, ' ', s.last_name) AS full_name,
    r.rank_name,
    u.unit_name,
    u.unit_location AS location,
    s.status
FROM soldiers s
JOIN ranks r
ON s.rank_id = r.rank_id
JOIN units u
ON s.unit_id = u.unit_id;


-- Display all information stored in the soldier profile view.

SELECT *
FROM v_soldier_profile;


-- Display all soldiers belonging to unit 1 using the view.
-- Results are ordered alphabetically by full name.

SELECT *
FROM v_soldier_profile
WHERE unit_name = 'Alpha Company'
ORDER BY full_name ASC;
