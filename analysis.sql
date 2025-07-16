-- Quick record counts for basic sanity checks
SELECT COUNT(*) AS n_demo FROM FAERS_DEMO.PUBLIC.DEMO24Q4;
SELECT COUNT(*) AS n_reac FROM FAERS_DEMO.PUBLIC.REAC24Q4;
SELECT COUNT(*) AS n_features FROM FAERS_DEMO.PUBLIC.FEATURESET24Q4;

-- Preview a few rows from each table to confirm data loaded correctly
SELECT * FROM FAERS_DEMO.PUBLIC.DEMO24Q4 LIMIT 5;
SELECT * FROM FAERS_DEMO.PUBLIC.REAC24Q4 LIMIT 5;
SELECT * FROM FAERS_DEMO.PUBLIC.FEATURESET24Q4 LIMIT 5;

-- Basic data quality checks: count of nulls or missing values for key columns
SELECT 
    COUNT(*) AS total,
    COUNT(AGE) AS non_null_age,
    COUNT(SEX) AS non_null_sex,
    COUNT(REACTION) AS non_null_reaction,
    COUNT(DRUG_ACTION) AS non_null_drug_action
FROM 
    FAERS_DEMO.PUBLIC.FEATURESET24Q4;

-- Distribution of sex in the dataset (check for blank/unknown)
SELECT SEX, COUNT(*) AS count
FROM FAERS_DEMO.PUBLIC.FEATURESET24Q4
GROUP BY SEX
ORDER BY count DESC;

-- Duplicate check on PRIMARYID (should be none after flattening)
SELECT PRIMARYID, COUNT(*) AS num_rows
FROM FAERS_DEMO.PUBLIC.FEATURESET24Q4
GROUP BY PRIMARYID
HAVING COUNT(*) > 1;

-- Top 20 most common reactions, by sex
SELECT REACTION, SEX, COUNT(*) AS report_count
FROM FAERS_DEMO.PUBLIC.FEATURESET24Q4
WHERE REACTION IS NOT NULL AND SEX IS NOT NULL
GROUP BY REACTION, SEX
ORDER BY report_count DESC
LIMIT 20;

-- Top 20 reaction + drug action co-occurrences
SELECT
    REACTION,
    DRUG_ACTION,
    COUNT(*) AS n_reports
FROM
    FAERS_DEMO.PUBLIC.FEATURESET24Q4
WHERE
    DRUG_ACTION IS NOT NULL
GROUP BY
    REACTION, DRUG_ACTION
ORDER BY
    n_reports DESC
LIMIT 20;

-- Most frequent ages reported (helpful for detecting data entry issues or population skews)
SELECT AGE, COUNT(*) AS n
FROM FAERS_DEMO.PUBLIC.FEATURESET24Q4
WHERE AGE IS NOT NULL
GROUP BY AGE
ORDER BY n DESC
LIMIT 20;
