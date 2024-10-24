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

UPDATE employees
SET position = 'Senior Developer',
    salary   = 65000
WHERE employee_id = 1;

UPDATE employees
SET salary = 45000;

UPDATE employees
SET salary = salary * 1.10
WHERE position = 'Developer';

UPDATE employees
SET salary = salary + 5000
WHERE employee_id = 2 RETURNING employee_id, salary;

UPDATE employees
SET salary = 'not a number'
WHERE employee_id = 3;