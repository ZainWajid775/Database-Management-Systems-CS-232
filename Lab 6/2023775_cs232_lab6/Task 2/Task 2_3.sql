-- Employees who work in the same department
SELECT a.employee_name AS employee1_name , b.employee_name AS employee2_name , a.department_id
FROM employees a 
JOIN employees b
ON a.department_id = b.department_id
WHERE a.employee_id < b.employee_id;