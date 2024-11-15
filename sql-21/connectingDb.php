<?php

function getDatabaseConnection(): PDO
{
    $host = 'localhost';
    $port = '5432';
    $dbname = 'university';
    $user = 'liza';
    $password = '1805';

    try {
        $dsn = "pgsql:host=$host;port=$port;dbname=$dbname";
        $pdo = new PDO($dsn, $user, $password);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        echo "Connected to the PostgreSQL database successfully!";
    } catch (PDOException $e) {
        echo "Connection failed: " . $e->getMessage();
    }
    return $pdo;
}
