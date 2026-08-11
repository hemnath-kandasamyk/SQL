#570. Managers with at Least 5 Direct Reports
SELECT A.name FROM Employee A
JOIN Employee B 
ON A.id = B.managerId
GROUP BY B.managerId
HAVING COUNT(*)>=5;
