SELECT
B.employee_id,
B.name,
COUNT(*) AS reports_count,
ROUND(AVG(A.age),0) AS average_age
FROM 
Employees A 
JOIN 
Employees B
on 
A.reports_to = B.employee_id
GROUP BY
B.employee_id
ORDER BY
B.employee_id;
