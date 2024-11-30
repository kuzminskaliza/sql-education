CREATE TABLE students
(
    id     SERIAL PRIMARY KEY,
    name   VARCHAR(255) NOT NULL,
    age    INTEGER      NOT NULL,
    course INTEGER      NOT NULL,
    gender VARCHAR(50)  NOT NULL,
    email  VARCHAR(255) NOT NULL,
    status VARCHAR(50)  NOT NULL,
    data   JSONB        NOT NULL
);


INSERT INTO students (name, age, course, gender, email, status, data)
VALUES ('John Doe', 20, 3, 'male', 'john@example.com', 'active', '{
  "ip": "192.168.1.1"
}'),
       ('Jane Smith', 19, 3, 'female', 'jane@example.com', 'active', '{
         "ip": "192.168.1.2"
       }'),
       ('Alice Johnson', 21, 4, 'female', 'alice@example.com', 'inactive', '{
         "ip": "192.168.1.3"
       }'),
       ('Michael Brown', 22, 5, 'male', 'michael@example.com', 'inactive', '{
         "ip": "192.168.1.4"
       }'),
       ('Sophia Taylor', 20, 3, 'female', 'sophia@example.com', 'active', '{
         "ip": "192.168.1.5"
       }');


CREATE INDEX idx_students_age_course
    ON students (age, course);

SELECT *
FROM students
WHERE age BETWEEN 19 AND 21
  AND course = 3;


CREATE INDEX idx_students_gender_hash
    ON students USING hash (gender);

SELECT *
FROM students
WHERE gender = 'female';


CREATE INDEX email_domain_idx
    ON students (split_part(email, '@', 2));

SELECT *
FROM students
WHERE split_part(email, '@', 2) = 'example.com';


CREATE INDEX ip_static_idx
    ON students ((inet '192.168.1.1') );

SELECT *
FROM students
WHERE inet '192.168.1.1' = inet '192.168.1.1';


CREATE INDEX age_cast_idx
    ON students ((age : : INT) );

SELECT *
FROM students
WHERE age::INT = 20;


CREATE INDEX active_students_idx
    ON students (id) WHERE status = 'active';

SELECT *
FROM students
WHERE status = 'active';


CREATE INDEX lower_name_idx
    ON students (LOWER(name));

SELECT *
FROM students
WHERE LOWER(name) = 'john';


CREATE INDEX data_ip_idx
    ON students ((data - >> 'ip') );

SELECT *
FROM students
WHERE data ->>'ip' = '192.168.1.1';
