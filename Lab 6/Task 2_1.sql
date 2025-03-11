--Employees not assigned to any projects
SELECT e.employee_id , e.employee_name , e.department_id
FROM employees e
LEFT JOIN projects
ON e.employee_id = projects.employee_id
WHERE e.department_id IS NULL;
