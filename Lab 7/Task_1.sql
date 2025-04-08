DO $$
<<Task_1>>
DECLARE
	b_count_harper_lee INTEGER :=0;
BEGIN
	SELECT COUNT(*) 
	INTO b_count_harper_lee
	FROM book
	WHERE author = 'Harper Lee';

	RAISE NOTICE 'Books by Harper Lee : %' , b_count_harper_lee;
END Task_1 $$