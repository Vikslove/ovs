<?php
session_start();
require 'db2.php';

if (!isset($_SESSION['admin_id'])) {
    header("Location: login.php");
    exit;
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (!empty($_POST['name']) && !empty($_POST['voting_type'])) {
        $name = trim($_POST['name']);
        $voting_type = trim($_POST['voting_type']);

        $query = "INSERT INTO candidates (name, voting_type) VALUES (?, ?)";
        $stmt = $conn->prepare($query);

        if ($stmt) {
            $stmt->bind_param("ss", $name, $voting_type);

            if ($stmt->execute()) {
                echo "<script>alert('Candidate added successfully!'); window.location.href='admin_dashboard.php';</script>";
                exit;
            } else {
                echo "<script>alert('Failed to add candidate. Please try again.');</script>";
            }
            $stmt->close();
        } else {
            echo "<script>alert('Database error: Unable to prepare statement.');</script>";
        }
    } else {
        echo "<script>alert('All fields are required.');</script>";
    }
}
?>
