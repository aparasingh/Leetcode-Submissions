# Write your MySQL query statement below
with customer_data as (select customer_id, 
DATEDIFF(MAX(transaction_date), MIN(transaction_date)) as days_active,
COUNT(transaction_id) as num_transactions,
COUNT(case when transaction_type = 'refund' then 1 end)/COUNT(transaction_id) as refund_rate from customer_transactions group by customer_id
)
select customer_id from customer_data where days_active >= 30 and num_transactions >=3 and refund_rate < 0.2 order by customer_id asc