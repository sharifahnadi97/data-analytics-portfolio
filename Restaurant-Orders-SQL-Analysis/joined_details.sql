-- Combine the two table from before
SELECT * 
FROM order_details od
LEFT JOIN menu_items mi
ON od.item_id = mi.menu_item_id;

-- What were the least and most odered items? 
SELECT item_name, COUNT(item_id) AS num_purchases
FROM order_details od
LEFT JOIN menu_items mi
ON od.item_id = mi.menu_item_id
GROUP BY item_name
ORDER BY num_purchases DESC;
-- most ordered item is Hamburger and least ordered item is Chicken Tacos

-- What categories were they in?
SELECT item_name, category, COUNT(item_id) AS num_purchases
FROM order_details od
LEFT JOIN menu_items mi
ON od.item_id = mi.menu_item_id
GROUP BY item_name, category
ORDER BY num_purchases DESC;
-- Hamburger is American and Chicken Tacos is Mexican

-- What were the top 5 orders that spent the most money?
SELECT order_id, SUM(price) AS total_spend
FROM order_details od
LEFT JOIN menu_items mi
ON od.item_id = mi.menu_item_id
GROUP BY order_id
ORDER BY total_spend DESC
LIMIT 5;
-- orders 440, 2075, 1957, 330, 2675 spent the most money

-- View the details of the highest spend order.
SELECT *
FROM order_details od
LEFT JOIN menu_items mi
ON od.item_id = mi.menu_item_id
WHERE order_id = 440;
-- they ordered so much yo. probably a party

-- Insights from order 440?
SELECT category, COUNT(item_id) AS num_items
FROM order_details od
LEFT JOIN menu_items mi
ON od.item_id = mi.menu_item_id
WHERE order_id = 440
GROUP BY category;
-- 2 types of Mexican food, 2 American, 8 Italian, 2 Asian

-- View the details of the top 5 highest spend order.
SELECT category, COUNT(item_id) AS num_items
FROM order_details od
LEFT JOIN menu_items mi
ON od.item_id = mi.menu_item_id
WHERE order_id IN (440,2075,1957,330,2675)
GROUP BY category;
-- among all top 5 highest spend orders, they all ordered Italian food the most (26 items)
-- followed by Asian (17), Mexican (16), American (10)

-- Separate by the order IDs
SELECT order_id, category, COUNT(item_id) AS num_items
FROM order_details od
LEFT JOIN menu_items mi
ON od.item_id = mi.menu_item_id
WHERE order_id IN (440,2075,1957,330,2675)
GROUP BY order_id, category;
-- Order 330 order Asian food the most (6), 440 Italian (8), 1957 Italian (5)
-- 2075 Italian (6), 2675 Italian and Mexican (4 items each)