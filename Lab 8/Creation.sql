CREATE TABLE patients
(
	p_no VARCHAR(15) PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	doctor VARCHAR(100) NOT NULL,
	admission_year INTEGER CHECK (admission_year > 0),
	age NUMERIC CHECK (age>=0)
); 


INSERT INTO patients(p_no , name , doctor , admission_year , age)
VALUES
	('978-1982127794', 'George Orwell', 'Dr. Charles', 1999, 78),
	('978-0141187761', 'Harper Lee', 'Dr. Mohini', 2004, 67),
	('978-0061120084', 'Maria Collin', 'Dr. Charles', 2011, 50);