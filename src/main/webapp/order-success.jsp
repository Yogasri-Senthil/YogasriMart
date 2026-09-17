<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>YogasriMart - Order Success</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }
        body {
            background: #f5f6fa;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            color: #222;
        }
        .success-box {
            background: white;
            width: 90%;
            max-width: 500px;
            padding: 45px 30px;
            text-align: center;
            border-radius: 15px;
            box-shadow: 0 4px 18px rgba(0,0,0,0.1);
        }
        .success-icon {
            font-size: 70px;
            margin-bottom: 15px;
        }
        h1 {
            margin-bottom: 12px;
        }
        p {
            color: #666;
            margin-bottom: 25px;
        }
        .home-btn {
            display: inline-block;
            background: #0284c7;
            color: white;
            padding: 12px 25px;
            border-radius: 8px;
            text-decoration: none;
        }
        .products-btn {
            display: inline-block;
            background: #111827;
            color: white;
            padding: 12px 25px;
            border-radius: 8px;
            text-decoration: none;
            margin-left: 8px;
        }
    </style>
</head>
<body>
<div class="success-box">
    <div class="success-icon">
        ✅
    </div>
    <h1>Order Placed Successfully!</h1>
    <p>
        Thank you for shopping with YogasriMart.
        Your order has been placed successfully.
    </p>
    <a href="home.jsp" class="home-btn">
        Go to Home
    </a>
    <a href="products.jsp" class="products-btn">
        Continue Shopping
    </a>
</div>
</body>
</html>