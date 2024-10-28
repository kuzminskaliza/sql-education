CREATE TABLE employees
(
    employee_id SERIAL PRIMARY KEY,
    name        VARCHAR(50),
    position    VARCHAR(50),
    salary      NUMERIC
);

INSERT INTO employees (name, position, salary)
VALUES ('John Doe', 'Developer', 50000),
       ('Jane Smith', 'Manager', 60000),
       ('Mike Brown', 'Developer', 48000),
       ('Anna Johnson', 'HR', 45000);

DELETE
FROM employees
WHERE employee_id = 1;

DELETE
FROM employees
WHERE position = 'Developer' RETURNING name, salary;

TRUNCATE TABLE employees;

DROP TABLE employees;


