/*-----------------------------------------------------------------------------
Script:       06_deploy_via_cicd.sql
-----------------------------------------------------------------------------*/

USE ROLE DEMO_ROLE;
USE WAREHOUSE DEMO_WH;
USE SCHEMA DEMO_DB.DEMO_SCHEMA;


-- ----------------------------------------------------------------------------
-- Step #1: Review the GitHub Actions pipeline
-- ----------------------------------------------------------------------------

-- Review the build_and_deploy.yaml pipeline definition


-- ----------------------------------------------------------------------------
-- Step #2: Deploy a change through the GitHub Actions pipeline
-- ----------------------------------------------------------------------------

DESCRIBE TABLE MY_INVENTORY;

-- Make a change to the my_inventory.sql file

-- Push the change to the main branch in GitHub

-- Review the GitHub Actions logs

DESCRIBE TABLE MY_INVENTORY;
