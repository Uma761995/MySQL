-- DDL
-- creating the database
CREATE DATABASE practice_db;
-- switch to the new database
USE practice_db;
SHOW DATABASES;
-- creating the table
CREATE TABLE students(
	student_id INT AUTO_INCREMENT PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50),
	email VARCHAR(100) UNIQUE,
	enrollment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

SELECT * FROM students;
-- 3.Altering tables
ALTER TABLE students
ADD phone_number VARCHAR(15);

-- 4.modifying the last_name to be not null
ALTER TABLE students
MODIFY last_name VARCHAR(50) NOT NULL;

-- 6.creating the table with constraint
CREATE TABLE courses(
	course_id INT AUTO_INCREMENT PRIMARY KEY,
	course_name VARCHAR(100) NOT NULL UNIQUE,
	credits INT CHECK(credits BETWEEN 1 AND 5)
);

-- 7. creating the table using foreign key
CREATE TABLE enrollments( 
	enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
	student_id INT,
	course_id INT,
	FOREIGN KEY (student_id) REFERENCES students(student_id),
	FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- 8.remove all rows from the student table
TRUNCATE TABLE students;

-- 9.to delete single column

ALTER TABLE students
DROP COLUMN phone_number;

SELECT * FROM students;

-- 5.renaming tablename students into university_students
ALTER TABLE students
RENAME TO university_students;

-- 6.dropping tables
DROP TABLE university_students;
