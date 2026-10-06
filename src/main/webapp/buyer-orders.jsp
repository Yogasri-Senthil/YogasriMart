<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.yogasri.yogasrimart.dao.OrderDAO" %>

<%
List<OrderDAO.OrderData> orders =
        (List<OrderDAO.OrderData>) request.getAttribute("orders");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Orders - YogasriMart</title>

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f3f4f6;
        }

        .navbar {
            background: #111827;
            padding: 18px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            color: #38bdf8;
            font-size: 24px;
            font-weight: bold;
        }

        .nav-links a {
            color: white;
            text-decoration: none;
            margin-left: 25px;
            font-size: 15px;
        }

        .container {
            width: 90%;
            max-width: 1100px;
            margin: 35px auto;
        }

        h1 {
            color: #111827;
            margin-bottom: 25px;
        }

        .empty {
            background: white;
            padding: 40px;
            text-align: center;
            border-radius: 12px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.08);
        }

        .order-card {
            background: white;
            border-radius: 12px;
            padding: 22px;
            margin-bottom: 20px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.08);
        }

        .order-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid #e5e7eb;
            padding-bottom: 12px;
            margin-bottom: 15px;
        }

        .order-id {
            font-weight: bold;
            color: #111827;
        }

        .status {
            padding: 7px 13px;
            border-radius: 20px;
            font-size: 13px;
            font-weight: bold;
        }

        .PLACED {
            background: #dbeafe;
            color: #1d4ed8;
        }

        .SHIPPED {
            background: #fef3c7;
            color: #92400e;
        }

        .DELIVERED {
            background: #dcfce7;
            color: #166534;
        }

        .COMPLETED {
            background: #d1fae5;
            color: #065f46;
        }

        .CANCELLED {
            background: #fee2e2;
            color: #991b1b;
        }

        .order-content {
            display: flex;
            gap: 20px;
            align-items: center;
        }

        .product-image {
            width: 110px;
            height: 110px;
            object-fit: cover;
            border-radius: 10px;
            border: 1px solid #e5e7eb;
        }

        .product-info {
            flex: 1;
        }

        .product-name {
            font-size: 20px;
            font-weight: bold;
            color: #111827;
            margin-bottom: 8px;
        }

        .details {
            color: #4b5563;
            line-height: 1.8;
        }

        .total {
            font-size: 18px;
            font-weight: bold;
            color: #111827;
            margin-top: 8px;
        }

        .review-box {
            margin-top: 20px;
            padding: 20px;
            background: #f8fafc;
            border: 1px solid #e5e7eb;
            border-radius: 10px;
        }

        .review-box h3 {
            margin-top: 0;
            color: #111827;
        }

        .rating {
            display: flex;
            gap: 8px;
            margin: 12px 0;
        }

        .rating input {
            display: none;
        }

        .rating label {
            font-size: 28px;
            color: #d1d5db;
            cursor: pointer;
        }

        .rating input:checked + label {
            color: #f59e0b;
        }

        .review-box textarea {
            width: 100%;
            min-height: 80px;
            padding: 10px;
            border: 1px solid #d1d5db;
            border-radius: 7px;
            resize: vertical;
            font-family: Arial, sans-serif;
            box-sizing: border-box;
        }

        .review-btn {
            margin-top: 12px;
            padding: 10px 18px;
            background: #0284c7;
            color: white;
            border: none;
            border-radius: 7px;
            cursor: pointer;
            font-weight: bold;
        }

        .review-btn:hover {
            background: #0369a1;
        }

        .back-btn {
            display: inline-block;
            margin-top: 25px;
            padding: 11px 20px;
            background: #111827;
            color: white;
            text-decoration: none;
            border-radius: 7px;
        }

        .back-btn:hover {
            background: #1f2937;
        }

        .message {
            padding: 12px;
            margin-bottom: 20px;
            background: #dcfce7;
            color: #166534;
            border-radius: 7px;
        }

        @media (max-width: 700px) {
            .navbar {
                padding: 15px 20px;
            }

            .nav-links a {
                margin-left: 10px;
            }

            .container {
                width: 94%;
            }

            .order-content {
                flex-direction: column;
                align-items: flex-start;
            }
        }
    </style>
