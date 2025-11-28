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