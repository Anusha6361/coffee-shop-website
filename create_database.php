<?php
$servername = "localhost";
$username = "your_username";
$password = "your_password";
$dbname = "CoffeeShopDB";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Read the SQL file
$sql = file_get_contents('create_database.sql');

// Execute the SQL statements
if ($conn->multi_query($sql) === TRUE) {
    echo "Database and tables created successfully";
} else {
    echo "Error creating database: " . $conn->error;
}

$conn->close();
?>