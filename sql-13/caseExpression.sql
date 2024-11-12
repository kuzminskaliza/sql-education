SELECT schedule.student_id,
       schedule.subject_id,
       schedule.grade,
       CASE
           WHEN schedule.grade >= 60 THEN 'Passed'
           ELSE 'Failed'
           END AS result
FROM schedule;


SELECT id,
       students.first_name,
       students.last_name,
       students.course,
       CASE students.course
           WHEN 1 THEN 'Freshman'
           WHEN 2 THEN 'Sophomore'
           WHEN 3 THEN 'Junior'
           WHEN 4 THEN 'Senior'
           ELSE 'Unknown'
           END AS course_level
FROM students;


SELECT schedule.subject_id,
       schedule.subject_id,
       schedule.grade,
       CASE
           WHEN schedule.grade >= 85 THEN 'Excellent'
           WHEN schedule.grade >= 70 THEN 'Good'
           WHEN schedule.grade >= 60 THEN 'Satisfactory'
           WHEN schedule.grade <= 50 THEN 'Exclude'
           ELSE 'Unsatisfactory'
           END AS grade_classification
FROM schedule;


SELECT subject_id,
       COUNT(CASE WHEN grade >= 60 THEN 1 END) AS passed_count,
       COUNT(CASE WHEN grade < 60 THEN 1 END)  AS failed_count
FROM schedule
GROUP BY subject_id;


SELECT course,
       COUNT(CASE WHEN age > 20 THEN 1 END)  AS older_than_20,
       COUNT(CASE WHEN age <= 20 THEN 1 END) AS age_20_or_younger
FROM students
GROUP BY course;


SELECT first_name,
       last_name,
       course,
       age,
       CASE
           WHEN course IN (1, 2) AND age <= 20 THEN 'Junior and Young'
           WHEN course IN (1, 2) AND age > 20 THEN 'Junior and Older'
           WHEN course IN (3, 4) AND age <= 20 THEN 'Senior and Young'
           WHEN course IN (3, 4) AND age > 20 THEN 'Senior and Older'
           ELSE 'Undefined'
           END AS status
FROM students;