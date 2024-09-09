/*-----------------------------------------------------------------------------
BUILD 2023:   Database Change Management
-----------------------------------------------------------------------------*/

-- For now steps 1-3 should be run as ACCOUNTADMIN
USE ROLE ACCOUNTADMIN;
USE WAREHOUSE DEMO_WH;
USE SCHEMA DEMO_DB.DEMO_SCHEMA;
SELECT current_account();

-- ----------------------------------------------------------------------------
-- Step #1: Create a Secret to store the GitHub PAT
-- ----------------------------------------------------------------------------
CREATE OR REPLACE SECRET KUPATEL_GITHUB_SECRET
  TYPE = PASSWORD
  USERNAME = 'sfc-gh-kupatel'
  PASSWORD = 'token';

SHOW SECRETS;
DESCRIBE SECRET KUPATEL_GITHUB_SECRET;


-- ----------------------------------------------------------------------------
-- Step #2: Create an Git API Integration
-- ----------------------------------------------------------------------------
CREATE OR REPLACE API INTEGRATION KUPATEL_GITHUB_API_INTEGRATION
  API_PROVIDER = GIT_HTTPS_API
  API_ALLOWED_PREFIXES = ('https://github.com/sfc-gh-kupatel')
  ALLOWED_AUTHENTICATION_SECRETS = (KUPATEL_GITHUB_SECRET)
  ENABLED = TRUE;

SHOW INTEGRATIONS;
SHOW API INTEGRATIONS;
DESCRIBE API INTEGRATION KUPATEL_GITHUB_API_INTEGRATION;


-- ----------------------------------------------------------------------------
-- Step #3: Create a Git Repository
-- ----------------------------------------------------------------------------
CREATE OR REPLACE GIT REPOSITORY DEMO_REPO
  API_INTEGRATION = KUPATEL_GITHUB_API_INTEGRATION
  GIT_CREDENTIALS = KUPATEL_GITHUB_SECRET
  ORIGIN = 'https://github.com/sfc-gh-kupatel/BUILD-DCM-DEMO';

SHOW GIT REPOSITORIES;
DESCRIBE GIT REPOSITORY DEMO_REPO;

GRANT READ ON GIT REPOSITORY DEMO_REPO TO ROLE DEMO_ROLE;
USE ROLE DEMO_ROLE;


-- ----------------------------------------------------------------------------
-- Step #4: Working with a Git Repository
-- ----------------------------------------------------------------------------
-- When using LIST: "Files paths in git repositories must specify a scope.
-- For example, a branch name, a tag name, or a valid commit hash.
-- Commit hashes are between 6 and 40 characters long."
LIST @DEMO_REPO/branches/main;
LIST @DEMO_REPO/tags/tag_name;
LIST @DEMO_REPO/commits/commit_hash;

-- Related SHOW commands
SHOW GIT BRANCHES IN DEMO_REPO;
SHOW GIT TAGS IN DEMO_REPO;

-- Fetch new changes
ALTER GIT REPOSITORY DEMO_REPO FETCH;
