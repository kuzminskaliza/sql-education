CREATE
OR REPLACE FUNCTION update_students_timestamp()
    RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at
= CURRENT_TIMESTAMP;
RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER students_update_timestamp
    BEFORE UPDATE
    ON students
    FOR EACH ROW
    EXECUTE FUNCTION update_students_timestamp();


CREATE
OR REPLACE FUNCTION check_grade_range()
    RETURNS TRIGGER AS $$
BEGIN
    IF
NEW.grade < 0 OR NEW.grade > 100 THEN
        RAISE EXCEPTION 'Grade must be between 0 and 100';
END IF;
RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER schedule_check_grade
    BEFORE INSERT OR
UPDATE ON schedule
    FOR EACH ROW
    EXECUTE FUNCTION check_grade_range();



CREATE
OR REPLACE PROCEDURE add_student(
    p_first_name VARCHAR,
    p_last_name VARCHAR,
    p_age INTEGER,
    p_course INTEGER,
    p_gender gender_enum
)
    LANGUAGE plpgsql
AS $$
BEGIN
INSERT INTO students (first_name, last_name, age, course, gender)
VALUES (p_first_name, p_last_name, p_age, p_course, p_gender);
END;
$$;

CALL add_student('John', 'Doe', 19, 1, 'male');

CREATE
OR REPLACE PROCEDURE get_student_average_grade(p_student_id INTEGER)
    LANGUAGE plpgsql
AS $$
DECLARE
avg_grade NUMERIC;
BEGIN
SELECT AVG(grade)
INTO avg_grade
FROM schedule
WHERE student_id = p_student_id;
END;
$$

CALL get_student_average_grade(1);