</head>

<body>

<div class="navbar">
    <div class="logo">YogasriMart</div>

    <div class="nav-links">
        <a href="home.jsp">Home</a>
        <a href="products">Products</a>
        <a href="cart.jsp">Cart</a>
    </div>
</div>

<div class="container">

    <h1>My Orders</h1>

    <%
        String success = request.getParameter("success");
        String error = request.getParameter("error");

        if ("reviewAdded".equals(success)) {
    %>

        <div class="message">
            Review submitted successfully! ⭐
        </div>

    <%
        }

        if (orders == null || orders.isEmpty()) {
    %>

        <div class="empty">
            <h2>No Orders Yet</h2>
            <p>You have not placed any orders.</p>
            <a href="products" class="back-btn">Start Shopping</a>
        </div>

    <%
        } else {
            for (OrderDAO.OrderData order : orders) {
    %>

        <div class="order-card">

            <div class="order-header">

                <div class="order-id">
                    Order #<%= order.id %>
                </div>

                <div class="status <%= order.status %>">
                    <%= order.status %>
                </div>

            </div>

            <div class="order-content">

                <%
                    if (order.imagePath != null &&
                        !order.imagePath.trim().isEmpty()) {
                %>

                    <img
                        class="product-image"
                        src="<%= request.getContextPath() %>/product-images/<%= order.imagePath.replace("product-images/", "") %>"
                        alt="<%= order.productName %>"
                    >

                <%
                    }
                %>

                <div class="product-info">

                    <div class="product-name">
                        <%= order.productName %>
                    </div>

                    <div class="details">
                        Quantity: <%= order.quantity %><br>
                        Payment: <%= order.paymentMethod %><br>
                        Customer: <%= order.customerName %><br>
                        Address: <%= order.address %>, <%= order.city %> - <%= order.pincode %>
                    </div>

                    <div class="total">
                        Total: ₹<%= String.format("%.2f", order.totalPrice) %>
                    </div>

                </div>

            </div>

            <%
                if ("COMPLETED".equals(order.status)) {
            %>

                <div class="review-box">

                    <h3>Rate this product ⭐</h3>

                    <form action="add-review" method="post">

                        <input
                            type="hidden"
                            name="productId"
                            value="<%= order.productId %>"
                        >

                        <input
                            type="hidden"
                            name="orderId"
                            value="<%= order.id %>"
                        >

                        <div class="rating">

                            <input type="radio" id="star5_<%= order.id %>" name="rating" value="5" required>
                            <label for="star5_<%= order.id %>">★</label>

                            <input type="radio" id="star4_<%= order.id %>" name="rating" value="4">
                            <label for="star4_<%= order.id %>">★</label>

                            <input type="radio" id="star3_<%= order.id %>" name="rating" value="3">
                            <label for="star3_<%= order.id %>">★</label>

                            <input type="radio" id="star2_<%= order.id %>" name="rating" value="2">
                            <label for="star2_<%= order.id %>">★</label>

                            <input type="radio" id="star1_<%= order.id %>" name="rating" value="1">
                            <label for="star1_<%= order.id %>">★</label>

                        </div>

                        <textarea
                            name="comment"
                            maxlength="500"
                            placeholder="Write your review..."
                        ></textarea>

                        <br>

                        <button type="submit" class="review-btn">
                            Submit Review ⭐
                        </button>

                    </form>

                </div>

            <%
                }
            %>

        </div>

    <%
            }
        }
    %>

    <a href="home.jsp" class="back-btn">Back to Home</a>

</div>

</body>
</html>