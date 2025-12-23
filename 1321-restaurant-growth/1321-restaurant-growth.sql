# Write your MySQL query statement below
WITH sum_amount AS (
    select visited_on, 
SUM(amount) as amount FROM Customer group by visited_on),
date_range AS (
select DATE_ADD(visited_on, INTERVAL -6 DAY) as min_date, visited_on as max_date FROM Customer group by visited_on
),
all_date_amounts AS (
SELECT A.visited_on as visited_on, S.visited_on as amount_date, S.amount as amount FROM sum_amount A JOIN date_range D ON (A.visited_on = D.max_date) LEFT JOIN sum_amount S ON (S.visited_on BETWEEN D.min_date and D.max_date) WHERE D.min_date IN (select visited_on FROM Customer)
)
SELECT A.visited_on, SUM(A.amount) as amount, ROUND(SUM(A.amount)/7, 2) as average_amount FROM all_date_amounts A group by A.visited_on ORDER BY A.visited_on ASC;