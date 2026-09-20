-- CUSTOMER BEHAVIOUR ANALYSIS

-- 1.

WITH CUSTOMER_ORDERS AS (
SELECT C.CUSTOMER_UNIQUE_ID, COUNT(O.ORDER_ID) AS ORDERS_PER_CUSTOMER
FROM CUSTOMERS C
JOIN ORDERS O
ON C.CUSTOMER_ID = O.CUSTOMER_ID 
GROUP BY C.CUSTOMER_UNIQUE_ID
-- HAVING ORDERS_PER_CUSTOMER > 1
ORDER BY ORDERS_PER_CUSTOMER DESC
)
SELECT  
(SELECT COUNT(CUSTOMER_UNIQUE_ID)
FROM CUSTOMER_ORDERS
WHERE ORDERS_PER_CUSTOMER > 1) AS REPEAT_CUS,
COUNT(CUSTOMER_UNIQUE_ID) AS TOTAL_CUS,
((SELECT COUNT(CUSTOMER_UNIQUE_ID)
FROM CUSTOMER_ORDERS
WHERE ORDERS_PER_CUSTOMER > 1)/COUNT(CUSTOMER_UNIQUE_ID))*100 as PERCENT_REPEAT_CUS
FROM  CUSTOMER_ORDERS;

-- 2.
SELECT AVG(T.ORDER_PER_CUS) AS AVG_ORDERS_PER_CUSTOMER
FROM(
SELECT C.customer_unique_id, COUNT(C.customer_id) AS ORDER_PER_CUS
FROM customers C
JOIN orders O 
ON C.customer_id = O.customer_id
WHERE  O.order_status = 'delivered'
GROUP BY C.customer_unique_id
ORDER BY ORDER_PER_CUS DESC) T;


SELECT C.customer_unique_id, COUNT(C.customer_id) AS ORDER_PER_CUS
FROM customers C
JOIN orders O 
ON C.customer_id = O.customer_id
WHERE  O.order_status = 'delivered'
GROUP BY C.customer_unique_id
ORDER BY ORDER_PER_CUS DESC;


-- 3. 

SELECT *
FROM(
WITH customer_revenue as (
SELECT C.customer_unique_id, SUM(payment_value) as TOTAL_REVENUE_PER_CUS
FROM customers C
JOIN orders O 
ON C.customer_id = O.customer_id
JOIN order_payment OP
ON O.order_id = OP.order_id
WHERE O.order_status = 'delivered'
GROUP BY customer_unique_id
ORDER BY TOTAL_REVENUE_PER_CUS DESC)
SELECT *, NTILE(10) OVER( ORDER BY TOTAL_REVENUE_PER_CUS DESC) as Bucket
FROM customer_revenue) t 
WHERE Bucket = 1;

-- No. of Customers Per City
SELECT customer_city, COUNT(customer_unique_id) AS NO_OF_CUSTOMERS
FROM customers
GROUP BY customer_city
ORDER BY NO_OF_CUSTOMERS DESC;

-- No. of Customers Per State
SELECT customer_state, COUNT(distinct customer_city), COUNT(customer_unique_id) AS NO_OF_CUSTOMERS
FROM customers
GROUP BY customer_state
ORDER BY NO_OF_CUSTOMERS DESC;

-- Revenue BY State
SELECT C.customer_state, COUNT(distinct customer_city) AS NO_OF_CITIES, COUNT(customer_unique_id) AS NO_OF_CUSTOMERS,
ROUND(SUM(payment_value)) AS REVENUE_STATE
FROM customers C
JOIN orders O
ON C.customer_id = O.customer_id
JOIN order_payment OP
ON O.order_id = OP.order_id
GROUP BY C.customer_state
ORDER BY REVENUE_STATE DESC;

-- MOST REVENUE COMES FROM SP i.e. 5985017
-- MOST CUSTOMERS ARE FROM SP i.e. 43533
-- MOST NO. OF CITIES ARE IN MG BUT IT COMES THIRD IN OVERALL REVENUE AND NO_OF_CUSTOMERS

-- Revenue by city
SELECT C.customer_city, COUNT(customer_unique_id) AS NO_OF_CUSTOMERS,
ROUND(SUM(payment_value)) AS REVENUE_STATE
FROM customers C
JOIN orders O
ON C.customer_id = O.customer_id
JOIN order_payment OP
ON O.order_id = OP.order_id
GROUP BY C.customer_city
ORDER BY REVENUE_STATE DESC;

-- TOP CITIES ARE SAU PAULO, RIO DE JANERIO, BELO HORIZONTE BASED ON TOTAL_REVENUE