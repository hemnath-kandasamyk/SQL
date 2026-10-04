-- Weather Observation Station 7

SELECT
    distinct city
FROM
    station
WHERE
    right(city,1) in('a','e','i','o','u')
