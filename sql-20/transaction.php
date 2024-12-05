<?php

try {
    $dsn = 'pgsql:host=localhost;port=5432;dbname=university';
    $username = 'liza';
    $password = '1805';

    $pdo = new PDO($dsn, $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $pdo->beginTransaction();

    $pdo->exec("
    INSERT INTO students (first_name, last_name, age, course, gender, student_address)
    VALUES ('Mark', 'Smith', 21, 3, 'male', '123 Main Street');
");
    $pdo->exec("
        INSERT INTO schedule (student_id, subject_id, grade)
        VALUES (101, 2, 75);
    ");
    echo "Блок 1 виконано успішно.\n";

    $pdo->exec("
        INSERT INTO subjects (subject_name, teacher_first_name, teacher_last_name)
        VALUES ('Philosophy', 'Eleanor', 'White');
    ");
    $pdo->exec("
        INSERT INTO schedule (student_id, subject_id, grade)
        VALUES (1, 11, 72);
    ");
    echo "Блок 2 виконано успішно.\n";

    $pdo->exec("
        UPDATE students
        SET course = 4
        WHERE id = 3;
    ");
    $pdo->exec("
        INSERT INTO schedule (student_id, subject_id, grade)
        VALUES (3, 5, 78);
    ");
    echo "Блок 3 виконано успішно.\n";

    $pdo->commit();
    echo "Транзакція успішно завершена.\n";

} catch (Exception $e) {
    $pdo->rollBack();
    echo "Транзакція скасована: " . $e->getMessage() . "\n";
}
