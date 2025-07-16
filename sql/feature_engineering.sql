-- Create a flattened, analysis-ready table by joining DEMO and REAC on PRIMARYID.
-- This gives us a row for each reaction, with demographics attached.

CREATE OR REPLACE TABLE FAERS_DEMO.PUBLIC.FEATURESET24Q4 AS
SELECT 
    demo.PRIMARYID,
    demo.CASEID,
    demo.AGE,
    demo.SEX,
    reac.PT AS REACTION,
    reac.DRUG_REC_ACT AS DRUG_ACTION
FROM 
    FAERS_DEMO.PUBLIC.DEMO24Q4 demo
LEFT JOIN 
    FAERS_DEMO.PUBLIC.REAC24Q4 reac
ON 
    demo.PRIMARYID = reac.PRIMARYID;

-- This structure makes it easy to run BI queries, build dashboards, or export for AI/ML analysis.
