-- Show employees assigned to at least one projects
SELECT e.employee_id , e.employee_name , e.department_id
FROM employees e
WHERE EXISTS
(
	SELECT 1
	FROM projects p
	WHERE e.employee_id = p.employee_id
)