<?php
session_start();
require 'db2.php';

if (!isset($_SESSION['admin_id'])) {
    header("Location: login.php");
    exit;
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id = $_POST['id'];

    $query = "DELETE FROM candidates WHERE id = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("i", $id);

    if ($stmt->execute()) {
        echo "<script>alert('Candidate deleted successfully!'); window.location.href='admin_dashboard.php';</script>";
    } else {
        echo "<script>alert('Failed to delete candidate.');</script>";
    }
    $stmt->close();
}
?>
