--Flights Table
CREATE TABLE flights
(
	flno INT PRIMARY KEY,
	from_loc VARCHAR(50) NOT NULL,
	to_loc VARCHAR(50) NOT NULL,
	distance INT NOT NULL,
	price INT NOT NULL
);

INSERT INTO flights(flno , from_loc , to_loc , distance , price) 
VALUES
	(222 , 'Perth' , 'London' , 9000 , 50000),
	(333 , 'Auckland' , 'Dubai' , 7000 , 40000),
	(444 , 'Dallas' , 'Sydney' , 10000 , 52000),
	(555 , 'LA' , 'Singapore' , 11000 , 55000),
	(666 , 'UK' , 'Atlanta' , 15000 , 60000);



--Aircrafs Table
CREATE TABLE aircraft
(
	aid INT PRIMARY KEY,
	aname VARCHAR(50) NOT NULL,
	cruising_range INT NOT NULL
); 

INSERT INTO aircraft(aid , aname, cruising_range) 
VALUES
	(111 , 'AD Scout' , 1000),
	(112 , 'Airco' , 15000),
	(113 , 'Avis' , 9000),
	(114 , 'Bernard' , 8000),
	(115 , 'Comte' , 20000);



--Employees Table
CREATE TABLE employee
(
	eid INT PRIMARY KEY,
	ename VARCHAR(50) NOT NULL,
	salary INT NOT NULL
)

INSERT INTO employee(eid , ename , salary)
VALUES
	(100 , 'Oliver' , 85000),
	(101 , 'Jack' , 50000),
	(102 , 'Thomas' , 89000),
	(103 , 'George' , 10000),
	(105 , 'James' , 90000),
	(106 , 'Daniel' , 100000),
	(107 , 'Noah' , 50000),
	(108 , 'Joe' , 25000),
	(109 , 'Pheebs' , 90000),
	(110 , 'Ross' , 5000);



--Certified Table
CREATE TABLE certified
(
	eid INT,
	FOREIGN KEY(eid) REFERENCES employee(eid),
	aid INT,
	FOREIGN KEY(aid) REFERENCES aircraft(aid) 
);

INSERT INTO certified(eid , aid) 
VALUES
	(100 , 114),
	(102 , 113),
	(105 , 112),
	(106 , 115),
	(107 , 111),
	(109 , 112);

	
	
