# Write your MySQL query statement below
SELECT p.product_id, if(SUM(u.units) is null, 0,ROUND(SUM(p.price*u.units)/SUM(u.units),2)) as average_price
FROM Prices p
LEFT JOIN UnitsSold u
ON (p.product_id = u.product_id and u.purchase_date >= p.start_date and u.purchase_date <= p.end_date)
GROUP BY p.product_id;