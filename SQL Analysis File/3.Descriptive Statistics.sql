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
