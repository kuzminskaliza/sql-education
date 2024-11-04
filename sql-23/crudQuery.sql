CREATE TYPE gender_enum AS ENUM ('male', 'female');

CREATE TABLE students
(
    id         SERIAL PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name  VARCHAR(255) NOT NULL,
    age        INTEGER      NOT NULL,
    course     INTEGER      NOT NULL,
    gender     gender_enum  NOT NULL,
    created_at timestamp(0) default CURRENT_TIMESTAMP,
    updated_at timestamp(0) default NULL::timestamp without time zone
);

CREATE TABLE subjects
(
    id                 SERIAL PRIMARY KEY,
    subject_name       VARCHAR(255) NOT NULL,
    teacher_first_name VARCHAR(255) NOT NULL,
    teacher_last_name  VARCHAR(255) NOT NULL,
    created_at         timestamp(0) default CURRENT_TIMESTAMP,
    updated_at         timestamp(0) default NULL::timestamp without time zone
);

CREATE TABLE schedule
(
    id         SERIAL PRIMARY KEY,
    student_id INTEGER NOT NULL,
    subject_id INTEGER NOT NULL,
    grade      SMALLINT,
    created_at timestamp(0) default CURRENT_TIMESTAMP,
    updated_at timestamp(0) default NULL::timestamp without time zone
);

INSERT INTO students (first_name, last_name, age, course, gender)
VALUES ('Alex', 'Johnson', 20, 2, 'male'),
       ('Emily', 'Davis', 19, 1, 'female'),
       ('Michael', 'Smith', 21, 3, 'male'),
       ('Sophia', 'Brown', 20, 2, 'female'),
       ('Chris', 'Wilson', 22, 4, 'male'),
       ('Grace', 'Green', 18, 1, 'female'),
       ('James', 'Taylor', 21, 3, 'male'),
       ('Olivia', 'Thomas', 19, 1, 'female'),
       ('Daniel', 'Anderson', 20, 2, 'male'),
       ('Emma', 'Martinez', 21, 3, 'female'),
       ('John', 'Lee', 22, 4, 'male'),
       ('Mia', 'Clark', 18, 1, 'female'),
       ('William', 'Walker', 20, 2, 'male'),
       ('Ava', 'Hall', 19, 1, 'female'),
       ('Ethan', 'Young', 21, 3, 'male'),
       ('Isabella', 'Allen', 20, 2, 'female'),
       ('Lucas', 'King', 22, 4, 'male'),
       ('Sophia', 'Wright', 18, 1, 'female'),
       ('Matthew', 'Scott', 21, 3, 'male'),
       ('Charlotte', 'Torres', 19, 1, 'female'),
       ('Henry', 'Nguyen', 22, 4, 'male'),
       ('Amelia', 'Hill', 20, 2, 'female'),
       ('Alexander', 'Flores', 21, 3, 'male'),
       ('Evelyn', 'Nelson', 18, 1, 'female'),
       ('Jack', 'Carter', 19, 1, 'male'),
       ('Abigail', 'Mitchell', 20, 2, 'female'),
       ('Sebastian', 'Perez', 21, 3, 'male'),
       ('Harper', 'Roberts', 18, 1, 'female'),
       ('Benjamin', 'Turner', 22, 4, 'male'),
       ('Ella', 'Phillips', 19, 1, 'female'),
       ('Samuel', 'Campbell', 21, 3, 'male'),
       ('Lily', 'Parker', 20, 2, 'female'),
       ('David', 'Evans', 22, 4, 'male'),
       ('Zoey', 'Edwards', 19, 1, 'female'),
       ('Andrew', 'Collins', 20, 2, 'male'),
       ('Lillian', 'Stewart', 21, 3, 'female'),
       ('Joshua', 'Sanchez', 18, 1, 'male'),
       ('Natalie', 'Morris', 19, 1, 'female'),
       ('Logan', 'Rogers', 20, 2, 'male'),
       ('Hannah', 'Reed', 21, 3, 'female'),
       ('Mason', 'Cook', 22, 4, 'male'),
       ('Aubrey', 'Morgan', 18, 1, 'female'),
       ('Caleb', 'Bell', 19, 1, 'male'),
       ('Victoria', 'Murphy', 21, 3, 'female'),
       ('Nathan', 'Bailey', 20, 2, 'male'),
       ('Samantha', 'Rivera', 22, 4, 'female'),
       ('Ryan', 'Cooper', 18, 1, 'male'),
       ('Leah', 'Richardson', 19, 1, 'female'),
       ('Isaac', 'Cox', 20, 2, 'male'),
       ('Maya', 'Howard', 21, 3, 'female'),
       ('Adam', 'Ward', 22, 4, 'male'),
       ('Ellie', 'Peterson', 18, 1, 'female'),
       ('Jonathan', 'Gray', 21, 3, 'male'),
       ('Scarlett', 'Ramirez', 19, 1, 'female'),
       ('Aaron', 'James', 20, 2, 'male'),
       ('Stella', 'Watson', 22, 4, 'female'),
       ('Connor', 'Brooks', 18, 1, 'male'),
       ('Lucy', 'Kelly', 19, 1, 'female'),
       ('Cameron', 'Sanders', 20, 2, 'male'),
       ('Bella', 'Price', 21, 3, 'female'),
       ('Brandon', 'Bennett', 22, 4, 'male'),
       ('Zoe', 'Wood', 18, 1, 'female'),
       ('Dylan', 'Barnes', 19, 1, 'male'),
       ('Violet', 'Ross', 20, 2, 'female'),
       ('Evan', 'Henderson', 21, 3, 'male'),
       ('Hazel', 'Coleman', 22, 4, 'female'),
       ('Gabriel', 'Jenkins', 18, 1, 'male'),
       ('Aurora', 'Perry', 19, 1, 'female'),
       ('Christian', 'Powell', 20, 2, 'male'),
       ('Savannah', 'Long', 21, 3, 'female'),
       ('Hunter', 'Patterson', 22, 4, 'male'),
       ('Addison', 'Hughes', 18, 1, 'female'),
       ('Landon', 'Flores', 19, 1, 'male'),
       ('Penelope', 'Washington', 20, 2, 'female'),
       ('Adrian', 'Butler', 21, 3, 'male'),
       ('Claire', 'Simmons', 22, 4, 'female'),
       ('Colton', 'Foster', 18, 1, 'male'),
       ('Lydia', 'Gonzales', 19, 1, 'female'),
       ('Julian', 'Bryant', 20, 2, 'male'),
       ('Audrey', 'Alexander', 21, 3, 'female'),
       ('Asher', 'Russell', 22, 4, 'male'),
       ('Nora', 'Griffin', 18, 1, 'female'),
       ('Thomas', 'Diaz', 19, 1, 'male'),
       ('Elena', 'Hayes', 20, 2, 'female'),
       ('Josiah', 'Myers', 21, 3, 'male'),
       ('Hazel', 'Ford', 22, 4, 'female'),
       ('Jordan', 'Hamilton', 18, 1, 'male'),
       ('Kennedy', 'Graham', 19, 1, 'female'),
       ('Cooper', 'Sullivan', 20, 2, 'male'),
       ('Sadie', 'Wallace', 21, 3, 'female'),
       ('Robert', 'Woods', 22, 4, 'male'),
       ('Avery', 'Cole', 18, 1, 'female'),
       ('Leo', 'West', 19, 1, 'male'),
       ('Madison', 'Jordan', 20, 2, 'female'),
       ('Wyatt', 'Chapman', 21, 3, 'male'),
       ('Naomi', 'Garcia', 22, 4, 'female');


