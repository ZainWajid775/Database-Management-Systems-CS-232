-- View which customer ordered whihc product
SELECT order_id , order_date , quantity , total_price , Customers.customer_name , Products.product_name
FROM Orders
INNER JOIN Customers
ON Orders.customer_id = Customers.customer_id
INNER JOIN Products
ON Products.product_id = Orders.product_id;

