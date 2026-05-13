USE practice_db;
       -- fetch all columns from yhe student table
SELECT * FROM students;
-- select specific columns (first_name and email)
SELECT first_name,email
FROM students;

-- where clause
-- fetch students enrolled after a specific date
SELECT first_name,last_name,email,enrollment_date
FROM students
WHERE enrollment_date>'2026-05-01';

SELECT * FROM students;

-- logical operators
-- fetch students enrolled in 2026 in specific last_name
SELECT first_name,last_name,enrollment_date
FROM students
WHERE enrollment_date BETWEEN '2026-05-01' AND '2026-05-30' AND last_name='dohn';

-- order by
-- fetch student ordered by enrollment_date in descending order
SELECT first_name,last_name,enrollment_date
FROM students
ORDER BY enrollment_date DESC;

-- LIMIT
-- FETCH five rows
SELECT first_name,last_name
FROM students
LIMIT 2;

-- Aggregation with group by
-- perform calculation on group of rows using aggregate function
-- common aggregate function
  -- SUM() add up values
  -- COUNT() count the number of rows
  -- AVG() calculate the average
  -- MIN() find the minimum values
  -- MAX() find the maximum values
-- count the number of students by enrollment_date
SELECT enrollment_date,COUNT(*) AS total_students
FROM students
GROUP BY enrollment_date;

ALTER TABLE students
ADD marks VARCHAR(3);

ALTER TABLE students
MODIFY marks INT;
SELECT * FROM students;

DELETE FROM students WHERE student_id is NULL; 

UPDATE students
SET marks=CASE
WHEN student_id=2 THEN 35
WHEN student_id=3 THEN 55
WHEN student_id=4 THEN 75
ELSE marks
END
WHERE student_id IN (2,3,4);

-- COUNT THE TOTAL NUMBER OF MARKS
SELECT SUM(marks) AS total_marks
FROM students;
SELECT AVG(marks) AS avg_marks
FROM students;
SELECT MIN(marks) AS min_marks
FROM students;
SELECT MAX(marks) AS max_marks
FROM students;

-- combined aggregation
SELECT
SUM(marks) AS total_marks,
AVG(marks) AS avg_marks,
MIN(marks) AS min_marks,
MAX(marks) AS max_marks
FROM students
GROUP BY student_id;

-- HAVING clause
-- fetch enrollment_date with more than 5 students     
SELECT enrollment_date,COUNT(*) AS total_students
FROM students
GROUP BY enrollment_date
HAVING total_students>0;

CREATE TABLE enrollments( 
	enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
	student_id INT,
	course_id INT,
	FOREIGN KEY (student_id) REFERENCES university_students(student_id),
	FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM enrollments;

INSERT INTO students(student_id,first_name,last_name,email, enrollment_date,marks)
VALUES('1','John','Doe','johndoe@example.com','2026-05-11','85');

INSERT INTO courses(course_id,course_name,credits)
values('101','AI','2'),
('102','ML','3'),
('103','DL','4');

INSERT INTO enrollments(enrollment_id,student_id,course_id)
VALUES(001,1,101),
(002,2,102),
(003,3,103);

-- Inner Join
-- fetch students and their associated course name
SELECT students.first_name,students.last_name,courses.course_name,courses.course_id,students.student_id
FROM students
INNER JOIN enrollments
ON students.student_id=enrollments.student_id
INNER JOIN courses ON enrollments.course_id=courses.course_id;

-- LEFT JOIN
SELECT students.first_name,courses.course_name
FROM students
LEFT JOIN enrollments ON students.student_id=enrollments.student_id
LEFT JOIN courses ON enrollments.course_id=courses.course_id;

-- RIGHT JOIN
SELECT students.student_id,students.first_name
FROM students
RIGHT JOIN enrollments ON students.student_id=enrollments.student_id
RIGHT JOIN courses ON courses.course_id=enrollments.course_id;
