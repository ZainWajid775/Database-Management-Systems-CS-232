CREATE PROCEDURE get_patient_by_id(p_no_input VARCHAR)
LANGUAGE plpgsql
AS 
$$
DECLARE
    rec RECORD;
BEGIN
    SELECT * 
	INTO rec
    FROM patients
    WHERE p_no = p_no_input;

    IF FOUND THEN
        RAISE NOTICE 'Patient ID: %, Name: %, Doctor: %, Year: %, Age: %',
            rec.p_no, rec.name, rec.doctor, rec.admission_year, rec.age;
    ELSE
        RAISE NOTICE 'Patient with ID % not found.', p_no_input;
    END IF;
END;
$$;

CALL get_patient_by_id('978-0141187761');
