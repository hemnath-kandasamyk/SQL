#1327. List the Products Ordered in a Period
SELECT
A.product_name,
SUM(
    CASE WHEN B.order_date between '2020-02-01' and '2020-02-29' then B.unit else 0 end
) as unit
 FROM 
Products A
left join 
Orders B 
on A.product_id = B.product_id
group by
A.product_id,A.product_name
HAVING unit>=100;
