/*
===============================================================================
Date Exploration
===============================================================================
Script Purpose:
        I used this script to get the date of the first and last order, and to
        find the oldest and youngest customer in our database.
===============================================================================
*/

SELECT 
	MIN(order_date) AS first_order_date,
	MAX(order_date) AS last_order_date,
	DATEDIFF(YEAR,MIN(order_date), MAX(order_date)) AS order_range_in_years
FROM gold.fact_sales

SELECT
	MIN(birthdate) AS oldest,
	DATEDIFF(YEAR, MIN(birthdate), GETDATE()) AS oldest_customer,
	MAX(birthdate) AS youngest,
	DATEDIFF(YEAR, MAX(birthdate), GETDATE()) AS youngest_customer
FROM gold.dim_customers
