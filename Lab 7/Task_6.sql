DO $$
<<Task_6>>
DECLARE 
	num INTEGER := 0;
BEGIN 
	WHILE num < 30 LOOP
	num := num + 3;
	RAISE NOTICE 'Value : %' , num;
	END LOOP;

END Task_6 $$