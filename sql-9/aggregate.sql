--Кількість студентів
SELECT count(*) AS total_students
FROM students;

--Середній вік студента
SELECT AVG(students.age) AS average_age
FROM students;

--Максимальний і мінімальний вік студента
SELECT MAX(students.age) AS oldest_age, MIN(age) AS youngest_age
FROM students;

--Кількість предметів
SELECT COUNT(*) AS total_subjects
FROM subjects;

--Середня оцінка
SELECT AVG(schedule.grade) AS average_grade
FROM schedule;

--Найвища оцінка
SELECT MAX(schedule.grade) AS highest_grade
FROM schedule;

--Студенти з найменшим віком, відсортоввані за іменем
SELECT students.first_name, students.last_name, students.age
FROM students
WHERE age = (SELECT min(age) FROM students)
ORDER BY first_name ASC;

--Список студентів, відсортованих за прізвищем
SELECT students.first_name, students.last_name, students.age
FROM students
ORDER BY last_name DESC;

--Студенти відстортовані за віком
SELECT students.first_name, students.last_name, students.age
FROM students
WHERE age BETWEEN 18 AND 22
ORDER BY age ASC;

--Сума всіх балів
SELECT SUM(schedule.grade) AS total_grades
FROM schedule;

--5 останніх доданих студентів
SELECT students.first_name, students.last_name, students.created_at
FROM students
ORDER BY students.created_at DESC LIMIT 5;

--Студенти які мають оцінку нижче 50
SELECT schedule.student_id, schedule.grade
FROM schedule
WHERE grade < 50
ORDER BY grade ASC;

--Середня та максимальна оцінка з предмета під id 2
SELECT AVG(schedule.grade) AS average_grade, MAX(schedule.grade) AS highest_grade
FROM schedule
WHERE subject_id = 2;