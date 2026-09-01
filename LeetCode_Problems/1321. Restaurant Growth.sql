# 1321. Restaurant Growth

with cte1 as
(
    select 
        visited_on,
        sum(amount) as amount
    from Customer
    group by visited_on
)

, cte2 as
(
    select
        visited_on,
        sum(amount) over(order by visited_on rows between 6 preceding and current row) as amount,
        round(avg(amount) over(order by visited_on rows between 6 preceding and current row) ,2) as average_amount,
        row_number() over(order by visited_on) as rno 
    from cte1
)

select
    visited_on,
    amount,
    average_amount
from cte2
where rno>=7;
