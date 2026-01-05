# Write your MySQL query statement below
WITH user_data AS (
    select *, ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY event_date DESC) as rnk from subscription_events
),
latest_event AS (
    select * from user_data where rnk = 1 and event_type <> 'cancel'
),
downgrade_event AS (
    select * from user_data where event_type = 'downgrade'
),
grouped_data as (
    select u.user_id, l.plan_name as current_plan, l.monthly_amount as current_monthly_amount, MAX(u.monthly_amount) as max_historical_amount, DATEDIFF(l.event_date, MIN(u.event_date)) as days_as_subscriber from user_data u JOIN latest_event l on (u.user_id = l.user_id) JOIN downgrade_event d on (u.user_id = d.user_id) group by u.user_id
)
select * from grouped_data where days_as_subscriber >= 60 and current_monthly_amount <= max_historical_amount/2 order by  days_as_subscriber desc, user_id ASC