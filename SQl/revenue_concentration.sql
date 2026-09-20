-- 8. Revenue Concentration

-- 1.. What % of revenue comes from top 20% customers ? 

WITH REV_PERC AS(
SELECT O.customer_id, sum(OP.payment_value) as revenue_per_cus, (select sum(payment_value)
from order_payment OP
JOIN orders O
ON OP.order_id = O.order_id
where O.order_status = 'delivered') as total_revenue,
 NTILE(5) Over(ORDER BY sum(OP.payment_value) DESC) AS BUCKET
FROM orders O
JOIN order_payment OP
ON O.order_id = OP.order_id
WHERE O.order_status = 'delivered'
GROUP BY O.customer_id 
order by revenue_per_cus desc)
SELECT SUM(revenue_per_cus), total_revenue , SUM(revenue_per_cus)/total_revenue*100 as revenue_by_top20
FROM REV_PERC
WHERE BUCKET = 1;

-- We can see that the top 20% customers contribute around 53.19% to the total revenue, which means only 46.81% comes from other 80% 
-- customers which is huge opportunity for us to make these new customers contribute more

-- 2.. What % of revenue comes from top categories?

WITH CAT_REV_PERC AS(
SELECT C.product_category_name_english, SUM(OI.price+OI.freight_value) as CATEGORY_WISE_REV,
NTILE(10) OVER(ORDER BY SUM(OI.price+OI.freight_value) DESC) AS BUCKET
FROM order_items OI
JOIN products P 
ON OI.product_id = P.product_id
JOIN category C
ON P.product_category_name = C.product_category_name
GROUP BY C.product_category_name_english)
SELECT SUM(CATEGORY_WISE_REV) AS TOP10_REV, (select sum(payment_value)
from order_payment) as TOTAL_REV,  SUM(CATEGORY_WISE_REV)/(select sum(payment_value)
from order_payment)*100 AS revenue_by_top10
FROM CAT_REV_PERC
WHERE BUCKET = 1;

-- We can see that around 53.74% revenue comes from top 10% categories and rest 46.26% comes from the remaining 90% categories 

-- 3.. Are we dependent on a few sellers or customers

WITH SELLER_REV_PERC AS(
SELECT OI.seller_id, SUM(OI.price+OI.freight_value) as SELLER_WISE_REV, (select sum(payment_value)
from order_payment OP
JOIN orders O
ON OP.order_id = O.order_id
where O.order_status = 'delivered') as TOTAL_REV,
NTILE(5) OVER(ORDER BY SUM(OI.price+OI.freight_value) DESC) AS BUCKET
FROM order_items OI
JOIN orders O
ON OI.order_id = O.order_id
where O.order_status = 'delivered'
group by OI.seller_id)
SELECT SUM(SELLER_WISE_REV) AS TOP20_REV, TOTAL_REV, SUM(SELLER_WISE_REV)/TOTAL_REV*100 AS revenue_by_top20
FROM SELLER_REV_PERC
WHERE BUCKET = 1;

-- Here we can see that around 81.6% of our total revenue comes from the top 20% sellers which is significantly higher when compared to top 20% customers
-- whose share was around 53.19% so we can surely say that we are highly dependent on top 20% sellers and we need to diversify our selling channels.   

WITH REPEAT_CUS AS(
SELECT customer_unique_id, count(order_id) as NO_OF_ORDERS
FROM orders O 
join customers C 
on O.customer_id = C.customer_id
where O.order_status = 'delivered'
group by customer_unique_id
order by NO_OF_ORDERS)
select COUNT(customer_unique_id) REPEAT_CUS, (SELECT COUNT(DISTINCT customer_unique_id)
from orders O 
join customers C 
on O.customer_id = C.customer_id
where O.order_status = 'delivered') TOTAL_CUS
FROM REPEAT_CUS
WHERE NO_OF_ORDERS > 1;