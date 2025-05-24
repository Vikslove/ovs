<?php
session_start();
require 'db.php';

// Function to generate a random CAPTCHA string
function generateCaptcha($length = 6) {
    $characters = 'ABCDEFGHJKLMNPQRSTUVWXYZabcdefghjkmnpqrstuvwxyz23456789';
    return substr(str_shuffle($characters), 0, $length);
}

// Generate CAPTCHA if not already set or regenerate on failure
if (!isset($_SESSION['captcha_text']) || isset($_POST['captcha_failed'])) {
    $_SESSION['captcha_text'] = generateCaptcha();
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $prn = trim($_POST['prn']);
    $username = trim($_POST['username']);
    $captcha_input = trim($_POST['captcha']);

    if (empty($prn) || empty($username) || empty($captcha_input)) {
        echo "<script>alert('❌ All fields are required!');</script>";
    } elseif (strcasecmp($captcha_input, $_SESSION['captcha_text']) !== 0) {
        echo "<script>alert('❌ Incorrect CAPTCHA! Try again.');</script>";
        $_SESSION['captcha_text'] = generateCaptcha(); // Regenerate CAPTCHA
    } else {
        $sql = "SELECT * FROM users WHERE prn = ? AND name = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("ss", $prn, $username);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows === 1) {
            $_SESSION['reset_prn'] = $prn;
            echo "<script>alert('✅ Verified! Proceed to reset password.'); window.location.href='reset_password.php';</script>";
        } else {
            echo "<script>alert('❌ No matching user found!');</script>";
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: linear-gradient(to right, #A1FFCE, #FAFFD1); /* Fresh Gradient */
        }
        .container {
            background: white;
            padding: 30px;
            width: 380px;
            text-align: center;
            border-radius: 12px;
            box-shadow: 0px 5px 20px rgba(0, 0, 0, 0.1);
        }
        h2 {
            color: #333;
            margin-bottom: 20px;
            font-size: 24px;
        }
        input {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 2px solid #ddd;
            border-radius: 8px;
            font-size: 16px;
            transition: 0.3s ease;
        }
        input:focus {
            border-color: #00C6FF;
            outline: none;
        }
        .captcha-box {
            font-size: 22px;
            font-weight: bold;
            background: #00C6FF;
            color: white;
            padding: 10px;
            border-radius: 8px;
            margin: 10px 0;
            letter-spacing: 3px;
            display: inline-block;
            text-transform: uppercase;
        }
        button {
            width: 100%;
            padding: 12px;
            font-size: 18px;
            border: none;
            background: #00C6FF;
            color: white;
            border-radius: 8px;
            cursor: pointer;
            transition: 0.3s ease;
            font-weight: bold;
        }
        button:hover {
            background: #0072ff;
        }
        .back-to-login {
            margin-top: 10px;
            color: #333;
            font-size: 14px;
        }
        .back-to-login a {
            color: #00C6FF;
            text-decoration: none;
            font-weight: bold;
        }
        .back-to-login a:hover {
            color: #0072ff;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Forgot Password</h2>
        <form method="POST">
            <input type="text" name="prn" placeholder="Enter your PRN" required>
            <input type="text" name="username" placeholder="Enter your Username" required>
            
            <!-- CAPTCHA Section -->
            <p><strong>Enter the CAPTCHA below:</strong></p>
            <div class="captcha-box"><?php echo $_SESSION['captcha_text']; ?></div>
            <input type="text" name="captcha" placeholder="Enter CAPTCHA" required>
            
            <button type="submit">Verify</button>
        </form>
        <p class="back-to-login">Back to <a href="login.php">Login</a></p>
    </div>
</body>
</html>
