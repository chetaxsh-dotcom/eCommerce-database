create database ecommerce;

use ecommerce;


CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT,   
    name VARCHAR(50),                    
    email VARCHAR(100),                  
    address VARCHAR(200)                 
);


CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,   
    name VARCHAR(50),                    
    price DECIMAL(10,2),                  
    description VARCHAR(200)              
);


CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,   
    customer_id INT,                      
    order_date DATE,                       
    total_amount DECIMAL(10,2),            
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);


INSERT INTO customers (name, email, address) VALUES
('Amit Sharma', 'amit@gmail.com', 'Delhi'),
('Riya Verma', 'riya@gmail.com', 'Mumbai'),
('Rahul Singh', 'rahul@gmail.com', 'Pune'),
('Vandana sharma','vandana@gmail.com','Gurugram');

select * from customers;


INSERT INTO products (name, price, description) VALUES
('Smart watch', 2000, 'Basic product'),
('Eardopes', 3000, 'Medium range product'),
('laptop', 45000, 'Affordable product'),
('Iphone', 79000, 'Premium product');

select * from products;


INSERT INTO orders (customer_id, order_date, total_amount) VALUES
(1, CURDATE() - INTERVAL 10 DAY, 2999),
(2, CURDATE() - INTERVAL 5 DAY, 4000),
(3, CURDATE() - INTERVAL 35 DAY, 55499),
(4, CURDATE() - INTERVAL 50 DAY, 87499);

select * from orders;

SELECT DISTINCT c.*
FROM customers c
JOIN orders o ON c.id = o.customer_id
WHERE o.order_date >= CURDATE() - INTERVAL 30 DAY;

 
 
SELECT c.name, SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o ON c.id = o.customer_id
GROUP BY c.name;


UPDATE products
SET price = 45000.00
WHERE name = 'laptop';

select * from products;


ALTER TABLE products
ADD discount DECIMAL(5,2);


SELECT *
FROM products
ORDER BY price DESC
LIMIT 3;

CREATE TABLE order_items (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

	select * from order_items;
    
    
INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 2),  
(1, 2, 1),
(2, 1, 1),   
(3, 3, 1);



SELECT DISTINCT c.name
FROM customers c
JOIN orders o ON c.id = o.customer_id
JOIN order_items oi ON o.id = oi.order_id
JOIN products p ON oi.product_id = p.id
WHERE p.name = 'Smart watch';



SELECT c.name, o.order_date
FROM customers c
JOIN orders o ON c.id = o.customer_id;


SELECT *
FROM orders
WHERE total_amount > 15000.00;


SELECT AVG(total_amount) AS average_order_value
FROM orders;

SHOW VARIABLES LIKE 'secure_file_priv';




use ecommerce;
select * from ecommerce;



