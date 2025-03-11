-- Detail of all projects along with employee name
SELECT p.project_id , p.project_name , e.employee_name , p.start_date , p.end_date
FROM projects p
NATURAL JOIN employees e