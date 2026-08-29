# 1204. Last Person to Fit in the Bus

select person_name from
(select
Turn,
person_name,
sum(weight) over(order by Turn ROWS BETWEEN unbounded preceding AND current row ) runsum
from Queue)t
where runsum<=1000
order by runsum DESC
Limit 1;
