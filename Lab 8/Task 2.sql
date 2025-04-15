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
        RAISE NOTICE 'Name: %, Admission Year: %', rec.name, rec.admission_year;
    END LOOP;
    
    CLOSE patient_cursor;
END;
$$;
