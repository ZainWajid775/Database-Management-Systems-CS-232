--Table Creation
CREATE TABLE category
(
	category_id SERIAL PRIMARY KEY,
	name VARCHAR(50)
)

CREATE TABLE products
(
	product_id INT PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	category_id INT,
	price INT NOT NULL,
	quantity_in_stock INT NOT NULL,
	FOREIGN KEY(category_id) REFERENCES category(category_id)
)


--Insert values
INSERT INTO category(category_id , name) VALUES
(1 , 'Food'),
(2 , 'Electronics'),
(3 , 'Healthcare'),
(4 , 'Toys'),
(5 , 'Cars'),
(6 , 'Books'),
(7 , 'Household'),
(8 , 'Cleaning'),
(9 , 'Tools'),
(10 , 'Clothes');

INSERT INTO products(product_id , name , category_id , price , quantity_in_stock) VALUES
(1, 'Soap', 8, 250, 100),
(2, 'Battery', 2, 250, 100),
(3, 'Chocolate', 1, 250, 100),
(4, 'Oil', 1, 250, 100),
(5, 'Bread', 3, 250, 100),
(6, 'Chicken', 4, 250, 100),
(7, 'Mutton', 5, 250, 100),
(8, 'Bread', 6, 250, 100),
(9, 'Chicken', 7, 250, 100),
(10, 'Mutton', 1, 250, 100);

--2. Alter the table and update the value of product price where product_id is 3.
UPDATE products
SET price = 90
WHERE product_id = 3;

--3. Alter the table and add Not Null constraint on price column.
ALTER TABLE products
ALTER COLUMN price SET NOT NULL

--4. Alter the table and enforce unique constraint on product_id and name.
ALTER TABLE products
ADD CONSTRAINT unique_product UNIQUE(product_id , name);

--5. Add a check constraint to ensure that the price of the product is greater than 0.
ALTER TABLE products
ADD CONSTRAINT price CHECK(price > 0);

--6. Alter the table and delete all products whose quantity_in_stock is less than or equal to 0.
DELETE FROM products
WHERE quantity_in_stock <= 0;

--7. Retrieve the data from both the tables together using join. 
SELECT 
    products.product_id,
    products.name AS product_name,
    products.price,
    products.quantity_in_stock,
    category.category_id,
    category.name AS category_name
FROM products
JOIN category ON products.category_id = category.category_id;

--8. Count the number of products in each category.
SELECT  
	category_id,
	COUNT(*) AS product_count
FROM products
GROUP BY category_id;

--9. Add a unique constraint to category name to ensure that categories are not repeated.
ALTER TABLE category
ADD CONSTRAINT no_repeat UNIQUE(name);

--10. Drop NOT NULL constraint applied on price column.
ALTER TABLE products
ALTER COLUMN price DROP NOT NULL;

--11. Drop foreign key constraint applied on category_id.
ALTER TABLE products
DROP CONSTRAINT products_category_id_fkey;


 
