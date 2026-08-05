#1378. Replace Employee ID With The Unique Identifier
SELECT
B.unique_id,
A.name
FROM
Employees A 
LEFT JOIN 
EmployeeUNI B
ON
A.id =B.id;
