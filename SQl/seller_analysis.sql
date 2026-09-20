-- 4. Seller Performance

-- 1.. Which sellers generate the most revenue?

SELECT OI.seller_id, SUM(OI.price + OI.freight_value) AS REVENUE_PER_SELLER,
COUNT(OI.order_id) AS NO_OF_ORDERS,
SUM(OI.price + OI.freight_value)/ COUNT(OI.order_id) AS AVG_ORDER_VALUE
FROM order_items OI
JOIN orders O 
ON OI.order_id = O.order_id
WHERE O.order_status = 'delivered'
GROUP BY OI.seller_id 
ORDER BY REVENUE_PER_SELLER DESC ; 

-- 2.. 
SELECT OI.seller_id, S.seller_city, S.seller_state, ROUND(SUM(OP.payment_value)) AS TOTAL_REVENUE, ROUND(AVG(OP.payment_value)) AS AVG_ORDER_VALUE
FROM order_items OI
JOIN order_payment OP
ON OI.order_id = OP.order_id
JOIN sellers S 
ON OI.seller_id = S.seller_id
GROUP BY OI.seller_id, S.seller_city, S.seller_state
ORDER BY TOTAL_REVENUE DESC;

-- It is evident that out of top 10 sellers 9 are from SP state and only one is from BA.


-- How many orders and customers does each seller have ?
SELECT OI.seller_id, COUNT(DISTINCT C.CUSTOMER_UNIQUE_ID) AS NO_OF_CUSTOMERS, COUNT(O.order_id) AS NO_OF_ORDERS
FROM order_items OI
JOIN ORDERS O
ON OI.order_id = O.ORDER_ID
JOIN CUSTOMERS C 
ON O.CUSTOMER_ID =  C.CUSTOMER_ID
WHERE O.order_status = 'delivered'
GROUP BY OI.seller_id 
ORDER BY NO_OF_CUSTOMERS DESC;