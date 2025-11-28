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