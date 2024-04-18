<?php
require_once 'db_connection.php'; // Include the database connection file

$table = "users"; // MySQL table name

// Retrieve signup data from POST request
$username = $_POST['username'];
$email = $_POST['email'];
$password = $_POST['password'];

// Insert signup data into the database
$sql = "INSERT INTO $table (username, email, password) VALUES ('$username', '$email', '$password')";

if ($conn->query($sql) === TRUE) {
  echo "New record created successfully";
} else {
  echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
