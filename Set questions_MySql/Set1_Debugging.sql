CREATE DATABASE Debugging_set1;
USE Debugging_set1;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);

-- Insert Sample Data
INSERT INTO customers (customer_id, customer_name) 
VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Alice Johnson'),
(104, NULL),
(105, 'Robert Brown');


-- Create the sales table
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    amount DECIMAL(10,2),
    sale_date DATE
);

-- Insert sample data
INSERT INTO sales (sale_id, customer_id, amount, sale_date) 
VALUES
(1, 101, 4500.00, '2023-03-15'),
(2, 102, 5500.00, '2023-03-16'),
(3, 103, 7000.00, '2023-03-17'),
(4, 104, 3000.00, '2023-03-18'),
(5, 105, 6000.00, '2023-03-19');


CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

INSERT INTO departments (department_id, department_name) 
VALUES
(101, 'HR'),
(102, 'Finance'),
(103, 'IT'),
(104, 'Marketing');

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    order_date DATE,
    order_amount INT
);

INSERT INTO orders (order_id, customer_name, order_date, order_amount)
VALUES
(1, 'John', '2023-05-01', 500),
(2, 'Emily', '2023-05-02', 700),
(3, 'Michael', '2023-05-03', 1200),
(4, 'Sara', '2023-05-04', 450),
(5, 'David', '2023-05-05', 900);

-- 1.Incorrect_Syntax Error Identification
SELECT name age FROM employees WHERE salary >= 50000;
-- correct_ Added comma to separate column names
SELECT customer_name, order_date 
FROM orders 
WHERE order_amount >= 500;

-- 2.Incorrect_Logical Error Detection
SELECT * FROM orders 
WHERE order_date = '2023-05-01' AND order_date = '2023-05-02';
-- correct_Using OR to check for multiple dates
SELECT * FROM orders 
WHERE order_date = '2023-05-01' OR order_date = '2023-05-02';

-- 3.Incorrect: Selecting all columns without optimization
SELECT * FROM sales WHERE amount > 5000;
-- Correct: Create index and select only required columns
CREATE INDEX idx_amount ON sales(amount);
DROP INDEX idx_amount ON sales;
SELECT amount, customer_id FROM sales WHERE amount > 5000;

-- 4.Incorrect: Comparing numeric data with a string
SELECT * FROM products WHERE price = '100';
-- Correct: Use numeric value without quotes
SELECT * FROM orders WHERE order_amount=500;

-- 5.Incorrect: Using the wrong column for join
SELECT e.name, d.department_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_name;
-- Correct: Joining using the proper primary and foreign keys
SELECT e.name, d.department_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id;

-- 6.Incorrect: Using != NULL instead of IS NOT NULL
SELECT * FROM customers WHERE customer_name != NULL;
-- Correct: Properly checking for non-null values
SELECT * FROM customers WHERE customer_name IS NOT NULL;

-- 7.Incorrect: Using SUM without GROUP BY for non-aggregated columns
SELECT customer_id, SUM(amount)
FROM sales;
-- Correct: Using GROUP BY for accurate aggregation
SELECT customer_id,SUM(amount)AS total_amounts
FROM sales
GROUP BY customer_id;

-- Incorrect: Selecting a non-existent column
SELECT order_id, customer_address
FROM orders;

-- Correct: Select existing columns only
SELECT order_id, customer_name
FROM orders;

