/*-----------------------------------------------------------------------------
BUILD 2023:   Database Change Management
Script:       00_setup_snowflake.sql
Author:       Jeremiah Hansen
Last Updated: 11/6/2023
-----------------------------------------------------------------------------*/

USE ROLE ACCOUNTADMIN;


-- ----------------------------------------------------------------------------
-- Step #1: Create the account level objects
-- ----------------------------------------------------------------------------

--SET MY_USER = CURRENT_USER();
SET MY_USER = 'DEMO_USER';

-- Roles
CREATE OR REPLACE ROLE DEMO_ROLE;
GRANT ROLE DEMO_ROLE TO ROLE SYSADMIN;
GRANT ROLE DEMO_ROLE TO USER IDENTIFIER($MY_USER);

-- Databases
CREATE OR REPLACE DATABASE DEMO_DB;
GRANT OWNERSHIP ON DATABASE DEMO_DB TO ROLE DEMO_ROLE;

-- Warehouses
CREATE OR REPLACE WAREHOUSE DEMO_WH WAREHOUSE_SIZE = XSMALL, AUTO_SUSPEND = 300, AUTO_RESUME= TRUE;
GRANT OWNERSHIP ON WAREHOUSE DEMO_WH TO ROLE DEMO_ROLE;


-- ----------------------------------------------------------------------------
-- Step #2: Create the database level objects
-- ----------------------------------------------------------------------------
USE ROLE DEMO_ROLE;
USE WAREHOUSE DEMO_WH;
USE DATABASE DEMO_DB;

-- Schemas
CREATE OR REPLACE SCHEMA DEMO_SCHEMA;
