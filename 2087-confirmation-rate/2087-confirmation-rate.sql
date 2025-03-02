# Write your MySQL query statement below
SELECT t.user_id, ROUND(if(COUNT(c.user_id) = 0, 0, COUNT(c.user_id)/t.totalConfirmations),2) as confirmation_rate  
FROM (SELECT s.user_id, COUNT(c.user_id) as totalConfirmations
FROM Signups s
LEFT JOIN Confirmations c ON (s.user_id = c.user_id)
GROUP BY s.user_id) t
LEFT JOIN Confirmations c
ON (c.user_id = t.user_id and c.action = "confirmed")
GROUP BY t.user_id;