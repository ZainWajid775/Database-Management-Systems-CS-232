CREATE TABLE Customers
(
	customer_id INT PRIMARY KEY,
	customer_name VARCHAR,
	email VARCHAR,
	phone_number INT
);

INSERT INTO Customers(customer_id , customer_name , email , phone_number) 
VALUES
	(1 , 'Alice' , 'alice@example.com' , 123456789),
	(2 , 'Bob' , 'bob@example.com' , 987654321),
	(3 , 'Charlie' , 'charlie@example' , NULL);

CREATE TABLE Products
(
	product_id INT PRIMARY KEY,
	product_name VARCHAR,
	price INT,
	stock_quantity INT
);

INSERT INTO Products(product_id , product_name , price , stock_quantity)
VALUES 
	(10 , 'Laptop' , 1000 , 10),
	(11 , 'Phone' , 600 , 20),
	(12 , 'Tablet' , 300 , 15);

CREATE TABLE Orders
(
	order_id INT PRIMARY KEY,
	customer_id INT,
	FOREIGN KEY(customer_id) REFERENCES Customers(customer_id),
	product_id INT,
	FOREIGN KEY(product_id) REFERENCES Products(product_id),
	order_date DATE,
	quantity INT,
	total_price INT
);

INSERT INTO Orders(order_id , customer_id , product_id , order_date , quantity , total_price)
VALUES 
	(20 , 1 , 10 , '2025-03-01' , 10 , 10000),
	(21 , 2 , 11 , '2025-03-02' , 2 , 1200),
	(22 , 2 , 12 , '2025-03-03' , 5 , 1500);


SELECT o.order_id , c.customer_name , p.product_name , o.order_date , o.quantity , o.total_price
FROM orders o
INNER JOIN customers c
ON o.customer_id = c.customer_id
INNER JOIN products p
ON o.product_id = p.product_id;

SELECT c.customer_id , c.customer_name , c.email
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL;

SELECT c.customer_id , c.customer_name , o.order_id , o.order_date
FROM customers c
FULL OUTER JOIN orders o
ON c.customer_id = o.customer_id;

SELECT p.product_name , c.customer_name
FROM products p
CROSS JOIN customers c;



