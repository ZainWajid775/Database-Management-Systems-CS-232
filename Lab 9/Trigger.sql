CREATE OR REPLACE FUNCTION log_last_name_changes()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS
$$
BEGIN
IF NEW.last_name <> OLD.last_name THEN
INSERT INTO
employee_audits(employee_id,last_name,changed_on)
VALUES(OLD.id,OLD.last_name,now());
END IF;
RETURN NEW;
END;
$$

CREATE TRIGGER last_name_changes
BEFORE UPDATE
ON employees
FOR EACH ROW
EXECUTE PROCEDURE log_last_name_changes();

INSERT INTO employees (first_name, last_name)
VALUES 
	('John', 'Doe');
INSERT INTO employees (first_name, last_name)
VALUES 
	('Lily', 'Bush');

UPDATE employees
SET last_name = 'Brown'
WHERE ID =2; 

SELECT * FROM employee_audits;