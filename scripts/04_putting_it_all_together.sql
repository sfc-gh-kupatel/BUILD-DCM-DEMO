/*-----------------------------------------------------------------------------
BUILD 2023:   Database Change Management
Script:       04_putting_it_all_together.sql
Author:       Jeremiah Hansen
Last Updated: 11/6/2023
-----------------------------------------------------------------------------*/

USE ROLE DEMO_ROLE;
USE WAREHOUSE DEMO_WH;
USE SCHEMA DEMO_DB.DEMO_SCHEMA;


-- ----------------------------------------------------------------------------
-- Step #1: Review the "snowflake_objects" folder
-- ----------------------------------------------------------------------------

-- Browse folder structure


-- ----------------------------------------------------------------------------
-- Step #2: Run CREATE OR ALTER with EXECUTE IMMEDIATE FROM <file>
-- ----------------------------------------------------------------------------
LIST @DEMO_REPO/branches/main/snowflake_objects;

DESCRIBE TABLE MY_INVENTORY;

-- This should make no changes to the table since the definition is the same as before
EXECUTE IMMEDIATE FROM @DEMO_REPO/branches/main/snowflake_objects/databases/demo_db/schemas/demo_schema/tables/my_inventory.sql;

DESCRIBE TABLE MY_INVENTORY;


-- ----------------------------------------------------------------------------
-- Step #3: Make a change to the MY_INVENTORY table in code
-- ----------------------------------------------------------------------------

-- Now make a change to the table definition and commit it to your repo

-- Fetch new changes from the repo
ALTER GIT REPOSITORY DEMO_REPO FETCH;

-- Apply the new changes declaratively
EXECUTE IMMEDIATE FROM @DEMO_REPO/branches/main/snowflake_objects/databases/demo_db/schemas/demo_schema/tables/my_inventory.sql;

DESCRIBE TABLE MY_INVENTORY;
SELECT * FROM MY_INVENTORY;
