# 1965. Employees With Missing Information 

(
    SELECT employee_id FROM Employees
    UNION 
    SELECT employee_id FROM Salaries
)
EXCEPT
(
    SELECT employee_id FROM Employees
    INTERSECT 
    SELECT employee_id FROM Salaries
)
ORDER BY employee_id;
