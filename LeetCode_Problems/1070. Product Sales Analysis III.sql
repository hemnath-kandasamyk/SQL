# 1070. Product Sales Analysis III

  -- window function rank + subquery
  
select
product_id,year as first_year,quantity,price
from 
(select
*,
rank() over(partition by product_id order by year) rnk
from Sales)t
where rnk =1;


-- common table expression(cte) + window function 

with cte as
(
    select 
    product_id,year as first_year,quantity,price,
    rank() over(partition by product_id order by year) as rnk
    from Sales
)

select product_id,first_year,quantity,price from cte
where rnk =1;
