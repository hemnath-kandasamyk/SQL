#185. Department Top Three Salaries

SELECT Department,Employee,Salary
from (SELECT
        B.name AS Department,
        A.name AS Employee,
        A.salary AS Salary,
        DENSE_RANK() OVER(PARTITION BY B.id ORDER BY A.Salary DESC) AS ranks  
      FROM Employee A 
      LEFT JOIN Department B
        ON A.departmentId = B.id) ranked
WHERE ranks<=3;        
