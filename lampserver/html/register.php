<?php
$servername = "192.168.56.13";
$username = "lampserver";
$password = "root123";
$dbname = "users";

$usernameForm = $_POST['username'];
$passwordForm = $_POST['password'];

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Database connection failed: " . $conn->connect_error);
}

$sql = "INSERT INTO users (username, password) VALUES ('$usernameForm', '$passwordForm')";
$result = $conn->query($sql);
$conn->close();
header('Location: http://192.168.56.10/registered.html');
?>

