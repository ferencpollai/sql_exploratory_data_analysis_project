/*
===============================================================================
Dimension Exploration
===============================================================================
Script Purpose:
    This query helps identify customer coverage across countries and outlines 
    the product taxonomy. It’s useful for understanding both market reach and
    how products are organized within major divisions.
===============================================================================
*/

-- Explore All Countries our customers come from.

SELECT DISTINCT country FROM gold.dim_customers

-- Explore All Categories "The Major Divisions"

SELECT DISTINCT category, subcategory, product_name FROM gold.dim_products
ORDER BY 1,2,3
