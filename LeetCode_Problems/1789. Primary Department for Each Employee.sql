# 1789. Primary Department for Each Employee

SELECT 
  employee_id, 
  department_id 
from 
  Employee 
group by 
  employee_id 
having 
  count(*)= 1 
union 
SELECT 
  employee_id, 
  department_id 
from 
  Employee 
where 
  primary_flag = 'Y' 
group by 
  employee_id
