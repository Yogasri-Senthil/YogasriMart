<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>YogasriMart - Seller</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f5f6fa;
            margin: 0;
            color: #222;
        }
        .navbar {
            background: #111827;
            color: white;
            padding: 18px 7%;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .logo {
            font-size: 25px;
            font-weight: bold;
        }
        .logo span {
            color: #38bdf8;
        }
        .container {
            width: 85%;
            max-width: 1000px;
            margin: 50px auto;
        }
        .welcome {
            text-align: center;
            margin-bottom: 35px;
        }
        .welcome h1 {
            margin-bottom: 10px;
        }
        .welcome p {
            color: #666;
        }
        .dashboard {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 25px;
        }
        .card {
            background: white;
            padding: 30px;
            text-align: center;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
        }
        .card-icon {
            font-size: 50px;
            margin-bottom: 15px;
        }
        .card h2 {
            margin-bottom: 10px;
        }
        .card p {
            color: #666;
            margin-bottom: 20px;
        }
        .btn {
            display: inline-block;
            padding: 11px 20px;
            border-radius: 7px;
            background: #0284c7;
            color: white;
            text-decoration: none;
            border: none;
            cursor: pointer;
            font-size: 15px;
        }
        .btn:hover {
            background: #0369a1;
        }
        .home {
            text-align: center;
            margin-top: 35px;
        }
        .home a {
            color: #0284c7;
            text-decoration: none;
            font-weight: bold;
        }
        @media (max-width: 800px) {
            .dashboard {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
<div class="navbar">
    <div class="logo">
        Yogasri<span>Mart</span>
    </div>
    <div>
        Seller Dashboard
    </div>
</div>
<div class="container">
    <div class="welcome">
        <h1>Welcome to YogasriMart Seller Page</h1>
        <p>You are logged in as a Seller.</p>
    </div>
    <div class="dashboard">
        <!-- Add Product -->
        <div class="card">
            <div class="card-icon">➕</div>
            <h2>Add Product</h2>
            <p>Add a new product to YogasriMart.</p>
            <a href="add-product.jsp" class="btn">
                Add Product
            </a>
        </div>
        <!-- My Products -->
        <div class="card">
            <div class="card-icon">📦</div>
            <h2>My Products</h2>
            <p>View and manage your products.</p>
            <a href="my-products" class="btn">
                My Products
            </a>
        </div>
        <!-- Orders -->
        <div class="card">
            <div class="card-icon">🛒</div>
            <h2>Orders</h2>
            <p>View orders received from buyers.</p>
            <a href="seller-orders.jsp" class="btn">
                View Orders
            </a>
        </div>
    </div>
    <div class="home">
        <a href="home.jsp">← Go to Home</a>
    </div>
</div>
</body>
</html>