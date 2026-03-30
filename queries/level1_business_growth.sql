-- =====================================================
-- LEVEL 1: BUSINESS SCALE & GROWTH ANALYSIS
-- =====================================================

-- 1️⃣ Total number of users
SELECT 
COUNT(*) AS total_users
FROM users;


-- 2️⃣ Total number of orders
SELECT 
COUNT(*) AS total_orders
FROM sales;


-- 3️⃣ Total revenue generated
SELECT 
SUM(p.price) AS total_revenue
FROM sales s
JOIN product p 
ON s.product_id = p.product_id;


-- 4️⃣ Average Order Value (AOV)
SELECT 
AVG(p.price) AS average_order_value
FROM sales s
JOIN product p 
ON s.product_id = p.product_id;


-- 5️⃣ Time span of transactions (business activity window)
SELECT 
MIN(created_date) AS earliest_order,
MAX(created_date) AS latest_order
FROM sales;


-- 6️⃣ Revenue trend over time (Year-wise)
SELECT 
strftime('%Y', s.created_date) AS year,
SUM(p.price) AS revenue
FROM sales s
JOIN product p 
ON s.product_id = p.product_id
GROUP BY year
ORDER BY year;


-- 7️⃣ Order volume trend over time (Year-wise)
SELECT 
strftime('%Y', created_date) AS year,
COUNT(*) AS total_orders
FROM sales
GROUP BY year
ORDER BY year;
