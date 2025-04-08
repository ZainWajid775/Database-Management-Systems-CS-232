CREATE TABLE book
(	
	isbn VARCHAR(15) PRIMARY KEY,
	title VARCHAR(100) NOT NULL,
	author VARCHAR(100) NOT NULL,
	publication_year INTEGER CHECK(publication_year > 0),
	price NUMERIC CHECK(price >= 0)
);


INSERT INTO book(isbn , title , author , publication_year , price) VALUES
('978-1982127794', '1984', 'George Orwell', 1949, 9.99),
('978-0141187761', 'To Kill a Mockingbird', 'Harper Lee', 1960, 12.50),
('978-0061120084', 'To Kill a Mockingbird', 'Harper Lee', 1960, 5.00);