INSERT INTO subjects (subject_name, teacher_first_name, teacher_last_name)
VALUES ('Mathematics', 'John', 'Doe'),
       ('Physics', 'Jane', 'Smith'),
       ('Chemistry', 'Alan', 'Johnson'),
       ('Biology', 'Susan', 'Williams'),
       ('History', 'Mark', 'Brown'),
       ('Geography', 'Emma', 'Davis'),
       ('Literature', 'David', 'Wilson'),
       ('Art', 'Sophia', 'Martinez'),
       ('Computer Science', 'Michael', 'Anderson'),
       ('Physical Education', 'Olivia', 'Thomas');


INSERT INTO schedule (student_id, subject_id, grade)
VALUES (1, 1, 52),
       (1, 2, 63),
       (2, 2, 58),
       (2, 4, 67),
       (3, 1, 69),
       (4, 5, 55),
       (4, 7, 48),
       (5, 8, 64),
       (5, 9, 60),
       (6, 6, 62),
       (7, 4, 66),
       (8, 1, 45),
       (8, 3, 96),
       (9, 6, 58),
       (9, 7, 69),
       (10, 2, 90),
       (11, 1, 47),
       (11, 5, 66),
       (12, 2, 61),
       (13, 3, 49),
       (13, 5, 65),
       (14, 6, 88),
       (15, 4, 68),
       (16, 8, 55),
       (17, 1, 50),
       (18, 5, 59),
       (18, 4, 66),
       (19, 9, 62),
       (20, 1, 67),
       (21, 2, 85),
       (22, 1, 63),
       (23, 8, 61),
       (24, 7, 68),
       (25, 4, 68),
       (26, 5, 89),
       (27, 9, 64),
       (28, 2, 55),
       (29, 10, 66),
       (30, 6, 69),
       (41, 3, 51),
       (42, 2, 49),
       (43, 8, 78),
       (44, 6, 59),
       (45, 2, 48),
       (46, 4, 57),
       (47, 3, 65),
       (48, 5, 61),
       (49, 4, 62),
       (50, 7, 59),
       (61, 2, 54),
       (62, 4, 90),
       (63, 6, 53),
       (64, 8, 45),
       (65, 4, 49),
       (66, 5, 58),
       (67, 9, 46),
       (68, 2, 48),
       (69, 6, 60),
       (70, 7, 47),
       (81, 4, 65),
       (82, 5, 55),
       (83, 8, 98),
       (84, 2, 64),
       (85, 1, 69),
       (86, 7, 67),
       (87, 4, 52),
       (88, 2, 97),
       (89, 9, 57),
       (90, 5, 66),
       (91, 2, 90),
       (92, 8, 98),
       (93, 6, 59),
       (94, 3, 60),
       (95, 10, 51),
       (96, 7, 52),
       (97, 2, 61),
       (98, 6, 49),
       (99, 10, 63),
       (100, 3, 68);

UPDATE students
SET last_name  = 'Davios',
    updated_at = CURRENT_TIMESTAMP
WHERE gender = 'female';

SELECT subjects.teacher_first_name, teacher_last_name
FROM subjects;

SELECT subjects.subject_name
FROM subjects;

SELECT students.last_name, first_name
FROM students
WHERE course = 1
  AND gender = 'female';

SELECT students.last_name, first_name
FROM students
WHERE course = (SELECT MAX(course) FROM students)
  AND gender = 'male';

SELECT *
FROM students
WHERE age IN (18, 19, 20);

SELECT *
FROM students
WHERE id IN (SELECT student_id
             FROM schedule
             WHERE grade >= 90);


SELECT *
FROM students
WHERE id IN (SELECT student_id
             FROM schedule
             WHERE grade <= 60);


SELECT teacher_first_name
FROM subjects
WHERE id IN (SELECT subject_id
             FROM schedule
             WHERE grade >= 80)