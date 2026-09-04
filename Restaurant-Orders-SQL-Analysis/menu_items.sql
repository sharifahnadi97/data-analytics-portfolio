USE restaurant_db;

-- First thing we want to do is to view the menu.
SELECT * FROM menu_items;

-- Next we want to find how many items are in the menu
SELECT COUNT(menu_item_id) FROM menu_items;
-- answer is 32
-- or you can also so SELECT COUNT(*)

-- Least and most expensive items on the menu?
SELECT * FROM menu_items
ORDER BY price DESC;
-- most expensive is Shrimp Scampi and least expensive is Edamame
-- or can do ASC as well

-- How many Italian dishes are on the menu?
SELECT COUNT(item_name) FROM menu_items
WHERE category = "Italian";
-- answer is 9

-- Least and most expensive Italian items on the menu?
SELECT * FROM menu_items
WHERE category = "Italian"
ORDER BY price ASC;
-- most expensive is Shrimp Scampi and least expensive is Spaghetti

-- How many dishes are there in each category?
SELECT category, COUNT(menu_item_id) AS num_dishes FROM menu_items
GROUP BY category;
-- American (6), Asian (8), Mexican (9), Italian (9)

-- Average price of dish price within each category
SELECT category, AVG(price) AS avg_price
FROM menu_items
GROUP BY category;
-- American (10.07), Asian (13.48), Mexican (11.8), Italian (16.75)