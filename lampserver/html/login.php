
<?php
$servername = "192.168.56.13";
$username = "lampserver";
$password = "root123";
$dbname = "users";

$usernameA = $_POST['username'];
$passwordA = $_POST['password'];

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Database connection failed: " . $conn->connect_error);
}

$sql = "SELECT username, password FROM users WHERE username='$usernameA' and password='$passwordA'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {

header('Location: http://192.168.56.10/sevaho.php');
}
else {
header('Location: http://192.168.56.10/failed.html');
}
$conn->close();
?>

