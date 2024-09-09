/*-----------------------------------------------------------------------------
BUILD 2023:   Database Change Management
Script:       03_create_or_alter.sql
Author:       Jeremiah Hansen
Last Updated: 11/6/2023
-----------------------------------------------------------------------------*/

USE ROLE DEMO_ROLE;
USE WAREHOUSE DEMO_WH;
USE SCHEMA DEMO_DB.DEMO_SCHEMA;


-- ----------------------------------------------------------------------------
-- Step #1: Try out the CREATE OR ALTER TABLE command
-- ----------------------------------------------------------------------------
SHOW TABLES;

-- Create the table with one column
CREATE OR ALTER TABLE FOO
(
    COLUMN1 VARCHAR
);

DESCRIBE TABLE FOO;

-- Now add a second column
CREATE OR ALTER TABLE FOO
(
    COLUMN1 VARCHAR
    ,COLUMN2 VARCHAR
);

DESCRIBE TABLE FOO;

DROP TABLE FOO;

-- Some things to note:
-- All limitations of the existing ALTER TABLE command apply
