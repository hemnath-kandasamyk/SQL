#1633. Percentage of Users Attended a Contest
SELECT B.contest_id,
ROUND(
    (COUNT(*)/(SELECT  COUNT(*) FROM Users ) *100),2 
) AS percentage
FROM
Users A
Right join 
Register B
on A.user_id = B.user_id
GROUP BY B.contest_id
ORDER BY percentage DESC,contest_id ASC;
