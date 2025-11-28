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





