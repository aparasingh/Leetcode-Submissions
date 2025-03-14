# Write your MySQL query statement below
SELECT customer_id
FROM Customer
group by customer_id
having count(DISTINCT product_key) = (SELECT COUNT(*) FROM Product);