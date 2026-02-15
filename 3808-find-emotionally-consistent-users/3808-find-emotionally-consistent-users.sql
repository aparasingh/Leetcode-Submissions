WITH CTE AS(
    SELECT user_id, reaction, SUM(COUNT(1)) OVER(PARTITION BY user_id) total_reaction,
    COUNT(1) total_group_reaction
    FROM reactions
    GROUP BY user_id, reaction
)
SELECT  user_id, reaction dominant_reaction, ROUND(total_group_reaction / CAST( total_reaction AS DECIMAL(10,2)),2) reaction_ratio
FROM CTE
WHERE total_reaction > 4 AND ROUND(total_group_reaction / CAST( total_reaction AS DECIMAL(10,2)),2) >= 0.6
ORDER BY reaction_ratio DESC, user_id