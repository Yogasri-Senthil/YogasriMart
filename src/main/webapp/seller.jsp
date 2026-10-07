<%@ page import="com.yogasri.yogasrimart.dao.OrderDAO.SellerStats" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    SellerStats sellerStats =
            (SellerStats) request.getAttribute("sellerStats");

    int totalOrders = 0;
    double totalRevenue = 0;
    int activeOrders = 0;

    if (sellerStats != null) {
        totalOrders = sellerStats.totalOrders;
        totalRevenue = sellerStats.totalRevenue;
        activeOrders = sellerStats.activeOrders;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>YogasriMart - Seller Dashboard</title>

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
            max-width: 1100px;
            margin: 45px auto;
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

        .stats {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            margin-bottom: 35px;
        }

        .stat-card {
            background: white;
            padding: 25px;
            border-radius: 12px;
            text-align: center;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
        }

        .stat-icon {
            font-size: 38px;
            margin-bottom: 10px;
        }

        .stat-card h2 {
            margin: 8px 0;
            font-size: 30px;
            color: #0284c7;
        }

        .stat-card p {
            margin: 0;
            color: #666;
            font-size: 15px;
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
            .stats,
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

        <h1>Welcome to YogasriMart Seller Dashboard</h1>

        <p>You are logged in as a Seller.</p>

    </div>


    <div class="stats">

        <div class="stat-card">

            <div class="stat-icon">📦</div>

            <h2><%= totalOrders %></h2>

            <p>Total Orders</p>

        </div>


        <div class="stat-card">

            <div class="stat-icon">💰</div>

            <h2>₹<%= String.format("%.2f", totalRevenue) %></h2>

            <p>Total Revenue</p>

        </div>


        <div class="stat-card">

            <div class="stat-icon">🚚</div>

            <h2><%= activeOrders %></h2>

            <p>Active Orders</p>

        </div>

    </div>


    <div class="dashboard">

        <div class="card">

            <div class="card-icon">➕</div>

            <h2>Add Product</h2>

            <p>Add a new product to YogasriMart.</p>

            <a href="add-product.jsp" class="btn">
                Add Product
            </a>

        </div>


        <div class="card">

            <div class="card-icon">📦</div>

            <h2>My Products</h2>

            <p>View and manage your products.</p>

            <a href="my-products" class="btn">
                My Products
            </a>

        </div>


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

        <a href="home.jsp">
            ← Go to Home
        </a>

    </div>

</div>

</body>
</html>