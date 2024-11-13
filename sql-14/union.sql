SELECT students.first_name AS name
FROM students

UNION

SELECT subjects.teacher_first_name AS name
FROM subjects;


SELECT s.first_name, last_name, 'student' AS role
FROM students s
         JOIN schedule sc on s.id = sc.student_id
WHERE sc.grade < 60

UNION

SELECT sb.teacher_first_name, sb.teacher_last_name, 'teacher' AS role
FROM subjects sb
         JOIN schedule sc on sb.id = sc.subject_id
WHERE sc.grade < 60;


SELECT first_name AS name, 'student' AS type
FROM students

UNION

SELECT teacher_first_name AS name, 'teacher' AS type
FROM subjects

UNION

SELECT subject_name AS name, 'subject' AS type
FROM subjects;


SELECT first_name AS name, 'student' AS type
FROM students
WHERE age > 20

UNION

SELECT teacher_first_name AS name, 'teacher' AS type
FROM subjects;
