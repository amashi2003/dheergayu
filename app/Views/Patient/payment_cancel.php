<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Cancelled - Dheergayu</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;600;700&display=swap');
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(135deg, #ff6b6b 0%, #ee5a6f 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .cancel-container {
            background: white;
            border-radius: 20px;
            padding: 60px 40px;
            text-align: center;
            max-width: 500px;
            width: 100%;
            box-shadow: 0 20px 60px rgba(0,0,0,0.3);
        }

        .cancel-icon {
            width: 100px;
            height: 100px;
            background: #ff6b6b;
            border-radius: 50%;
            margin: 0 auto 30px;
            display: flex;
            align-items: center;
            justify-content: center;
            animation: shake 0.5s ease;
        }

        .cancel-icon::before {
            content: '✕';
            font-size: 60px;
            color: white;
            font-weight: bold;
        }

        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            25% { transform: translateX(-10px); }
            75% { transform: translateX(10px); }
        }

        h1 {
            color: #333;
            font-size: 2rem;
            margin-bottom: 15px;
        }

        .message {
            color: #666;
            font-size: 1.1rem;
            line-height: 1.6;
            margin-bottom: 30px;
        }

        .info-box {
            background: #fff3cd;
            border-left: 4px solid #ffc107;
            padding: 15px;
            border-radius: 5px;
            margin: 25px 0;
            text-align: left;
        }

        .info-box h3 {
            color: #856404;
            margin-bottom: 10px;
            font-size: 1rem;
        }

        .info-box p {
            color: #555;
            font-size: 0.9rem;
            line-height: 1.5;
        }

        .btn {
            display: inline-block;
            padding: 15px 40px;
            background: linear-gradient(135deg, #8B7355, #A0916B);
            color: white;
            text-decoration: none;
            border-radius: 10px;
            font-weight: 600;
            font-size: 1rem;
            transition: all 0.3s;
            margin: 10px;
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 20px rgba(139, 115, 85, 0.4);
        }

        .btn-retry {
            background: linear-gradient(135deg, #ff6b6b, #ee5a6f);
        }
    </style>
</head>
<body>
    <div class="cancel-container">
        <div class="cancel-icon"></div>
        
        <h1>Payment Cancelled</h1>
        
        <p class="message">
            Your payment was cancelled or failed. Don't worry, no charges were made to your account.
        </p>

        <div class="info-box">
            <h3>💡 What happened?</h3>
            <p>You may have clicked the cancel button, closed the payment window, or encountered a payment processing error.</p>
        </div>

        <div class="info-box">
            <h3>🛒 Your Cart is Safe</h3>
            <p>All items are still in your cart. You can retry the payment anytime.</p>
        </div>

        <div style="margin-top: 40px;">
            <a href="/dheergayu/app/Views/Patient/cart.php" class="btn btn-retry">Try Again</a>
            <a href="/dheergayu/app/Views/Patient/home.php" class="btn">Back to Home</a>
        </div>
    </div>
</body>
</html>