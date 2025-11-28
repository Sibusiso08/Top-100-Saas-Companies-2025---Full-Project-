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



