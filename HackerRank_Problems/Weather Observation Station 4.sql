-- Weather Observation Station 4

SELECT
    count(city) - count(distinct city)
FROM
    station
