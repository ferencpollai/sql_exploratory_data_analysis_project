/*
===============================================================================
Ranking TOP N - BOTTOM N
===============================================================================
Script Purpose:
    This script's purpose is to find the TOP performing products that generate
    the highest or the lowest revenue. The first two scripts give the same
    result but in the second one I used a subquery and a window function.
===============================================================================
*/

-- Which 5 products generate the highest revenue?

SELECT TOP 5
p.product_name,
SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
ON p.product_key = f.product_key
GROUP BY p.product_name
ORDER BY total_revenue DESC

SELECT * FROM 
(SELECT
p.product_name,
SUM(f.sales_amount) AS total_revenue,
ROW_NUMBER() OVER (ORDER BY SUM(f.sales_amount) DESC) AS rank_products
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
ON p.product_key = f.product_key
GROUP BY p.product_name)t
WHERE rank_products<=5

-- What are the 5 worst-performing products in terms of sales?

SELECT TOP 5
p.product_name,
SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
ON p.product_key = f.product_key
GROUP BY p.product_name
ORDER BY total_revenue
