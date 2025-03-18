CREATE TABLE employees
(
	employee_id INT PRIMARY KEY,
	employee_name VARCHAR,
	department_id INT,
	hire_date DATE
);

INSERT INTO employees (employee_id , employee_name , department_id , hire_date)
VALUES 
	(1 , 'John' , 101 , '2020-01-15'),
	(2 , 'Sarah' , 101 , '2021-03-20'),
	(3 , 'Mike' , 102 , '2019-07-10'),
	(4 , 'Emma' , NULL , '2022-05-01');

CREATE TABLE projects
(
	project_id INT PRIMARY KEY,
	project_name VARCHAR,
	employee_id INT,
	start_date DATE,
	end_date DATE,
	FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

INSERT INTO projects(project_id , project_name , employee_id , start_date , end_date)
VALUES
	(1 , 'project_alpha' , 1 , '2023-01-01' , '2023-06-30'),
	(2 , 'project_beta' , 2 , '2023-02-15' , '2023-08-31'),
	(3 , 'project_gamma' , 1 , '2023-03-01' , '2023-09-30');


SELECT e.employee_id , e.employee_name , e.department_id
FROM employees e
LEFT JOIN projects p
ON e.employee_id = p.employee_id
WHERE p.project_id IS NULL;

SELECT e.employee_id , e.employee_name , e.department_id
FROM employees e
WHERE EXISTS (
	SELECT 1
	FROM projects p
	WHERE p.employee_id = e.employee_id
);

SELECT e.employee_id , e.employee_name , e.department_id
FROM employees e
WHERE EXISTS (
	SELECT p.employee_id 
	FROM projects p
	WHERE p.employee_id = e.employee_id
	GROUP BY p.employee_id
	HAVING COUNT(*) = 1
);

SELECT a.employee_id , b.employee_id , a.department_id
FROM employees a 
JOIN employees b
ON a.department_id = b.department_id
WHERE a.employee_id < b.employee_id;

SELECT p.project_id ,p.project_name , e.employee_name , p.start_date , p.end_date
FROM employees e
NATURAL JOIN projects p;

