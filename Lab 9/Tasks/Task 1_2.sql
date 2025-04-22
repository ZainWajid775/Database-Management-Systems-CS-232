CREATE VIEW employee_view AS
SELECT string_agg(employee_id::TEXT || ', ' || department_name || ', ' || employee_name || ', ' || salary::TEXT,'; ')
FROM employees;

SELECT * FROM employee_view;