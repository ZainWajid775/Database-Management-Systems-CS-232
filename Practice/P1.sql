CREATE TABLE order_table (
    order_id SERIAL PRIMARY KEY,
    total_amount INT NOT NULL,
    customer_id INT NOT NULL,
    quantity INT NOT NULL,
    order_date DATE NOT NULL
);

INSERT INTO order_table (total_amount, customer_id, quantity, order_date) 
VALUES
(2501, 101, 2, '2025-02-01'),
(1501, 102, 1, '2025-02-02'),
(3200, 103, 3, '2025-02-03'),
(450, 104, 1, '2025-02-04'),
(2751, 105, 2, '2025-02-05'),
(6000, 106, 5, '2025-02-06'),
(1200, 107, 1, '2025-02-07'),
(3500, 108, 3, '2025-02-08'),
(2100, 109, 2, '2025-02-09'),
(5001, 110, 4, '2025-02-10'),
(35000, 111, 7, '2025-02-11');

SELECT customer_id , COUNT(order_id) 
FROM order_table
GROUP BY 1
HAVING COUNT(order_id) > 5;

SELECT customer_id , SUM(total_amount)
FROM order_table
GROUP BY 1
ORDER BY SUM(total_amount) DESC;

ALTER TABLE order_table
ADD COLUMN product_id INT;

UPDATE order_table
SET product_id = 1
WHERE customer_id = 101;

SELECT * FROM order_table

SELECT customer_id , SUM(total_amount)
FROM order_table
GROUP BY 1
HAVING SUM(total_amount) > 1000