# Write your MySQL query statement below
SELECT p.product_name, SUM(o.unit) as unit
FROM Products p
LEFT JOIN Orders o
ON (p.product_id = o.product_id)
WHERE DATE_FORMAT(o.order_date, '%Y %m') = '2020 02'
GROUP BY p.product_id
HAVING SUM(o.unit) >= 100;