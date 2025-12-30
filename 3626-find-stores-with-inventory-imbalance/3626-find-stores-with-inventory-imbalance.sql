# Write your MySQL query statement below
with expensive_ranking as (
    select *, row_number() OVER (partition by store_id order by price DESC) as rnk, COUNT(inventory_id) OVER (partition by store_id) as cnt from inventory
),
cheapest_ranking as (
    select *, ROW_number() OVER (partition by store_id order by price ASC) as rnk, COUNT(inventory_id) OVER (partition by store_id) as cnt from inventory
)
 select s.*, e.product_name as most_exp_product, c.product_name as cheapest_product, ROUND(c.quantity/e.quantity,2) as imbalance_ratio from expensive_ranking e join cheapest_ranking c ON (e.store_id = c.store_id) join stores s on (s.store_id = e.store_id) where e.rnk = 1 and c.rnk = 1 and c.cnt >=3 and e.cnt >= 3 and c.quantity/e.quantity > 1 order by imbalance_ratio DESC, s.store_name ASC
