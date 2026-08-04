#1075. Project Employees I
SELECT
project_id,
ROUND(AVG(B.experience_years),2) AS average_years
FROM 
Project A
LEFT JOIN
Employee B
ON
A.employee_id = B.employee_id
GROUP BY
A.project_id;
