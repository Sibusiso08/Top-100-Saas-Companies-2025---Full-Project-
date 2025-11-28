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
       
       
       