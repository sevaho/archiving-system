#Create and use MariaDB tables

###log in to MariaDB

``` sql
mysql -u root -p

```
Enter your password.


or

``` sql
mysql -uroot -proot

```


&nbsp;

###create and use a database

``` sql
CREATE DATABASE users;

show databases;
```
> doesn't need to be in uppercases.


&nbsp;


``` sql
USE playground;
```
> you don't need to use exit commands to switch between databases, just use "use database" to switch;

&nbsp;

###create and use tables in a database


``` sql
CREATE TABLE [IF NOT EXISTS] name_of_table (list_of_table_columns);
```

> example

``` sql
CREATE TABLE IF NOT EXISTS users (
    user_id int(5) NOT NULL AUTO_INCREMENT,
    username varchar(20) DEFAULT NULL,
    password varchar(20) DEFAULT NULL,
    PRIMARY KEY(user_id)
    );
```

To see all your tables:

``` sql
SHOW tables;
```

To see which columns are in your table use:

``` sql
SHOW columns in users;
```

Insert data into your table.

``` sql
INSERT INTO table_name (field1, field2, ...) VALUES (value1, value2, ...);
```

>example

``` sql
INSERT INTO users (username, password) VALUES ("sebastiaan", "Logmein123") , ("tom","incorrect456");
```

To see all the queries from your table use:

``` sql
SELECT * FROM users;
```


&nbsp;



###delete, drop tables and queries

drop tables.

``` sql
DROP TABLE table_name;
```

delete queries

``` sql
DELETE FROM users WHERE user_id=3;
```




&nbsp;



###Connect PHP to mariaDB

####checking a username and password

``` php
<?php
$servername = "localhost";
$username = "root";
$password = "root";
$dbname = "users";

$usernameForm = $_POST['username'];
$passwordForm = $_POST['password'];

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Database connection failed: " . $conn->connect_error);
}

$sql = "SELECT username, password FROM users WHERE username='$usernameForm' and password='$passwordForm'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {

echo "logged in";
}
else {
echo "wrong password or username";
}
$conn->close();
?>
```

####Inserting a username and password


``` php
<?php
$servername = "localhost";
$username = "root";
$password = "root";
$dbname = "users";

$usernameForm = $_POST['username'];
$passwordForm = $_POST['password'];

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Database connection failed: " . $conn->connect_error);
}

$sql = "INSERT INTO users (username, password) VALUES ('$usernameForm','$passwordForm')";
$result = $conn->query($sql);

$conn->close();
?>
```


[source DigitalOcean](https://www.digitalocean.com/community/tutorials/how-to-create-a-table-in-mysql-and-mariadb-on-an-ubuntu-cloud-server).
