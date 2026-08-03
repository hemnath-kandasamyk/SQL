#184. Department Highest Salary
SELECT 
D.name AS Department,
E.name AS Employee,
E.salary AS Salary
FROM Employee E
 JOIN Department D
ON E.departmentId = D.id
JOIN 
 (SELECT 
  departmentId,
  MAX(salary) as Salary
  FROM Employee 
  GROUP BY departmentId )M
ON 
  E.departmentId = M.departmentId 
  AND
  E.salary = M.Salary;
