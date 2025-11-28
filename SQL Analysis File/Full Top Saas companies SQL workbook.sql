CREATE DATABASE IF NOT EXISTS top_100_saas_companies;

CREATE TABLE IF NOT EXISTS saas_companies(
         company_name VARCHAR(75) NOT NULL PRIMARY KEY,
         founded_year INT NOT NULL,
         headquarters VARCHAR(75) NOT NULL,
         industry VARCHAR(75) NOT NULL,
         total_funding FLOAT NOT NULL,
         annual_recurring_revenue FLOAT NOT NULL,
         valuation FLOAT NOT NULL,
         employees INT NOT NULL,
         top_investors VARCHAR(75) NOT NULL,
         product VARCHAR(100) NOT NULL,
         rating DECIMAL(2,1) NOT NULL
         );
         
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

-- Basic statistics --

SELECT COUNT(*) AS total_companies,
       AVG(rating) AS avg_rating,
       AVG(annual_recurring_revenue) AS avg_revenue,
       AVG(total_funding) AS avg_funding,
       AVG(valuation) AS avg_valuation,
       AVG(employees) AS avg_employees
FROM saas_companies;

-- Industry Distribution --

SELECT industry, COUNT(*) AS company_count
FROM saas_companies
GROUP BY industry
ORDER BY company_count DESC;

-- Top 10 companies by revenue --

SELECT company_name, annual_recurring_revenue
FROM saas_companies
ORDER BY annual_recurring_revenue DESC
LIMIT 10;

-- Group companies by era --

SELECT CASE 
           WHEN founded_year < 2000 THEN 'Before 2000'
           WHEN founded_year BETWEEN 2000 AND 2010 THEN '2000-2010'
           WHEN founded_year BETWEEN 2011 AND 2020 THEN '2011-2020'
           ELSE '2021-Present'
END AS era,
	COUNT(*) AS total_companies,
    AVG(annual_recurring_revenue) AS avg_revenue,
    AVG(valuation) AS avg_valuation,
    AVG(rating) AS avg_rating
FROM saas_companies
GROUP BY era
ORDER BY era;

-- Company age vs success --

SELECT (YEAR(CURDATE()) - founded_year) AS age,
        AVG(annual_recurring_revenue) AS avg_revenue,
        AVG(rating) AS avg_revenue
FROM saas_companies
GROUP BY age
ORDER BY age;

-- Industry vs Revenue -- 

SELECT industry,
       AVG(annual_recurring_revenue) AS avg_revenue,
       AVG(valuation) AS avg_valuation,
       AVG(total_funding) AS avg_funding
FROM saas_companies
GROUP BY industry
ORDER BY avg_revenue DESC;

-- Industry vs rating --

SELECT industry,
	   AVG(rating) AS avg_rating
FROM saas_companies
GROUP BY industry
ORDER BY industry DESC;

-- Funding >> Revenue efficiency ratio -- # Shows which companies make more money per $1 funding #

SELECT company_name,
       annual_recurring_revenue / total_funding AS revenue_per_dollar
FROM saas_companies
WHERE total_funding > 0
ORDER BY revenue_per_dollar DESC;

-- Funding vs valuation --

SELECT total_funding, valuation
FROM saas_companies;

-- Employee count vs revenue --

SELECT employees, annual_recurring_revenue
FROM saas_companies;

-- Top 10 most highly funded companies --

SELECT company_name, total_funding
FROM saas_companies
ORDER BY total_funding DESC
LIMIT 10;

-- Top 10 most underrated companies --  # High revenue but low funding #

SELECT company_name,
       annual_recurring_revenue,
       total_funding
FROM saas_companies
WHERE total_funding < (SELECT AVG(total_funding) FROM saas_companies)
ORDER BY annual_recurring_revenue DESC
LIMIT 10;

-- Rating distribution --

SELECT rating, COUNT(*)
FROM saas_companies
GROUP BY rating 
ORDER BY rating DESC;

-- Rating vs revenue --

SELECT rating, 
       AVG(annual_recurring_revenue) AS avg_revenue
FROM saas_companies
GROUP BY rating
ORDER BY rating DESC;

-- Which investor appears the most --

SELECT top_investors,
       COUNT(*) AS portfolio_count 
FROM saas_companies
GROUP BY top_investors
ORDER BY portfolio_count DESC;

-- High-level profile of a successful company --

SELECT AVG(annual_recurring_revenue) AS revenue,
       AVG(valuation) AS valuation,
       AVG(total_funding) AS funding,
       AVG(employees) AS employees, 
       AVG(rating) AS rating
FROM saas_companies
WHERE annual_recurring_revenue > ( SELECT AVG(annual_recurring_revenue) FROM saas_companies)
AND rating > (SELECT AVG(rating) FROM saas_companies);
