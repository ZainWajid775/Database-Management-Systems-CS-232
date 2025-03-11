-- View customers without orders
SELECT Customers.customer_id , Customers.customer_name , Customers.email
FROM Customers
LEFT JOIN Orders
ON Customers.customer_id = Orders.customer_id
WHERE order_id IS NULL;

