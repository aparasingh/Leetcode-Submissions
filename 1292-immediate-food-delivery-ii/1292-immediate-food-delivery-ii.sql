# Write your MySQL query statement below
SELECT ROUND(AVG(a.is_immediate) * 100,2) as immediate_percentage
FROM
(
SELECT customer_id, MIN(order_date)= MIN(customer_pref_delivery_date) as is_immediate
FROM Delivery
GROUP BY customer_id) a;