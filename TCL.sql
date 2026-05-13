SELECT * FROM students;

-- starting transaction act as a funcion
START TRANSACTION

-- INSERTING A NEW DATASET
INSERT INTO students(first_name,last_name,email,enrollment_date)
VALUES('Leo','george','leo@example.com','2026-05-12');
SELECT * FROM students;

-- savepoint is used to save as backup
SAVEPOINT before_updates;

UPDATE students
SET email='leonew@example.com'
WHERE student_id=4;

-- undo changes
ROLLBACK TO before_updates;
SELECT * FROM students;

-- permenantly saved changes
COMMIT;

-- SET CONSTRINTS
SET FOREIGN_KEY_CHECKS=0;  -- 0 MEANS DISABLE FOREIGN KEY
DELETE FROM students WHERE student_id=1;
SELECT * FROM students;

SET FOREIGN_KEY_CHECKS=1;  -- 1 MEANS CHECK WITH FOREIGH KEY