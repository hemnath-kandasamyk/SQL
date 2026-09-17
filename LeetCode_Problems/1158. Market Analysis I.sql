# 1158. Market Analysis I
SELECT
    user_id AS buyer_id,
    join_date,
    SUM(IF(YEAR(order_date) ='2019',1,0)) AS orders_in_2019
FROM
    Users u
LEFT JOIN
    Orders o
ON
    u.user_id = o.buyer_id
GROUP BY user_id
