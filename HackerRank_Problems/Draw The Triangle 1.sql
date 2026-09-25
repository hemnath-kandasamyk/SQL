with RECURSIVE cte AS
(
    select 20 as n
    
    union all
    
    select n-1 from
    cte where n>1
)

select repeat('* ',n) from cte
