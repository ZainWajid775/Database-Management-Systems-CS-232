DO $$
<<Task_2>>
DECLARE 
	books_1970 VARCHAR;
BEGIN
	SELECT title
	into books_1970
	FROM book
	WHERE publication_year < 1970;

	RAISE NOTICE 'Book : %' , books_1970;
END task_2 $$;
	