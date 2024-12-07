--Розклад кожного студента
SELECT s.first_name AS student_name,
       sb.subject_name,
       sc.grade
FROM students s
         JOIN schedule sc ON s.id = sc.student_id
         JOIN subjects sb ON sc.subject_id = sb.id
WHERE s.first_name = 'Alex'
  AND s.last_name = 'Johnson';

--Список студентів їх предметів та викладач
SELECT s.first_name          AS student_name,
       s.last_name           AS student_lastname,
       sb.subject_name,
       sb.teacher_first_name AS teacher_name,
       sb.teacher_last_name  AS teacher_lastname
FROM students s
         JOIN schedule sc ON s.id = sc.subject_id
         JOIN subjects sb ON sc.subject_id = sb.id;

--Кількість студентів в кожного викладача
SELECT sb.teacher_first_name AS teacher_name,
       sb.teacher_last_name  AS teacher_lastname,
       sb.subject_name,
       COUNT(sc.student_id)  AS student_count
FROM subjects sb
         JOIN schedule sc ON sb.id = sc.subject_id
         JOIN students s ON sc.student_id = s.id
GROUP BY sb.teacher_first_name, sb.teacher_last_name, sb.subject_name;

--Детальний розклад студентів, викладачів
SELECT s.first_name          AS student_name,
       s.last_name           AS student_lastname,
       sb.subject_name,
       sb.teacher_first_name AS teacher_name,
       sb.teacher_last_name  AS teacher_lastname,
       sc.grade
FROM students s
         JOIN schedule sc ON s.id = sc.subject_id
         JOIN subjects sb ON sc.subject_id = sb.id
ORDER BY sb.subject_name;

--Список студентів які мають спільний предмет з іншими студентами
SELECT s1.first_name AS student_1,
       s2.first_name AS student_2,
       sb.subject_name
FROM schedule sc1
         JOIN schedule sc2 ON sc1.subject_id = sc2.subject_id
         JOIN students s1 on sc1.student_id = s1.id
         JOIN students s2 ON sc2.subject_id = sc2.id
         JOIN subjects sb on sc1.subject_id = sb.id
WHERE s1.first_name = 'Alex'
  AND s1.last_name = 'Johnson'
  AND s1.id <> s2.id;

--Курс більше ніж 3 студента
SELECT sb.subject_name,
       count(sc.student_id) AS student_count
FROM subjects sb
         JOIN schedule sc on sb.id = sc.subject_id
GROUP BY sb.subject_name
HAVING COUNT(sc.subject_id) > 3;

--Список студентів з їх оцінками по предметах
SELECT s.first_name AS student_name,
       s.last_name  AS student_lastname,
       sb.subject_name,
       sc.grade
FROM students s
         JOIN schedule sc ON s.id = sc.student_id
         JOIN subjects sb ON sc.subject_id = sb.id;

--Список студентів які мають оцінки більше 80
SELECT s.first_name AS student_name,
       s.last_name  AS student_lastname,
       sb.subject_name,
       sc.grade
FROM students s
         JOIN schedule sc ON s.id = sc.student_id
         JOIN subjects sb ON sc.subject_id = sb.id
WHERE sc.grade > 80;

--СПисок усіх студентів і предметів, навіть якшо оцінки не виставленні
SELECT s.first_name AS student_name,
       s.last_name  AS student_lastname,
       sb.subject_name,
       sc.grade
FROM students s
         LEFT JOIN schedule sc ON s.id = sc.student_id
         LEFT JOIN subjects sb ON sc.subject_id = sb.id;

--Кількість студентів у кожному предметі
SELECT sb.subject_name,
       COUNT(s.id) AS student_count
FROM subjects sb
         JOIN schedule sc on sb.id = sc.subject_id
         JOIN students s on sc.student_id = s.id
GROUP BY sb.subject_name;

--СПисок оцінок які має кожен студент по кожному предмету
SELECT s.first_name,
       s.last_name,
       sb.subject_name
FROM students s
         INNER JOIN schedule sc ON s.id = sc.student_id
         INNER JOIN subjects sb ON sc.subject_id = sb.id;

--Список студентів з предметами по конкретному курсу
SELECT s.first_name,
       s.course,
       sb.subject_name
FROM students s
         INNER JOIN schedule sc ON s.id = sc.student_id
         INNER JOIN subjects sb ON sc.subject_id = sb.id
WHERE s.course = 2;

--Усі предмети та оцінки
SELECT sb.subject_name,
       sc.grade
FROM subjects sb
         LEFT JOIN schedule sc ON sb.id = sc.subject_id;

--Список усіх студентів з предметами
SELECT sb.subject_name,
       s.first_name AS student_name
FROM students s
         RIGHT JOIN schedule sc ON s.id = sc.student_id
         RIGHT JOIN subjects sb ON sc.subject_id = sb.id;

--СПисок всіх викладачів і студентів яких вони навчають
SELECT s.first_name          AS student_name,
       sb.teacher_first_name AS teacher_name
FROM students s
         RIGHT JOIN schedule sc ON s.id = sc.student_id
         RIGHT JOIN subjects sb ON sc.subject_id = sb.id;