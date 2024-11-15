<?php

require_once 'connectingDb.php';
$pdo = getDatabaseConnection();

$sql = "INSERT INTO students (first_name, last_name, age, course, gender, student_address)
            VALUES (:first_name, :last_name, :age, :course, :gender, :student_address) RETURNING id";
$stmt = $pdo->prepare($sql);
$stmt->execute([
    'first_name' => 'John',
    'last_name' => 'Doe',
    'age' => 21,
    'course' => 1,
    'gender' => 'male',
    'student_address' => '123, Oak Street'
]);
$newStudentId = $stmt->fetchColumn();
echo "INSERT: New student added successfully with ID: $newStudentId\n";

$sql = "SELECT * FROM students";
$stmt = $pdo->query($sql);
echo "Students:\n";
while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
    echo $row['id'] . " - " . $row['first_name'] . " - " . $row['last_name'] . " - " . $row['age'] . " - " . $row['student_address'] . "\n";
}

$sql = "UPDATE students SET age = :age WHERE id = :id";
$stmt = $pdo->prepare($sql);
$stmt->execute([
    'age' => 23,
    'id' => $newStudentId
]);

$sql = "SELECT * FROM students WHERE id = :id";
$stmt = $pdo->prepare($sql);
$stmt->execute(['id' => $newStudentId]);
$updatedStudent = $stmt->fetch(PDO::FETCH_ASSOC);
echo "SELECT (update): Updated student: \n";
echo $updatedStudent['id'] . " - " . $updatedStudent['first_name'] . " " . $updatedStudent['last_name'] . " - " . $updatedStudent['age'] . "\n";

$sql = "DELETE FROM students WHERE id = :id";
$stmt = $pdo->prepare($sql);
$stmt->execute(['id' => $newStudentId]);
echo "DELETE: Student with ID $newStudentId has been deleted\n";

$sql = "SELECT * FROM students WHERE id = :id";
$stmt = $pdo->prepare($sql);
$stmt->execute(['id' => $newStudentId]);
if ($stmt->rowCount() == 0) {
    echo "SELECT (after delete): No student found with ID $newStudentId";
}