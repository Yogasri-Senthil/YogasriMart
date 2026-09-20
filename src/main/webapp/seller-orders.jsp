<%@ page import="java.util.List" %>
<%@ page import="com.yogasri.yogasrimart.dao.OrderDAO" %>
<%@ page import="com.yogasri.yogasrimart.dao.OrderDAO.OrderData" %>
<%@ page import="com.yogasri.yogasrimart.model.User" %>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>YogasriMart - Seller Orders</title>

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
        }

        .logo {
            font-size: 25px;
            font-weight: bold;
        }

        .logo span {
            color: #38bdf8;
        }

        .container {
            width: 90%;
            max-width: 1100px;
            margin: 40px auto;
        }

        .order-card {
            background: white;
            padding: 25px;
            margin-bottom: 20px;
            border-radius: 12px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.08);
        }

        .order-card h2 {
            margin-top: 0;
        }

        .price {
            color: #0284c7;
            font-size: 20px;
            font-weight: bold;
        }

        .status {
            display: inline-block;
            padding: 7px 12px;
            border-radius: 6px;
            background: #dcfce7;
            color: #166534;
            font-weight: bold;
        }

        .empty {
            background: white;
            padding: 50px;
            text-align: center;
            border-radius: 12px;
        }

        .back {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            color: #0284c7;
            font-weight: bold;
        }

    </style>

</head>

<body>

<div class="navbar">

    <div class="logo">
        Yogasri<span>Mart</span>
    </div>

</div>

<div class="container">

    <h1>📦 Seller Orders</h1>

<%

    User seller = (User) session.getAttribute("user");

    if (seller == null || !"SELLER".equals(seller.getRole())) {

%>

        <div class="empty">
            <h2>Seller login required</h2>
        </div>

<%

    } else {

        OrderDAO orderDAO = new OrderDAO();

        List<OrderData> orders =
                orderDAO.getOrdersBySeller(seller.getId());

        if (orders.isEmpty()) {

%>

            <div class="empty">

                <h2>No Orders Available</h2>

                <p style="margin-top:10px;">
                    You have not received any orders yet.
                </p>

            </div>

<%

        } else {

            for (OrderData order : orders) {

%>

            <div class="order-card">

                <h2>
                    🛍️ <%= order.productName %>
                </h2>

                <p>
                    <strong>Order ID:</strong>
                    <%= order.id %>
                </p>

                <p>
                    <strong>Quantity:</strong>
                    <%= order.quantity %>
                </p>

                <p class="price">
                    Total: ₹<%= String.format("%.0f", order.totalPrice) %>
                </p>

                <hr>

                <p>
                    <strong>Customer:</strong>
                    <%= order.customerName %>
                </p>

                <p>
                    <strong>Address:</strong>
                    <%= order.address %>,
                    <%= order.city %> -
                    <%= order.pincode %>
                </p>

                <p>
                    <strong>Payment:</strong>
                    <%= order.paymentMethod %>
                </p>

                <p>
                    <strong>Status:</strong>
                    <span class="status">
                        <%= order.status %>
                    </span>
                </p>

            </div>

<%

            }

        }

    }

%>

    <a class="back" href="seller.jsp">
        ← Back to Seller Dashboard
    </a>

</div>

</body>

</html>