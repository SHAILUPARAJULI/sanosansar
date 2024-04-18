<?php
$servername = "localhost"; 
$username = "root";
$password = ""; 
$dbname = "sanosansar"; 
$table = "users"; 

// Create connection
$conn = new mysqli($servername, $username, $password);

// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

// Create database if not exists
$sql = "CREATE DATABASE IF NOT EXISTS $dbname";
if ($conn->query($sql) !== TRUE) {
  echo "Error creating database: " . $conn->error;
  $conn->close();
  exit();
}

// Select the database
$conn->select_db($dbname);

// Create users table if not exists
$sql = "CREATE TABLE IF NOT EXISTS $table (
  id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL,
  password VARCHAR(50) NOT NULL
)";
if ($conn->query($sql) !== TRUE) {
  echo "Error creating table: " . $conn->error;
  $conn->close();
  exit();
}
?>
