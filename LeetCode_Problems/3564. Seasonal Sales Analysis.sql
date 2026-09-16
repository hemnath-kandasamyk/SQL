# 3564. Seasonal Sales Analysis
SELECT
    season,
    category,
    total_quantity,
    total_revenue
FROM 
(
    SELECT
        CASE 
            WHEN  MONTH(sale_date) IN(12,1,2) THEN 'Winter'
            WHEN  MONTH(sale_date) IN(3,4,5)  THEN 'Spring'
            WHEN  MONTH(sale_date) IN(6,7,8)  THEN 'Summer'
            ELSE  'Fall'
        END AS season,
        category,
        SUM(s.quantity) total_quantity,
        SUM(s.price*s.quantity) total_revenue
        FROM Sales s
        LEFT JOIN
    Products p
    ON
        s.product_id = p.product_id
    GROUP BY
        season,category
    ORDER BY
        season,total_quantity DESC,total_revenue DESC
)t
GROUP BY season
