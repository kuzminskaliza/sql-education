CREATE FUNCTION get_full_name(student_id INTEGER)
    RETURNS VARCHAR as
    $$
DECLARE
full_name VARCHAR;
BEGIN
SELECT CONCAT(first_name, ' ', last_name)
INTO full_name
FROM students
WHERE id = student_id;

RETURN full_name;
END;
$$
LANGUAGE plpgsql;

SELECT get_full_name(1);

CREATE FUNCTION count_students_by_course(course_number INTEGER)
    RETURNS INTEGER AS $$
DECLARE
student_count INTEGER;
BEGIN
SELECT COUNT(*)
INTO student_count
FROM students
WHERE course = course_number;

RETURN student_count;
END;
$$
LANGUAGE plpgsql;

SELECT count_students_by_course(2);

CREATE FUNCTION count_subjects_by_teacher(teacher_first VARCHAR, teacher_last VARCHAR)
    RETURNS INTEGER AS $$
DECLARE
subject_count INTEGER;
BEGIN
SELECT COUNT(*)
INTO subject_count
FROM subjects
WHERE teacher_first_name = teacher_first
  AND teacher_last_name = teacher_last;

RETURN subject_count;
END;
$$
LANGUAGE plpgsql;

SELECT count_subjects_by_teacher('John', 'Doe');

CREATE FUNCTION get_average_grade(p_student_id INTEGER)
    RETURNS NUMERIC AS $$
DECLARE
average_grade NUMERIC;
BEGIN
SELECT AVG(grade)
INTO average_grade
FROM schedule
WHERE student_id = p_student_id;

RETURN average_grade;
END;
$$
LANGUAGE plpgsql;

SELECT get_average_grade(1);

CREATE FUNCTION is_student_in_course(p_student_id INTEGER, p_course_number INTEGER)
    RETURNS BOOLEAN AS $$
DECLARE
is_in_course BOOLEAN;
BEGIN
SELECT EXISTS (SELECT 1
               FROM students
               WHERE id = p_student_id
                 AND course = p_course_number)
INTO is_in_course;

RETURN is_in_course;
END;
$$
LANGUAGE plpgsql;

SELECT is_student_in_course(1, 2);

CREATE FUNCTION count_student_subjects(p_student_id INTEGER)
    RETURNS INTEGER AS $$
DECLARE
subject_count INTEGER;
BEGIN
SELECT COUNT(*)
INTO subject_count
FROM schedule
WHERE student_id = p_student_id;

RETURN subject_count;
END;
$$
LANGUAGE plpgsql;

SELECT count_student_subjects(27);

DROP FUNCTION get_full_name(INTEGER);
DROP FUNCTION count_subjects_by_teacher(teacher_first VARCHAR, teacher_last VARCHAR);
DROP FUNCTION get_average_grade(INTEGER);
DROP FUNCTION is_student_in_course(INTEGER, INTEGER);
DROP FUNCTION count_student_subjects(INTEGER);
