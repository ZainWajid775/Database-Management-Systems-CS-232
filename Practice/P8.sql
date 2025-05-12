CREATE TABLE patients
(
	p_no VARCHAR(15) PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	doctor VARCHAR(100) NOT NULL,
	admission_year INTEGER CHECK (admission_year > 0),
	age NUMERIC CHECK (age>=0)
); 


INSERT INTO patients(p_no , name , doctor , admission_year , age)
VALUES
	('978-1982127794', 'George Orwell', 'Dr. Charles', 1999, 78),
	('978-0141187761', 'Harper Lee', 'Dr. Mohini', 2004, 67),
	('978-0061120084', 'Maria Collin', 'Dr. Charles', 2011, 50);

-- Return info on p_no
CREATE OR REPLACE FUNCTION patients_record(p_no_in VARCHAR)
RETURNS TABLE
	(
		name VARCHAR , doctor VARCHAR , admission_year INTEGER , age NUMERIC
	)
LANGUAGE plpgsql
AS $$
BEGIN
	RETURN QUERY
	SELECT p.name , p.doctor , p.admission_year , p.age
	FROM patients p
	WHERE p_no_in = p.p_no;
END $$;


SELECT * FROM patients_record('978-1982127794');

-- Loop over patients and retrive names
DO $$
DECLARE
	rec RECORD;
	patient_cursor
CURSOR FOR 
	SELECT name , admission_year
	FROM patients;
BEGIN 
	OPEN patient_cursor;
	LOOP
		FETCH patient_cursor INTO rec;
		EXIT WHEN NOT FOUND;
		RAISE NOTICE 'Patient : % , Year : %' , rec.name , rec.admission_year;
	END LOOP;
	CLOSE patient_cursor;
END $$;


CREATE OR REPLACE PROCEDURE get_p(p_no_in VARCHAR)
LANGUAGE plpgsql
AS $$
DECLARE
	rec RECORD;
BEGIN
	SELECT p.name , p.admission_year
	FROM patients p
	INTO REC
	WHERE p_no_in = p.p_no;

	RAISE NOTICE 'P : % , %' , rec.name , rec.admission_year;
END $$;

DROP PROCEDURE get_p

CALL get_p('978-1982127794');
