DO $$
<<Task_5>>
DECLARE 
	book_info book.price%type;
	description VARCHAR (100);
BEGIN
	SELECT price
	into book_info
	FROM book;

	IF FOUND THEN
		CASE 
		WHEN book_info> 0 AND book_info < 3.99 THEN
		description = 'Average';
		WHEN book_info > 4 AND book_info < 7.99 THEN
		description = 'Fine';
		WHEN book_info > 8 AND book_info < 10.99 THEN
		description = 'Expensive';
		WHEN book_info > 11 AND book_info < 14.99 THEN
		description = 'Very Expensive';
		ELSE
		description = 'Unspecified';
		END CASE;
		END IF;
		
		
	RAISE NOTICE 'Book : %' , description;
END Task_5 $$;
	