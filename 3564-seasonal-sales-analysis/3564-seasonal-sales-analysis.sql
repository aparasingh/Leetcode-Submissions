# Write your MySQL query statement below
WITH season_data AS(
    select 
    CASE WHEN MONTH(s.sale_date) IN (9,10,11)
    THEN "Fall"
    WHEN MONTH(s.sale_date) IN (3,4,5)
    THEN "Spring"
    WHEN MONTH(s.sale_date) IN (6,7,8)
    THEN "Summer"
    ELSE "Winter"
    END as season, p.category as category, SUM(s.quantity) as total_quantity, SUM(s.quantity * s.price) as total_revenue from sales s join products p ON (s.product_id = p.product_id) group by p.category, season
),
ranked_categories AS(
    SELECT
        season
        ,category
        ,total_quantity
        ,total_revenue
        ,ROW_NUMBER() OVER(PARTITION BY season ORDER BY total_quantity DESC, total_revenue DESC) AS rnk
    FROM season_data
)
select season,category,total_quantity,total_revenue from ranked_categories where rnk = 1 ORDER BY season ASC;