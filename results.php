<?php
session_start();
require 'db2.php'; // Ensure this file contains your mysqli connection setup

// Check if the user is logged in
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit;
}

// Fetch voting results from the database
$sql = "SELECT c.name AS candidate_name, c.voting_type, COUNT(v.id) AS votes
        FROM candidates c
        LEFT JOIN votes v ON c.id = v.candidate_id
        GROUP BY c.id, c.name, c.voting_type
        ORDER BY c.voting_type, votes DESC";

$result = $conn->query($sql);

$results = [];
$no_results = false;

// Check query execution
if ($result) {
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $results[] = $row;
        }
    } else {
        $no_results = true;
    }
} else {
    die("Error fetching results: " . $conn->error);
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Election Results - College Voting System</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #4F46E5;
            --secondary-color: #14B8A6;
            --background-color: #F3F4F6;
            --text-color: #374151;
            --card-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background: var(--background-color);
            color: var(--text-color);
            min-height: 100vh;
            overflow-x: hidden;
        }

        .navbar {
            background: var(--primary-color);
            padding: 1rem 2rem;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
            box-shadow: var(--card-shadow);
        }

        .navbar h2 {
            color: white;
            font-size: 1.5rem;
            font-weight: 600;
        }

        .navbar-links {
            display: flex;
            gap: 1rem;
        }

        .navbar-links a {
            color: white;
            text-decoration: none;
            font-weight: 500;
            padding: 0.5rem 1rem;
            border-radius: 0.3rem;
            transition: background 0.3s;
        }

        .navbar-links a:hover {
            background: rgba(255, 255, 255, 0.2);
        }

        .hero {
            margin-top: 4rem;
            padding: 2rem;
            text-align: center;
            background: var(--secondary-color);
            color: white;
            border-radius: 0 0 1rem 1rem;
        }

        .hero h1 {
            font-size: 2.5rem;
            margin-bottom: 0.5rem;
        }

        .hero p {
            font-size: 1.2rem;
            opacity: 0.9;
        }

        .results-container {
            max-width: 900px;
            margin: 2rem auto;
            padding: 1.5rem;
            background: white;
            border-radius: 1rem;
            box-shadow: var(--card-shadow);
        }

        .chart-container {
            margin-bottom: 2rem;
            text-align: center;
        }

        .results-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 1rem;
        }

        .results-table th, .results-table td {
            padding: 0.8rem;
            text-align: left;
            border-bottom: 1px solid #e5e7eb;
        }

        .results-table th {
            background: var(--primary-color);
            color: white;
        }

        .results-table tr:last-child td {
            border-bottom: none;
        }

        .results-table tr:hover {
            background: #f1f5f9;
        }

        @media (max-width: 768px) {
            .results-container {
                padding: 1rem;
            }

            .hero h1 {
                font-size: 1.8rem;
            }

            .chart-container {
                height: 250px;
            }
        }
    </style>
</head>
<body>
    <nav class="navbar">
        <div class="navbar-content">
            <h2>College Voting System</h2>
            <div class="navbar-links">
                <a href="index.php"><i class="fas fa-home"></i> Home</a>
                <a href="logout.php"><i class="fas fa-sign-out-alt"></i> Logout</a>
            </div>
        </div>
    </nav>

    <section class="hero">
        <h1>Election Results</h1>
        <p>View the live results of your college elections and see how your vote has made an impact.</p>
    </section>

    <div class="results-container">
        <div class="chart-container">
            <h2 style="margin-bottom: 1rem;">Vote Distribution</h2>
            <canvas id="pollChart" style="max-height: 300px;"></canvas>
        </div>

        <table class="results-table">
            <thead>
                <tr>
                    <th>Category</th>
                    <th>Candidate</th>
                    <th>Votes</th>
                </tr>
            </thead>
            <tbody>
                <?php if ($no_results): ?>
                    <tr>
                        <td colspan="3" style="text-align: center;">No results available at the moment.</td>
                    </tr>
                <?php else: ?>
                    <?php foreach ($results as $row): ?>
                        <tr>
                            <td><?php echo htmlspecialchars($row['voting_type']); ?></td>
                            <td><?php echo htmlspecialchars($row['candidate_name']); ?></td>
                            <td><?php echo htmlspecialchars($row['votes']); ?></td>
                        </tr>
                    <?php endforeach; ?>
                <?php endif; ?>
            </tbody>
        </table>
    </div>

    <script>
        const chartData = {
            labels: <?php echo json_encode(array_column($results, 'candidate_name')); ?>,
            datasets: [{
                label: 'Number of Votes',
                data: <?php echo json_encode(array_column($results, 'votes')); ?>,
                backgroundColor: ['#4F46E5', '#14B8A6', '#F59E0B', '#EF4444', '#3B82F6', '#10B981'],
                hoverOffset: 4
            }]
        };

        const config = {
            type: 'doughnut',
            data: chartData,
            options: {
                responsive: true,
                plugins: {
                    legend: { position: 'bottom' }
                }
            }
        };

        const ctx = document.getElementById('pollChart').getContext('2d');
        new Chart(ctx, config);
    </script>
</body>
</html>
