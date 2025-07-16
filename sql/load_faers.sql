-- Set up raw staging tables for FAERS data. 
-- These match the main columns from the FAERS ASCII files for 2024 Q4.

-- Demographics table
CREATE OR REPLACE TABLE FAERS_DEMO.PUBLIC.DEMO24Q4 (
    PRIMARYID NUMBER,      -- Unique report ID
    CASEID NUMBER,         -- Case ID (groups related reports)
    AGE VARCHAR,           -- Patient age (as reported)
    SEX VARCHAR            -- Patient sex (F, M, UNK, blank)
    -- (Other columns exist in the source, but these are the ones used for this analysis)
);

-- Reactions table
CREATE OR REPLACE TABLE FAERS_DEMO.PUBLIC.REAC24Q4 (
    PRIMARYID NUMBER,      -- Foreign key to DEMO24Q4
    CASEID NUMBER,         -- Case ID
    PT VARCHAR,            -- Preferred Term (standardized adverse event)
    DRUG_REC_ACT VARCHAR   -- Drug action (if reported)
    -- (Other columns exist in the source, but these are sufficient for our needs)
);

-- Loading step: actual file loading uses Snowflake's web UI or COPY INTO.
-- Make sure your file format uses '$' as delimiter for 2024+ data.
-- Example:
-- COPY INTO FAERS_DEMO.PUBLIC.DEMO24Q4 FROM @my_stage/demo24q4.txt FILE_FORMAT = (TYPE=CSV FIELD_DELIMITER='$' SKIP_HEADER=1);
-- Repeat for REAC24Q4 as needed.
