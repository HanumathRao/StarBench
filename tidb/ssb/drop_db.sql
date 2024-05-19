-- Disable foreign key checks temporarily
SET foreign_key_checks = 0;

-- Drop all tables within the schema
SELECT CONCAT('DROP TABLE IF EXISTS `', table_name, '`;')
FROM information_schema.tables
WHERE table_schema = 'ssb';

-- Drop the views within the schema
SELECT CONCAT('DROP VIEW IF EXISTS `', table_name, '`;')
FROM information_schema.views
WHERE table_schema = 'ssb';

-- Drop the procedures within the schema
SELECT CONCAT('DROP PROCEDURE IF EXISTS `', routine_name, '`;')
FROM information_schema.routines
WHERE routine_schema = 'ssb' AND routine_type = 'PROCEDURE';

-- Drop the functions within the schema
SELECT CONCAT('DROP FUNCTION IF EXISTS `', routine_name, '`;')
FROM information_schema.routines
WHERE routine_schema = 'ssb' AND routine_type = 'FUNCTION';

-- Drop the triggers within the schema
SELECT CONCAT('DROP TRIGGER IF EXISTS `', trigger_name, '`;')
FROM information_schema.triggers
WHERE trigger_schema = 'ssb';

-- Drop the events within the schema
SELECT CONCAT('DROP EVENT IF EXISTS `', event_name, '`;')
FROM information_schema.events
WHERE event_schema = 'ssb';

-- Drop the schema itself
DROP SCHEMA IF EXISTS ssb;

-- Re-enable foreign key checks
SET foreign_key_checks = 1;
