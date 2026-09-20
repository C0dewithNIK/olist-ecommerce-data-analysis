-- 8. Customer Experience

-- 1.. What is the average review score by category?

SELECT C.product_category_name_english, avg(R.review_score) as Avg_review_category
FROM review R 
join order_items OI
on R.order_id = OI.order_id
join products P
on OI.product_id = P.product_id
join category C 
on P.product_category_name = C.product_category_name
group by C.product_category_name_english
order by Avg_review_category desc;

-- The highest avg review score is for cds_dvds_musicals i.e. 4.64 and the lowest is for security_and_services i.e. 2.5
-- This means that the customer are most satisfied with our products under cds_dvds_musicals but are really diaappointed 
-- with the security_and_services category so we need to work on it. 

-- 2.. Which categories have high sales but poor reviews?

SELECT C.product_category_name_english, sum(OI.price + OI.freight_value) as revenue_per_category,
avg(R.review_score) as Avg_review_category
FROM review R 
join order_items OI
on R.order_id = OI.order_id
join products P
on OI.product_id = P.product_id
join category C 
on P.product_category_name = C.product_category_name
group by C.product_category_name_english
order by revenue_per_category desc;

-- bed_bath_table, computer_accessories, furniture_door are in the top 10 categories by sales but have avg review 
-- lower than 4, so they need to be given extra attention. 