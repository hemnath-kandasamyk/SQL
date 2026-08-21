#185. Department Top Three Salaries

SELECT 
   Department,
   Employee,
   Salary
   FROM
  (SELECT 
     B.name AS Department,
     A.name AS Employee,
     A.salary,
     dense_rank() over(partition by B.id order by A.salary DESC ) as ranks
   FROM Employee A
   LEFT JOIN 
    Department B
    ON A.departmentId = B.id) T
where ranks <=3;
