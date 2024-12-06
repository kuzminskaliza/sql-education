BEGIN;
INSERT INTO students (first_name, last_name, age, course, gender)
VALUES ('Mark', 'Smith', 21, 3, 'male');
INSERT INTO schedule (student_id, subject_id, grade)
VALUES (101, 2, 75);
COMMIT;


BEGIN;
INSERT INTO subjects (subject_name, teacher_first_name, teacher_last_name)
VALUES ('Philosophy', 'Eleanor', 'White');
INSERT INTO schedule (student_id, subject_id, grade)
VALUES (1, 11, 72);
COMMIT;


BEGIN;
UPDATE students
SET course = 4
WHERE id = 3;
INSERT INTO schedule (student_id, subject_id, grade)
VALUES (3, 5, 78);
COMMIT;


BEGIN;
DELETE
FROM schedule
WHERE student_id = 4
  AND subject_id = 5;
INSERT INTO schedule (student_id, subject_id, grade)
VALUES (4, 8, 88);
COMMIT;


BEGIN;
UPDATE subjects
SET teacher_first_name = 'Michael',
    teacher_last_name  = 'Brown'
WHERE subject_name = 'Computer Science';
INSERT INTO subjects (subject_name, teacher_first_name, teacher_last_name)
VALUES ('Astronomy', 'Catherine', 'Smith');
COMMIT;


BEGIN;
UPDATE schedule
SET grade = grade * 0.9
WHERE grade > 90;
INSERT INTO subjects (subject_name, teacher_first_name, teacher_last_name)
VALUES ('Grading Adjustment', 'System', 'Update');
COMMIT;



