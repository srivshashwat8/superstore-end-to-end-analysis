-- ============================================
-- SUPERSTORE DATA ANALYSIS (SQL LAYER)
-- ============================================

-- PURPOSE:
-- This step simulates extracting useful data from a database
-- before performing deeper analysis in Python.

use superstore_db;
-- Total Sales, Profit, Orders
SELECT 
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit,
    COUNT(DISTINCT `Order ID`) AS total_orders
FROM superstore;

-- 2️ MONTHLY SALES TREND
SELECT 
    DATE_FORMAT(`Order Date`, '%Y-%m') AS month,
    SUM(Sales) AS total_sales
FROM superstore
GROUP BY month
ORDER BY month;

-- 3️ CATEGORY PERFORMANCE
SELECT 
    Category,
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit
FROM superstore
GROUP BY Category;

-- 4 Sub-category Profit (identify loss areas)
SELECT 
    `Sub-Category`,
    SUM(Profit) AS total_profit
FROM superstore
GROUP BY `Sub-Category`
ORDER BY total_profit ASC;

-- 5 TOP 10 CUSTOMERS
SELECT 
    `Customer Name`,
    SUM(Sales) AS total_sales
FROM superstore
GROUP BY `Customer Name`
ORDER BY total_sales DESC
LIMIT 10;


-- 6 REPEAT CUSTOMERS
SELECT 
    `Customer Name`,
    COUNT(`Order ID`) AS order_count
FROM superstore
GROUP BY `Customer Name`
HAVING order_count > 1;

-- 7 Sales by Region
SELECT 
    Region,
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit
FROM superstore
GROUP BY Region;