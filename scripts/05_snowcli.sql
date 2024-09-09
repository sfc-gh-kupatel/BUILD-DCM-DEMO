/*-----------------------------------------------------------------------------
Script:       05_snowcli.sql
-----------------------------------------------------------------------------*/

USE ROLE DEMO_ROLE;
USE WAREHOUSE DEMO_WH;
USE SCHEMA DEMO_DB.DEMO_SCHEMA;


-- ----------------------------------------------------------------------------
-- Step #1: Run first SQL statement from SnowCLI
-- ----------------------------------------------------------------------------

-- Configure ~/.snowflake/config.toml
-- Set password in the SNOWFLAKE_CONNECTIONS_DEMO_PASSWORD environment variable
    -- export SNOWFLAKE_CONNECTIONS_DEMO_PASSWORD=""

-- Run a simple Hello World example
    -- snow sql -q "SELECT 'Hello World!'"


-- ----------------------------------------------------------------------------
-- Step #2: Run our DCM process from SnowCLI
-- ----------------------------------------------------------------------------

-- Review the deploy_objects.sql script

DESCRIBE TABLE MY_INVENTORY;

-- snow sql -q "ALTER GIT REPOSITORY DEMO_REPO FETCH"
-- snow sql -q "EXECUTE IMMEDIATE FROM @DEMO_REPO/branches/main/snowflake_objects/deploy_objects.sql"

DESCRIBE TABLE MY_INVENTORY;



-- Some things to note:
-- This is different than SnowSQL, but the two will be aligned
