--Cross join to view all order customer combinations
SELECT Customers.customer_name , Products.product_name
FROM Customers
CROSS JOIN Products;
