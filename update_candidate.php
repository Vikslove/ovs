<?php
session_start();
require 'db2.php';

if (!isset($_SESSION['admin_id'])) {
    header("Location: login.php");
    exit;
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id = $_POST['id'];
    $name = $_POST['name'];
    $voting_type = $_POST['voting_type'];

    $query = "UPDATE candidates SET name = ?, voting_type = ? WHERE id = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("ssi", $name, $voting_type, $id);

    if ($stmt->execute()) {
        echo "<script>alert('Candidate updated successfully!'); window.location.href='admin_dashboard.php';</script>";
    } else {
        echo "<script>alert('Failed to update candidate.');</script>";
    }
    $stmt->close();
}
?>
