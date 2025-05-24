<?php
$host = "localhost";  // Database server
$username = "root";   // Default username in XAMPP
$password = "";       // Default password is blank
$dbname = "college_voting_system"; // Your database name

// Create connection
$conn = new mysqli($host, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}



