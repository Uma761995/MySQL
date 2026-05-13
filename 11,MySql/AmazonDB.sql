CREATE DATABASE AmazonDB;
USE AmazonDB;
SHOW DATABASES;
CREATE TABLE users(
	user_id INT AUTO_INCREMENT PRIMARY KEY,
	user_name VARCHAR(100) NOT NULL,
	email VARCHAR(150) UNIQUE NOT NULL,
	registered_date DATE NOT NULL,
	membership ENUM('Basic','Prime') DEFAULT 'Basic'
); 
SELECT * FROM users;

CREATE TABLE products(
	product_id INT PRIMARY KEY AUTO_INCREMENT,
	product_name VARCHAR(200) NOT NULL,
	price DECIMAL(10, 2) NOT NULL,
	category VARCHAR(100) NOT NULL,
	stock INT NOT NULL
);

CREATE TABLE Orders(
order_id INT PRIMARY KEY AUTO_INCREMENT,
user_id INT,
order_date DATE NOT NULL,
total_amount DECIMAL(10, 2) NOT NULL,
FOREIGN KEY(order_id) REFERENCES users(user_id)
);

CREATE TABLE orderdetails(
order_details_id INT AUTO_INCREMENT PRIMARY KEY,
order_id INT, 
product_id INT, 
quantity INT NOT NULL,
FOREIGN KEY(order_id) REFERENCES orders(order_id),
FOREIGN KEY(product_id) REFERENCES products(product_id)
);

-- Data insertion_users
INSERT INTO users(user_name, email, registered_date, membership) 
VALUES
('Alice Johnson', 'alice.j@example.com', '2024-01-15', 'Prime'),
('Bob Smith', 'bob.s@example.com', '2024-02-01', 'Basic'),
('Charlie Brown', 'charlie.b@example.com', '2024-03-10', 'Prime'),
('Daisy Ridley', 'daisy.r@example.com', '2024-04-12', 'Basic');

-- Data insertion_products
INSERT INTO Products (product_name, price, category, stock)
VALUES
('Echo Dot', 49.99, 'Electronics', 120),
('Kindle Paperwhite', 129.99, 'Books', 50),
('Fire Stick', 39.99, 'Electronics', 80),
('Yoga Mat', 19.99, 'Fitness', 200),
('Wireless Mouse', 24.99, 'Electronics', 150);

-- Data insertion_orders
INSERT INTO Orders(user_id, order_date, total_amount) 
VALUES
(1, '2024-05-01', 79.98),
(2, '2024-05-03', 129.99),
(1, '2024-05-04', 49.99),
(3, '2024-05-05', 24.99);

-- Data insertion_orderdetails
INSERT INTO orderdetails(order_id, product_id, quantity) 
VALUES
(1, 1, 2),
(2, 2, 1),
(3, 1, 1),
(4, 5, 1);

SELECT * FROM Orders;
SELECT * FROM orderdetails;
SELECT * FROM products;
SELECT * FROM users;

SHOW DATABASES;