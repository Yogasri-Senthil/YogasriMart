<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>YogasriMart - Admin Dashboard</title>

    <style>

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        body {
            background: #f5f6fa;
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

        .admin-label {
            font-size: 15px;
            color: #cbd5e1;
        }

        .container {
            width: 86%;
            max-width: 1100px;
            margin: 45px auto;
        }

        .welcome {
            text-align: center;
            margin-bottom: 40px;
        }

        .welcome h1 {
            font-size: 34px;
            margin-bottom: 10px;
        }

        .welcome p {
            color: #666;
            font-size: 16px;
        }

        .dashboard {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 25px;
        }

        .card {
            background: white;
            padding: 35px 25px;
            text-align: center;
            border-radius: 14px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
            transition: 0.3s;
        }

        .card:hover {
            transform: translateY(-6px);
        }

        .card-icon {
            font-size: 55px;
            margin-bottom: 18px;
        }

        .card h2 {
            margin-bottom: 10px;
        }

        .card p {
            color: #666;
            line-height: 1.5;
            margin-bottom: 22px;
        }

        .btn {
            display: inline-block;
            padding: 11px 22px;
            border-radius: 7px;
            background: #0284c7;
            color: white;
            text-decoration: none;
            font-size: 15px;
        }

        .btn:hover {
            background: #0369a1;
        }

        .back {
            text-align: center;
            margin-top: 35px;
        }

        .back a {
            color: #0284c7;
            text-decoration: none;
            font-weight: bold;
        }

        footer {
            background: #111827;
            color: white;
            text-align: center;
            padding: 25px;
            margin-top: 60px;
        }

        @media (max-width: 800px) {

            .dashboard {
                grid-template-columns: 1fr;
            }

            .navbar {
                flex-direction: column;
                gap: 10px;
            }

        }

    </style>

</head>

<body>

<!-- Navigation -->

<div class="navbar">

    <div class="logo">
        🛍️ Yogasri<span>Mart</span>
    </div>

    <div class="admin-label">
        Admin Dashboard
    </div>

</div>


<!-- Main Container -->

<div class="container">

    <div class="welcome">

        <h1>
            👋 Welcome, Admin
        </h1>

        <p>
            Manage users, products and orders from one place.
        </p>

    </div>


    <!-- Dashboard Cards -->

    <div class="dashboard">


        <!-- Users -->

        <div class="card">

            <div class="card-icon">
                👥
            </div>

            <h2>
                Manage Users
            </h2>

            <p>
                View and manage registered buyers and sellers.
            </p>

            <a href="admin-users.jsp"
               class="btn">

                Manage Users

            </a>

        </div>


        <!-- Products -->

        <div class="card">

            <div class="card-icon">
                📦
            </div>

            <h2>
                Manage Products
            </h2>

            <p>
                View and manage products added by sellers.
            </p>

            <a href="admin-products.jsp"
               class="btn">

                Manage Products

            </a>

        </div>


        <!-- Orders -->

        <div class="card">

            <div class="card-icon">
                🛒
            </div>

            <h2>
                Manage Orders
            </h2>

            <p>
                View orders placed by buyers and their status.
            </p>

            <a href="admin-orders.jsp"
               class="btn">

                Manage Orders

            </a>

        </div>


    </div>


    <!-- Back -->

    <div class="back">

        <a href="home.jsp">
            ← Go to Home
        </a>

    </div>

</div>


<!-- Footer -->

<footer>

    <p>
        © 2026 YogasriMart |
        Admin Panel 💙
    </p>

</footer>

</body>

</html>