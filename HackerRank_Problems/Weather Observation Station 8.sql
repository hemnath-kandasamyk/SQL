-- Weather Observation Station 8

SELECT
    distinct city
FROM
    station
WHERE
    right(city,1) in('a','e','i','o','u')
    and left(city,1) in('a','e','i','o','u')
