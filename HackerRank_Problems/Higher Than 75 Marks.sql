-- Higher Than 75 Marks

SELECT
    name
FROM
    STUDENTS
WHERE
    marks>75
ORDER BY
    RIGHT(name,3),id
