-- View order details
SELECT * FROM order_details;

-- Date range of table
SELECT MIN(order_date), MAX(order_date) FROM order_details
ORDER BY order_date ASC;
-- 1 Jan 2023 to 31 March 2023

-- How many orders were made within this date range?
SELECT COUNT(DISTINCT(order_id)) FROM order_details;
-- 5370 orders

-- How many items were ordered within this date range?
SELECT COUNT(item_id) FROM order_details;
-- 12,234 items

-- Orders with the most number of items
SELECT order_id, COUNT(item_id) AS num_items FROM order_details
GROUP BY order_id
ORDER BY num_items DESC;
-- orders 4305, 3473, 1957, 330, 440, 443, 2675 had the most items (14)

-- How many orders had more than 12 items?
SELECT COUNT(*) FROM (SELECT order_id, COUNT(item_id) AS num_items 
FROM order_details
GROUP BY order_id
HAVING num_items > 12) AS num_orders;
-- 20 orders had more than 12 items
-- HAVING to filter aggregates