DO $$
<<Task_3>>
DECLARE 
	book_price NUMERIC;
BEGIN
	SELECT price
	into book_price
	FROM book
	WHERE isbn = '978-0141187761'; 

	RAISE NOTICE 'Book : %' , book_price;
END Task_3 $$;
	