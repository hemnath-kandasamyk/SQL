-- Weather Observation Station 6
SELECT
    distinct city
FROM
    station
WHERE
    left(city,1) in('a','e','i','o','u')
