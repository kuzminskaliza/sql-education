CREATE TABLE students
(
    id         SERIAL PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name  VARCHAR(255) NOT NULL
);

CREATE TABLE courses_cascade
(
    id          SERIAL PRIMARY KEY,
    student_id  INTEGER      NOT NULL,
    course_name VARCHAR(255) NOT NULL,
    CONSTRAINT fk_student_cascade FOREIGN KEY (student_id)
        REFERENCES students (id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE courses_set_null
(
    id          SERIAL PRIMARY KEY,
    student_id  INTEGER,
    course_name VARCHAR(255) NOT NULL,
    CONSTRAINT fk_student_set_null FOREIGN KEY (student_id)
        REFERENCES students (id) ON DELETE SET NULL ON UPDATE SET NULL
);

CREATE TABLE courses_restrict
(
    id          SERIAL PRIMARY KEY,
    student_id  INTEGER      NOT NULL,
    course_name VARCHAR(255) NOT NULL,
    CONSTRAINT fk_student_restrict FOREIGN KEY (student_id)
        REFERENCES students (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);

INSERT INTO students (first_name, last_name)
VALUES ('Alex', 'Johnson'),
       ('Emily', 'Davis'),
       ('John', 'Smith'),
       ('Alice', 'Brown'),
       ('Michael', 'Williams'),
       ('Sophia', 'Taylor'),
       ('Emma', 'Clark');

INSERT INTO courses_cascade (student_id, course_name)
VALUES (1, 'Mathematics'),
       (2, 'Biology'),
       (3, 'History'),
       (6, 'Computer Science');
INSERT INTO courses_set_null (student_id, course_name)
VALUES (1, 'Physics'),
       (2, 'Chemistry'),
       (4, 'English'),
       (6, 'Statistics');

INSERT INTO courses_restrict (student_id, course_name)
VALUES (1, 'Chemistry'),
       (3, 'Philosophy'),
       (4, 'Art'),
       (6, 'Psychology');

DELETE
FROM students
WHERE id = 2;

UPDATE students
SET id = 33
WHERE id = 3;

UPDATE students
SET id = 40
WHERE id = 4;

DELETE
FROM students
WHERE id = 40;

UPDATE students
SET id = 1
WHERE id = 6;

CREATE TABLE courses_no_action
(
    id          SERIAL PRIMARY KEY,
    student_id  INTEGER      NOT NULL,
    course_name VARCHAR(255) NOT NULL,
    CONSTRAINT fk_student_no_action FOREIGN KEY (student_id)
        REFERENCES students (id) ON DELETE NO ACTION ON UPDATE NO ACTION
);

INSERT INTO courses_no_action (student_id, course_name)
VALUES (3, 'Philosophy Basics');

DELETE
FROM students
WHERE id = 3;
