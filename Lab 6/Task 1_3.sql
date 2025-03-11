-- View all orders and customers in database
SELECT Customers.customer_id , Customers.customer_name , Orders.order_id , Orders.order_date
FROM Customers
FULL OUTER JOIN Orders
ON Customers.customer_id = Orders.customer_id;

