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

        .product-section {
            display: flex;
            align-items: center;
            gap: 20px;
            margin-bottom: 20px;
        }

        .product-image {
            width: 150px;
            height: 150px;
            border-radius: 12px;
            overflow: hidden;
            background: #f3f4f6;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
        }

        .product-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .product-icon {
            font-size: 70px;
        }

        .product-info h2 {
            margin: 0;
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

        @media (max-width: 600px) {

            .product-section {
                flex-direction: column;
                align-items: flex-start;
            }

            .product-image {
                width: 130px;
                height: 130px;
            }

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

                <div class="product-section">

                    <div class="product-image">

                        <%
                            if (order.imagePath != null
                                    && !order.imagePath.trim().isEmpty()) {
                        %>

                            <img
                                src="<%= request.getContextPath() %>/<%= order.imagePath %>"
                                alt="<%= order.productName %>">

                        <%
                            } else {
                        %>

                            <div class="product-icon">
                                🛍️
                            </div>

                        <%
                            }
                        %>

                    </div>

                    <div class="product-info">

                        <h2>
                            <%= order.productName %>
                        </h2>

                    </div>

                </div>

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