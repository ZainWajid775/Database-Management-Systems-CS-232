CREATE TABLE employees_registered
(
	employee_id INT PRIMARY KEY,
	department_name VARCHAR,
	employee_name VARCHAR,
	salary numeric
);

CREATE OR REPLACE FUNCTION duplicate()
	RETURNS TRIGGER
	LANGUAGE PLPGSQL 
	AS
	$$
	BEGIN
		INSERT INTO employees_registered(employee_id , department_name , employee_name , salary)
		VALUES (NEW.employee_id , NEW.department_name , NEW.employee_name , NEW.salary);
		RETURN NEW;
	END
	$$;

CREATE TRIGGER insert
AFTER INSERT ON employees
FOR EACH ROW
EXECUTE FUNCTION duplicate();

INSERT INTO employees(employee_id , department_name , employee_name , salary)
VALUES 
	(1 , 'IT' , 'Alex' , 123400),
	(2 , 'Finance' , 'Marie' , 2435467),
	(3 , 'Marketing' , 'Quin' , 325465),
	(4 , 'IT' , 'Redoff' , 56876);

SELECT * FROM employees_registered;

