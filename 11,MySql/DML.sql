USE practice_db;
CREATE TABLE students(
	student_id INT AUTO_INCREMENT PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50),
	email VARCHAR(100) UNIQUE,
	enrollment_id TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

SELECT * FROM students;

ALTER TABLE students
RENAME COLUMN enrollment_id TO enrollment_date;

SELECT * FROM students;

-- inserting single row

INSERT INTO students(first_name,last_name,email,enrollment_date)
VALUES('John','Brown','john@example.com','2026-05-07');

SET SQL_SAFE_UPDATES=0  -- FOR INSERTING AND UPDATING MULTIPLE ROWS

-- inserting multiple rows
INSERT INTO students(first_name,last_name,email,enrollment_date)
VALUES('Bob','char','bob@example.com','2026-05-09'),
      ('Joe','smith','joe@example.com','2026-05-13');

SELECT * FROM students;

-- updating single row
UPDATE students
SET email='johnnew@example.com'
WHERE student_id=1;

-- updating multiple rows
UPDATE  students
SET email='joex@example.com', last_name='dohn'
WHERE last_name='smith';
SELECT * FROM students;

-- update all rows
UPDATE students
SET enrollment_date='2026-05-07';
SELECT * FROM students;

CREATE TABLE archived_students(
	student_id INT AUTO_INCREMENT PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50),
	email VARCHAR(100) UNIQUE,
	enrollment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO archived_students(first_name,last_name,email,enrollment_date)
SELECT first_name,last_name,email,enrollment_date
FROM students
WHERE enrollment_date='2026-05-07';
SELECT * FROM students;

SELECT * FROM archived_students;
