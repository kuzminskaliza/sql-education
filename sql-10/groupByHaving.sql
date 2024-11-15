--Групує студентів за віком
SELECT age, COUNT(*) AS student_count
FROM students
GROUP BY age;

--Кількість студентів за курсом
SELECT students.course, COUNT(*) AS total_students
FROM students
GROUP BY course;

--Середній баз по кожному предмету
SELECT subject_id, AVG(schedule.grade) AS avg_grade
FROM schedule
GROUP BY subject_id;

--Кількість студентів за гендером
SELECT gender, COUNT(*) AS gender_count
FROM students
GROUP BY gender;

--Середнвц вік студента кожного курсу
SELECT course, AVG(students.age) AS avg_age
FROM students
GROUP BY course;

--Кількість предметів кожного викладача
SELECT teacher_first_name, teacher_last_name, COUNT(*) AS subjects_count
FROM subjects
GROUP BY teacher_first_name, teacher_last_name;

--Середня оцінка студента
SELECT student_id, AVG(schedule.grade) AS avg_grade
FROM schedule
GROUP BY student_id;

--Кількість студентів за курсом, де є більше 10 студентів
SELECT students.course, COUNT(*) AS total_students
FROM students
GROUP BY course
HAVING COUNT(*) > 10;

--Предмети з середньою оцінкою більше 60
SELECT schedule.subject_id, AVG(schedule.grade) AS avg_grade
FROM schedule
GROUP BY subject_id
HAVING AVG(grade) > 60;

--Викладачі, які мають 1 предмет
SELECT subjects.teacher_last_name, subjects.teacher_first_name, COUNT(*) AS subject_count
FROM subjects
GROUP BY teacher_first_name, teacher_last_name
HAVING count(*) = 1;

--Студенти з середньої оцінкою більше 70
SELECT schedule.student_id, AVG(schedule.grade) AS avg_grade
FROM schedule
GROUP BY student_id
HAVING AVG(grade) > 70;

--КУрси з більше 5 студентів
SELECT students.course, COUNT(*) AS student_count
FROM students
GROUP BY course
HAVING COUNT(*) > 5;

--Предмети, максимальна оцінка студента більше 80
SELECT schedule.subject_id, MAX(schedule.grade) AS max_grade
FROM schedule
GROUP BY subject_id
HAVING MAX(grade) > 80;