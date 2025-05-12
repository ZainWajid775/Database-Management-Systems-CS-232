CREATE TABLE books
(
	isbn VARCHAR(13) PRIMARY KEY,
	title VARCHAR(100) NOT NULL,
	author VARCHAR(100) NOT NULL,
	publication_year INTEGER CHECK (publication_year > 0),
	price NUMERIC CHECK (price >= 0)
);

INSERT INTO books(isbn,title,author,publication_year,price)
VALUES
	('9781982127794','1984','George Orwell',1949,9.99),
	('9780141187761','To kill a mockingbird','Harper Lee',1960,12.50),
	('9780061120084','To kill a mockingbird','Harper Lee',1960,5.00);

-- Books by harper Lee
DO $$
DECLARE
	b_count INTEGER := 0;
BEGIN
	SELECT COUNT(*)
	FROM books
	INTO b_count
	WHERE author = 'Harper Lee';

	RAISE NOTICE 'Books : %' , b_count;
END $$;

-- Books before 1970
DO $$
DECLARE
	names VARCHAR;
BEGIN
	FOR names IN 
		SELECT title
		FROM books 
		WHERE publication_year < 1970
	LOOP
		RAISE NOTICE 'Book : %' , names;
	END LOOP;
END $$;

-- Retrive info about id
DO $$
DECLARE
	info books%rowtype;
BEGIN
	SELECT * 
	FROM books
	INTO info
	WHERE isbn = '97801187761';

	IF FOUND THEN
		RAISE NOTICE 'Books : %' , info;
	ELSE
		RAISE NOTICE 'Book not found';
	END IF;
END $$;

--	Price status using case
DO $$
DECLARE 
	p books.price%type;
	status VARCHAR;
BEGIN
	FOR p IN 
		SELECT price
		FROM books
	LOOP
		CASE 
			WHEN p > 0 AND p < 3.99 THEN 
			status = 'Average';
			WHEN p > 4 AND p < 7.99 THEN
			status = 'Fine';
			WHEN p > 8 AND p < 10.99 THEN
			status = 'Expensive';
			WHEN p > 11 THEN 
			status = 'Very Expensive';
		END CASE;

		RAISE NOTICE 'Category : %' , status;
	END LOOP;
END $$;

-- 3 Table
DO $$
DECLARE 
	value NUMERIC :=0;
BEGIN
	WHILE value < 30 LOOP
	value := value + 3;
	RAISE NOTICE '%' , value;
	END LOOP;
END $$;





