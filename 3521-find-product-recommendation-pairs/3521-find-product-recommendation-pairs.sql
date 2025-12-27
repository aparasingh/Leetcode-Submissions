# Write your MySQL query statement below
WITH user_product_pair AS (
    select COUNT(P1.user_id) as customer_count, P1.product_id as product1_id, P2.product_id as product2_id from ProductPurchases P1 JOIN ProductPurchases P2 ON (P1.user_id = P2.user_id and P1.product_id < P2.product_id) group by P1.product_id,P2.product_id
)
select UP.product1_id, UP.product2_id, P1.category as product1_category, P2.category as product2_category, UP.customer_count from user_product_pair UP JOIN ProductInfo P1 ON (UP.product1_id = P1.product_id) JOIN ProductInfo P2 ON (UP.product2_id = P2.product_id) where UP.customer_count >= 3 ORDER BY customer_count DESC, product1_id ASC, product2_id ASC;