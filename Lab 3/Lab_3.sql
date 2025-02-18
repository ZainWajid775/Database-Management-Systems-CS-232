--Table Creation
CREATE TABLE order_table
	(
		order_id serial PRIMARY KEY,
		total_amount INT NOT NULL,
		customer_id INT NOT NULL,
		quantity INT NOT NULL,
		order_date DATE NOT NULL,
		product_id INT NOT NULL
	);

--Value insertion
INSERT INTO order_table(order_id , total_amount , customer_id , quantity , order_date , product_id) VALUES
(1,100,775,10,'1-1-2025',100),
(2,200,775,11,'1-2-2025',101),
(3,300,775,12,'1-3-2025',102),
(4,400,775,13,'1-4-2025',103),
(5,500,775,14,'1-5-2025',104),
(6,600,775,15,'1-6-2025',105),
(7,700,775,16,'1-7-2025',106),
(8,2000,123,30,'1-10-2025',107),
(9,1500,456,19,'1-12-2025',108),
(10,1500,456,2,'1-12-2025',109),
(11,5000,789,23,'1-14-2025',110),
(12,10,442,2,'1-17-2025',111);


--1. Identify customers who have placed more than 5 orders and list them along with the total number of orders placed
SELECT 
	customer_id,
	COUNT(*) AS orders
FROM order_table
GROUP BY customer_id
HAVING COUNT(*) > 5;

--2. Find the total amount spent by each customer and list them in descending order of total spending
SELECT 
	customer_id,
	SUM(total_amount)
FROM order_table
GROUP BY 1
ORDER BY 2 DESC;

--3. Identify products with an average order quantity greater than 10 and list them along with their average order quantity
SELECT 
    product_id,
    ROUND(AVG(quantity) , 2) AS avg_order_quantity
FROM order_table
GROUP BY product_id
HAVING AVG(quantity) > 10;

--4. Identify customers who have placed orders with a total amount greater than $1000 and list them along with their total spending
SELECT 
	customer_id,
	total_amount
FROM order_table
GROUP BY 1 , 2 
HAVING total_amount > 1000;


