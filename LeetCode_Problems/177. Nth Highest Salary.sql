# 177. Nth Highest Salary

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
    SELECT
        salary 
    FROM
    (
        SELECT 
            salary,
            DENSE_RANK() OVER(ORDER BY salary DESC) rnk
        FROM Employee
    )t
    WHERE 
        rnk = N
        LIMIT 1
  );
END
