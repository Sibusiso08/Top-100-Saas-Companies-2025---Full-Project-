SELECT *
FROM saas_companies;

-- Check for missing values --

SELECT 
     SUM(company_name IS NULL) AS missing_name,
     SUM(rating IS NULL) AS missing_rating,
     SUM(founded_year IS NULL) AS missing_year
FROM saas_companies;

-- Check data types --

DESCRIBE saas_companies;

-- Check for duplicates -- 

SELECT company_name, COUNT(*)
FROM saas_companies
GROUP BY company_name
HAVING COUNT(*) > 1;

