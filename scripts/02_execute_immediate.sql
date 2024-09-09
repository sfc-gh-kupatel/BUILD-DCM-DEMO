/*-----------------------------------------------------------------------------
BUILD 2023:   Database Change Management
Script:       02_execute_immediate.sql
Author:       Jeremiah Hansen
Last Updated: 11/6/2023
-----------------------------------------------------------------------------*/

USE ROLE DEMO_ROLE;
USE WAREHOUSE DEMO_WH;
USE SCHEMA DEMO_DB.DEMO_SCHEMA;


-- ----------------------------------------------------------------------------
-- Step #1: Execute scripts in a Git stage
-- ----------------------------------------------------------------------------
LIST @DEMO_REPO/branches/main;
LIST @DEMO_REPO/branches/main/scripts/02_execute_immediate;

SHOW TABLES;

EXECUTE IMMEDIATE FROM @DEMO_REPO/branches/main/scripts/02_execute_immediate/create-inventory.sql;
