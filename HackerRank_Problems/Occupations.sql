WITH cte AS
(
    SELECT
        Occupation,
        Name,
        ROW_NUMBER() OVER(
            PARTITION BY Occupation
            ORDER BY Name
        ) AS rn 
    FROM Occupations
)

SELECT
    MAX(CASE WHEN Occupation = 'Doctor' THEN Name END) AS Doctor,
    MAX(CASE WHEN Occupation = 'Professor' THEN Name END) AS Professor,
    MAX(CASE WHEN Occupation = 'Singer' THEN Name END) AS Singer,
    MAX(CASE WHEN Occupation = 'Actor' THEN Name END) AS Actor
FROM
    cte
GROUP BY rn
ORDER BY rn
