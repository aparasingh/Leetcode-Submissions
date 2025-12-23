# Write your MySQL query statement below
WITH sum_buy AS (
    select stock_name, SUM(price) buy_price from Stocks where operation = 'Buy' group by stock_name
),
sum_sell AS (
    select stock_name, SUM(price) sell_price from Stocks where operation = 'Sell' group by stock_name
)
SELECT B.stock_name as stock_name, S.sell_price - B.buy_price as capital_gain_loss FROM sum_buy B JOIN sum_sell S ON (B.stock_name = S.stock_name);