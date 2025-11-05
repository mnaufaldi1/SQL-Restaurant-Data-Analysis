-- ===============================================
-- 🍽 RESTAURANT SALES ANALYSIS PROJECT (PostgreSQL)
-- ===============================================
-- Author: Muhammad Naufaldi
-- Description: SQL analysis of restaurant menu and orders data
-- ===============================================


-- ==============================
-- 1️⃣ MENU ITEMS EXPLORATION
-- ==============================

-- View the menu items
SELECT * FROM menu_items;

-- Count total items on the menu
SELECT COUNT(*) AS total_menu_items FROM menu_items;

-- Find the least and most expensive items on the menu
SELECT MIN(price) AS least_expensive, MAX(price) AS most_expensive FROM menu_items;

-- Count how many Italian dishes are on the menu
SELECT COUNT(*) AS italian_dishes FROM menu_items
WHERE category = 'Italian';

-- List Italian dishes (from least to most expensive)
SELECT item_name, category, price
FROM menu_items
WHERE category = 'Italian'
ORDER BY price DESC;

-- Count dishes in each category
SELECT category, COUNT(*) AS total_dishes
FROM menu_items
GROUP BY category
ORDER BY total_dishes DESC;

-- Average dish price within each category
SELECT category, ROUND(AVG(price), 2) AS avg_price
FROM menu_items
GROUP BY category
ORDER BY avg_price DESC;


-- ==============================
-- 2️⃣ ORDER DATA EXPLORATION
-- ==============================

-- View order_details table
SELECT * FROM order_details;

-- Find the date range of the data
SELECT MIN(order_date) AS first_order_date, MAX(order_date) AS last_order_date
FROM order_details;

-- Count total unique orders within this date range
SELECT COUNT(DISTINCT order_id) AS total_orders FROM order_details;

-- Count total items ordered
SELECT COUNT(item_id) AS total_items_ordered FROM order_details;

-- Identify orders with the most items
SELECT order_id, COUNT(*) AS num_items
FROM order_details
GROUP BY order_id
ORDER BY num_items DESC;


-- ==============================
-- 3️⃣ SALES PERFORMANCE ANALYSIS
-- ==============================

-- What is the total revenue per category?
SELECT mi.category, SUM(price) AS total_revenue
FROM menu_items mi
JOIN order_details od ON mi.menu_item_id = od.item_id
GROUP BY mi.category
ORDER BY total_revenue DESC;

-- Which 5 menu items generate the highest total sales?
SELECT mi.item_name, SUM(price) AS total_sales
FROM menu_items mi
JOIN order_details od ON mi.menu_item_id = od.item_id
GROUP BY mi.item_name
ORDER BY total_sales DESC
LIMIT 5;

-- Which menu items have never been ordered?
SELECT mi.item_name, mi.category
FROM menu_items mi
LEFT JOIN order_details od ON mi.menu_item_id = od.item_id
WHERE od.item_id IS NULL;

-- What hour of the day has the most orders?
SELECT EXTRACT(HOUR FROM order_time) AS order_hour,
       COUNT(*) AS total_orders
FROM order_details
GROUP BY order_hour
ORDER BY total_orders DESC;

-- Which day of the week earns the most total revenue?
SELECT TO_CHAR(order_date, 'FMDay') AS day_name,
       SUM(price) AS total_revenue
FROM menu_items mi
JOIN order_details od ON mi.menu_item_id = od.item_id
GROUP BY day_name
ORDER BY total_revenue DESC;

-- What is the average number of items per order?
SELECT ROUND(AVG(count_items), 2) AS avg_items_per_order
FROM (
    SELECT order_id, COUNT(item_id) AS count_items
    FROM order_details
    GROUP BY order_id
) AS sub;


-- ==============================
-- 4️⃣ CUSTOMER ORDER INSIGHTS
-- ==============================

-- What are the most ordered items, and which categories are they in?
SELECT mi.item_name, mi.category, COUNT(*) AS total_orders
FROM order_details od
LEFT JOIN menu_items mi ON od.item_id = mi.menu_item_id
GROUP BY mi.item_name, mi.category
ORDER BY total_orders DESC; -- or ASC for least ordered

-- Which 5 orders spent the most money?
SELECT order_id, SUM(price) AS total_spent
FROM order_details od
LEFT JOIN menu_items mi ON od.item_id = mi.menu_item_id
GROUP BY order_id
HAVING SUM(price) IS NOT NULL
ORDER BY total_spent DESC
LIMIT 5;

-- What categories were included in the highest-spending order?
SELECT mi.category, COUNT(item_id) AS num_items
FROM order_details od
LEFT JOIN menu_items mi ON od.item_id = mi.menu_item_id
WHERE order_id = 440
GROUP BY mi.category;

-- What categories were included in the top 5 highest-spending orders?
SELECT od.order_id, mi.category, COUNT(item_id) AS num_items
FROM order_details od
LEFT JOIN menu_items mi ON od.item_id = mi.menu_item_id
WHERE order_id IN (440, 2075, 1975, 330, 2675)
GROUP BY od.order_id, mi.category
ORDER BY od.order_id;

-- ===============================================
-- 🧠 SUMMARY INSIGHTS — Key Findings
-- ===============================================
-- - Peak order hour: 12–1 PM
-- - Day with most revenue: Monday
-- - Top revenue category: Italian
-- - Average items per order: ~2.25
-- - Best-selling dish: Hamburger
-- - Least ordered: Chicken Tacos
-- ===============================================
