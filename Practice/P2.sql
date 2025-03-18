CREATE TABLE category
(
	category_id INT PRIMARY KEY,
	name VARCHAR(255)
);

CREATE TABLE product
(
	product_id INT PRIMARY KEY,
	name VARCHAR(255),
	category_id INT,
	price INT,
	quantity_in_stock INT,
	FOREIGN KEY(category_id) REFERENCES category(category_id)
);

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

INSERT INTO product(product_id , name , category_id , price , quantity_in_stock) VALUES
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


UPDATE product
SET price = 10000
WHERE product_id = 3;

ALTER TABLE product
ALTER COLUMN price
SET NOT NULL;

ALTER TABLE product
ADD CONSTRAINT u UNIQUE(product_id , name);

ALTER TABLE product
ADD CONSTRAINT v CHECK(price > 0);

DELETE FROM product
WHERE quantity_in_stock < 1;

SELECT * 
FROM product
FULL OUTER JOIN category
ON category.category_id = product.product_id;

SELECT category_id , COUNT(*)
FROM product
GROUP BY 1;

ALTER TABLE category
ADD CONSTRAINT x UNIQUE(name);

ALTER TABLE product
DROP CONSTRAINT v;

ALTER TABLE product
DROP CONSTRAINT product_category_id_fkey;
