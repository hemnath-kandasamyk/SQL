# 1164. Product Price at a Given Date
with cte1 As
(
    select 
    product_id,
    new_price,
    change_date,
    row_number() over(partition by product_id order by change_date DESC) as rn
    from Products
    where change_date <='2019-08-16'
)
, cte2 As
(
    select 
    product_id,
    10 as new_price
    from Products 
    where 
    product_id  not in 
    (
        select product_id from cte1
    )
)

select product_id,new_price as price from cte1
where rn =1
union 
select product_id,new_price as price from cte2;
