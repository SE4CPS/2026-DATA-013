-- VIDEO 1: Schema First – Creating the Namespace
-- Goal: establish that schemas come before tables

DROP TABLE IF EXISTS public.flower;
DROP SCHEMA IF EXISTS flower_schema;

CREATE SCHEMA flower_schema;

SET search_path TO flower_schema, public;

SELECT current_schema() AS current_schema;

SELECT schema_name
FROM information_schema.schemata
ORDER BY schema_name;

-- VIDEO 2: Table Structure – Creating the Flower Table
-- Goal: define structure before data

CREATE TABLE flower (
  id    INTEGER,
  name  TEXT,
  color TEXT
);

SELECT table_schema, table_name
FROM information_schema.tables
WHERE table_schema = 'flower_schema' AND table_name = 'flower';

SELECT column_name, data_type, is_nullable
FROM information_schema.columns
WHERE table_schema = 'flower_schema' AND table_name = 'flower'
ORDER BY ordinal_position;

-- VIDEO 3: Adding Data – Inserting Rows into Flower
-- Goal: populate the table with data

INSERT INTO flower (id, name, color) VALUES (1, 'Rose', 'Red');
INSERT INTO flower (id, name, color) VALUES (2, 'Tulip', 'Yellow');
INSERT INTO flower (id, name, color) VALUES (3, 'Lily', 'White');

SELECT * FROM flower ORDER BY id;

-- VIDEO 4: Reading Data – SELECT Queries on Flower
-- Goal: demonstrate how SQL reads data

SELECT * FROM flower;

SELECT name, color FROM flower ORDER BY name;

SELECT * FROM flower WHERE color = 'Red';

SELECT * FROM flower ORDER BY color, name;

SELECT color, COUNT(*) AS count_by_color
FROM flower
GROUP BY color
ORDER BY count_by_color DESC;

-- VIDEO 5: Cleanup – Dropping Table and Schema Safely
-- Goal: reinforce order and risk awareness

SELECT COUNT(*) AS rows_before_drop FROM flower;

DROP TABLE flower;

SELECT table_schema, table_name
FROM information_schema.tables
WHERE table_schema = 'flower_schema';

DROP SCHEMA flower_schema;

SELECT schema_name
FROM information_schema.schemata
WHERE schema_name = 'flower_schema';
