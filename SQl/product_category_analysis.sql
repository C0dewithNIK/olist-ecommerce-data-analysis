-- 3. Product & Category Performance

-- 1.. Which categories generate the highest revenue and order volume?

SELECT C.product_category_name_english AS CATEGORY,
SUM(OP.payment_value) AS Revenue_Per_Category,
count(OI.order_id) as Order_Volume, 
SUM(OP.payment_value)/count(OI.order_id) AS AVG_ORDER_VAL
FROM CATEGORY C 
JOIN PRODUCTS P 
ON C.product_category_name = P.product_category_name
JOIN order_items OI
ON P.product_id = OI.product_id
JOIN order_payment OP
ON OI.order_id = OP.order_id
GROUP BY C.product_category_name_english
ORDER BY Revenue_Per_Category DESC;

-- Category with highest revenue and order volume is bed_bath_table
-- Category with highest Average Order Value is computers
-- Categories with high orders but low revenue are: fashion_bags_accessories, electronics,
-- stationery, telephony, perfumery, toys. 
-- Top Five Products Driving Revenue are 1. bed_bath_table 2.health_beauty 3.computers_accessories
-- 4.furniture_decor 5.watches_gifts
