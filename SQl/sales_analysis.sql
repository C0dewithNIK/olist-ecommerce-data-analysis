-- AVG ORDER VALUE

SELECT AVG(PAYMENT_VALUE) AS AVG_ORDER_VALUE
FROM order_payment OP
JOIN orders O
ON OP.order_id = O.order_id
where O.order_status = 'delivered';




-- ORDERS OVER TIME (MONTHLY)
WITH delivered_orders as (
SELECT *
FROM ORDERS
WHERE order_status = 'delivered'
)
SELECT substring(order_purchase_timestamp, 1,7) as months, COUNT(dor.order_id) as delivered_orders
FROM delivered_orders dor
GROUP BY substring(order_purchase_timestamp, 1,7)
ORDER BY months; 
 
 
WITH PERCENTAGE_SUCCESS AS ( 
SELECT substring(order_purchase_timestamp, 1,7) as months, 
count(order_id) Total_orders,
sum(CASE WHEN order_status = 'delivered' THEN 1 ELSE 0 END) AS Delivered_orders
FROM orders
GROUP BY substring(order_purchase_timestamp, 1,7)
ORDER BY months
)
SELECT months, Delivered_orders, Total_orders,
(Delivered_orders/Total_orders)*100 as percentage_success
FROM PERCENTAGE_SUCCESS
ORDER BY MONTHS;

-- ORDERS + REVENUE TREND 
WITH delivered_orders as (
SELECT *
FROM orders o
WHERE o.order_status = 'delivered'
)
SELECT substring(order_purchase_timestamp, 1,7) as months, count(dos.order_id) as monthly_orders,
sum(op.payment_value) monthly_revenue
FROM delivered_orders dos
JOIN order_payment op 
ON dos.order_id = op.order_id
GROUP BY substring(order_purchase_timestamp, 1,7)
ORDER BY months;

WITH Rolling_Total as(
SELECT substring(order_purchase_timestamp, 1,7) as months, count(o.order_id) as monthly_orders,
sum(op.payment_value) monthly_revenue
FROM orders o
JOIN order_payment op 
ON o.order_id = op.order_id
WHERE o.order_status = 'Delivered'
GROUP BY substring(order_purchase_timestamp, 1,7)
ORDER BY months)
SELECT *,
SUM(monthly_orders) over(order by months) Orders_progression,
SUM(monthly_revenue) over(order by months) Revenue_progression
FROM Rolling_Total;

SELECT customer_city, COUNT(customer_unique_id) AS NO_OF_CUSTOMERS
FROM customers
GROUP BY customer_city
ORDER BY NO_OF_CUSTOMERS DESC;

SELECT customer_state, COUNT(distinct customer_city), COUNT(customer_unique_id) AS NO_OF_CUSTOMERS
FROM customers
GROUP BY customer_state
ORDER BY NO_OF_CUSTOMERS DESC;