<?php
session_start();
require 'db_connection.php'; // Ensure this file contains a valid database connection.

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = trim($_POST['username']);
    $password = trim($_POST['password']);

    // Check if inputs are empty
    if (empty($username) || empty($password)) {
        $_SESSION['error'] = "Username and password cannot be empty.";
        header("Location: admin_login.php");
        exit;
    }

    // Fetch admin details from the database
    $stmt = $conn->prepare("SELECT * FROM admins WHERE username = ?");
    if ($stmt === false) {
        $_SESSION['error'] = "Database query failed.";
        header("Location: admin_login.php");
        exit;
    }

    $stmt->bind_param("s", $username);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows === 1) {
        $admin = $result->fetch_assoc();

        // Verify password
        if (password_verify($password, $admin['password'])) {
            // Set session and redirect
            $_SESSION['admin_id'] = $admin['id'];
            header("Location: admin_dashboard.php");
            exit;
        } else {
            $_SESSION['error'] = "Incorrect password.";
            header("Location: admin_login.php");
            exit;
        }
    } else {
        $_SESSION['error'] = "Invalid username.";
        header("Location: admin_login.php");
        exit;
    }
} else {
    header("Location: admin_login.php");
    exit;
}
?>
