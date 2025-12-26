# Write your MySQL query statement below
WITH review_ranked AS (
select review_id,
employee_id,
rating,
review_date,
ROW_NUMBER() OVER (PARTITION BY employee_id ORDER BY review_date DESC) as rnk FROM performance_reviews
),
last_three AS (
select * FROM review_ranked where rnk <= 3
),
ratings AS (
    select employee_id,
    max(case when rnk = 3 THEN rating end) as lowest_rating,
    max(case when rnk = 2 THEN rating end) as middle_rating ,
    max(case when rnk = 1 THEN rating end) as highest_rating  FROM last_three group by employee_id
)
select R.employee_id as employee_id, E.name as name, R.highest_rating - R.lowest_rating as improvement_score from ratings R JOIN employees E ON (R.employee_id = E.employee_id) where R.lowest_rating < R.middle_rating and R.middle_rating < R.highest_rating ORDER BY improvement_score DESC, name ASC;