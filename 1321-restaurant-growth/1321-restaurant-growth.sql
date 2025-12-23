# Write your MySQL query statement below
WITH sum_amount AS (
    select visited_on, 
SUM(amount) as amount FROM Customer group by visited_on),
dates AS (
select DATE_ADD(visited_on, INTERVAL -6 DAY) as min_date, visited_on as max_date FROM Customer group by visited_on
)
SELECT A.visited_on, SUM(S.amount) as amount, ROUND(SUM(S.amount)/7, 2) as average_amount FROM sum_amount A JOIN dates D ON (A.visited_on = D.max_date) LEFT JOIN sum_amount S ON (S.visited_on BETWEEN D.min_date and D.max_date) WHERE D.min_date IN (select visited_on FROM Customer) group by A.visited_on ORDER BY A.visited_on ASC;
;