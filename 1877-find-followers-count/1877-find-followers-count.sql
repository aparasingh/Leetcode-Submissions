# Write your MySQL query statement below
SELECT user_id, count(follower_id) as followers_count
FROM Followers
group by user_id
order by user_id asc;