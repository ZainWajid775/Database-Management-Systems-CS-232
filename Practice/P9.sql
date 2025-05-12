DO $$
DECLARE
	count INTEGER;
BEGIN
	SELECT COUNT(*)
	FROM books
	INTO count
	WHERE author = 'Harper Lee';

	RAISE NOTICE 'Books by Harper Lee: %', count;
END $$

DO $$
DECLARE
	name VARCHAR;
BEGIN
	FOR book IN
		SELECT name 
		FROM books
		INTO name
		WHERE publication_year < 1970;
			


