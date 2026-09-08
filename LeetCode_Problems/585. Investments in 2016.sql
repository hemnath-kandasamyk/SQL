# 585. Investments in 2016

SELECT 
    ROUND(SUM(tiv_2016),2) AS tiv_2016 
FROM 
(
    SELECT
        tiv_2016, 
        COUNT(*) OVER(PARTITION BY tiv_2015) tiv_2015,
        COUNT(*) OVER(PARTITION BY lat,lon) lat_lon
    FROM Insurance
)t
WHERE 
    tiv_2015>1 AND lat_lon=1;
