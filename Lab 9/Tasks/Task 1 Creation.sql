DROP TABLE employees;

CREATE TABLE employees
(
	employee_id INT PRIMARY KEY,
	department_name VARCHAR,
	employee_name VARCHAR,
	salary numeric
);

INSERT INTO employees(employee_id , department_name , employee_name , salary)
VALUES 
	(1 , 'IT' , 'Alex' , 123400),
	(2 , 'Finance' , 'Marie' , 2435467),
	(3 , 'Marketing' , 'Quin' , 325465),
	(4 , 'IT' , 'Redoff' , 56876);

	