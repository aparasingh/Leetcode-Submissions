# Write your MySQL query statement below
WITH hundred_visits AS (
    select * from Stadium where people >= 100
)
select * FROM Stadium where id IN (select s1.id from hundred_visits s1 join hundred_visits s2 on (s1.id + 1 = s2.id) join hundred_visits s3 on (s3.id = s2.id + 1)
UNION ALL
select s2.id from hundred_visits s1 join hundred_visits s2 on (s1.id + 1 = s2.id) join hundred_visits s3 on (s3.id = s2.id + 1)
UNION ALL
select s3.id from hundred_visits s1 join hundred_visits s2 on (s1.id + 1 = s2.id) join hundred_visits s3 on (s3.id = s2.id + 1)
)
ORDER by visit_date ASC