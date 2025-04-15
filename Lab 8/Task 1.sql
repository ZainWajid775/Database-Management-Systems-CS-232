CREATE OR REPLACE FUNCTION patients_record(p_no_in VARCHAR)
RETURNS TABLE
(
	p_no VARCHAR,
	name VARCHAR,
	doctor VARCHAR,
	admission_year INTEGER,
	age NUMERIC
)
LANGUAGE plpgsql
AS 
$$
BEGIN	
	RETURN query
	SELECT p.p_no , p.name , p.doctor , p.admission_year , p.age
	FROM patients p
	WHERE p_no_in = p.p_no;
END;
$$;

SELECT * FROM patients_record('978-0061120084');
