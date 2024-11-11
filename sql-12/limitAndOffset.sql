--5 останніх доданих студентів
SELECT students.first_name, students.last_name, students.created_at
FROM students
ORDER BY students.created_at DESC
LIMIT 5;

--5 студентів після перших 5
SELECT students.first_name, students.last_name, students.created_at
FROM students
ORDER BY students.created_at DESC
LIMIT 5 OFFSET 5;

--5 студетів починаючи з 11
SELECT students.first_name, students.last_name, students.created_at
FROM students
ORDER BY created_at DESC
LIMIT 5 OFFSET 10;

--5 нових студенток починаючи з 6 запису
SELECT students.first_name, students.last_name, students.created_at
FROM students
WHERE gender = 'female'
ORDER BY created_at DESC
LIMIT 5 OFFSET 5;