# Write your MySQL query statement below
SELECT p.product_id, COALESCE(n.new_price,10) as price
FROM 
(SELECT DISTINCT product_id FROM Products) p
LEFT JOIN Products n
ON (p.product_id = n.product_id and n.change_date = (SELECT MAX(change_date)
FROM Products
WHERE product_id = p.product_id AND change_date <= '2019-08-16'));