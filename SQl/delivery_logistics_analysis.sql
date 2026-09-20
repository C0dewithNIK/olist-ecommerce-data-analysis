-- 6. DELIVERY & LOGISTICS

-- 1.. What is the average delivery time ?

WITH DELIVERY_DURATION AS(
SELECT order_id, 
DATEDIFF(order_delivered_customer_date, order_approved_at) AS delivery_time,
TIMESTAMPDIFF(HOUR, order_approved_at, order_delivered_customer_date) as DELIVERY_HOURS
FROM ORDERS 
WHERE order_status = 'delivered')
SELECT sum(delivery_time)/COUNT(order_id) as Avg_delivery_days, 
sum(DELIVERY_HOURS)/COUNT(order_id) as Avg_delivery_hours
FROM DELIVERY_DURATION ;

-- THE AVG DAYS FOR DELIVERY OF A PRODUCT IS APPROXIMATELY 12 DAYS AND THE AVG DELIVERY HOURS ARE 290.5 HOURS

-- 2..

WITH DELIVERY_STATUS AS (
SELECT 
COUNT(CASE 
WHEN DATEDIFF(order_delivered_customer_date, order_estimated_delivery_date)>0 THEN 1
END) AS DELAYED_ORDERS,
COUNT(CASE
WHEN DATEDIFF(order_delivered_customer_date, order_estimated_delivery_date)<0 THEN 1
END) AS TIMELY_ORDERS
FROM ORDERS
WHERE order_status = 'delivered')
SELECT (DELAYED_ORDERS/(DELAYED_ORDERS+TIMELY_ORDERS))*100 AS PERCENTAGE_ORDERS_DELAYED 
FROM DELIVERY_STATUS;

-- AROUND 6.86% ORDERS ARE DELAYED OVERALL

-- 3.. Which regions have the highest delivery delays?

WITH REGIONAL_DELIVERY_STATUS AS(
SELECT C.customer_state,
COUNT(CASE 
WHEN DATEDIFF(order_delivered_customer_date, order_estimated_delivery_date)>0 THEN 1
END) AS DELAYED_ORDERS,
COUNT(CASE
WHEN DATEDIFF(order_delivered_customer_date, order_estimated_delivery_date)<0 THEN 1
END) AS TIMELY_ORDERS
FROM ORDERS O
JOIN CUSTOMERS C
ON O.customer_id = C.customer_id
GROUP BY C.customer_state
ORDER BY DELAYED_ORDERS DESC)
SELECT *, (DELAYED_ORDERS/(DELAYED_ORDERS+TIMELY_ORDERS))*100 AS PERCENTAGE_ORDERS_DELAYED
FROM REGIONAL_DELIVERY_STATUS;

-- THE state with highest no of delayed orders is SP with 1820 delayed orders and delay percentage of 4.55, followed by RJ 
-- with 1495 delayed orders and a delay percentage of 12.27. 
-- Percentage wise the state AL has the highest delay percentage of 21.96 with total orders 387.
-- SP, RJ and MG account for significant number of orders but while the delay perecentage of SP and MG is nearly 4.5 % 
-- but that of RJ is significantly higher at 12.27 %\

-- 4.. Do delays impact customer reviews?

WITH REVIEW_RATING AS (
SELECT 
SUM(CASE 
WHEN DATEDIFF(order_delivered_customer_date, order_estimated_delivery_date)>0 THEN R.review_score
END) as DELAY_SCORE,
SUM(CASE
WHEN DATEDIFF(order_delivered_customer_date, order_estimated_delivery_date)<0 THEN R.review_score
END) as TIMELY_SCORE,
COUNT(CASE 
WHEN DATEDIFF(order_delivered_customer_date, order_estimated_delivery_date)>0 THEN 1
END) AS DELAYED_ORDERS,
COUNT(CASE
WHEN DATEDIFF(order_delivered_customer_date, order_estimated_delivery_date)<0 THEN 1
END) AS TIMELY_ORDERS
FROM ORDERS O
JOIN REVIEW R 
ON O.order_id = R.order_id
WHERE O.order_status = 'delivered'
)
SELECT DELAY_SCORE/DELAYED_ORDERS AS AVG_REVIEW_DELAYED,
TIMELY_SCORE/TIMELY_ORDERS AVG_REVIEW_TIMELY
FROM REVIEW_RATING;

-- The avg review score when orders are delayed is 2.27 whereas when the order is delivered on time is 4.29 
-- so it is quite evident that delays in orders affect the rating, showing that timely delivery = customer satisfaction 