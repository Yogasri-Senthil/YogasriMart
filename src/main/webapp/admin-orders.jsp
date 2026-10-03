<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="java.util.List" %>
<%@ page import="com.yogasri.yogasrimart.dao.OrderDAO" %>
<%@ page import="com.yogasri.yogasrimart.dao.OrderDAO.OrderData" %>

<%
    OrderDAO orderDAO = new OrderDAO();
    List<OrderData> orders = orderDAO.getAllOrders();
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>YogasriMart - Manage Orders</title>

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
            color: #cbd5e1;
            font-size: 15px;
        }

        .container {
            width: 95%;
            max-width: 1400px;
            margin: 45px auto;
        }

        .welcome {
            text-align: center;
            margin-bottom: 35px;
        }

        .welcome h1 {
            font-size: 34px;
            margin-bottom: 10px;
        }

        .welcome p {
            color: #666;
            font-size: 16px;
        }

        .table-container {
            background: white;
            padding: 25px;
            border-radius: 14px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            min-width: 1200px;
        }

        th {
            background: #111827;
            color: white;
            padding: 14px;
            text-align: left;
            white-space: nowrap;
        }

        td {
            padding: 13px;
            border-bottom: 1px solid #e5e7eb;
            vertical-align: middle;
        }

        tr:hover {
            background: #f8fafc;
        }

        .order-id {
            font-weight: bold;
        }

        .price {
            color: #0284c7;
            font-weight: bold;
            white-space: nowrap;
        }

        .status {
            display: inline-block;
            padding: 6px 12px;
            border-radius: 20px;
            background: #dcfce7;
            color: #166534;
            font-weight: bold;
            font-size: 13px;
        }

        .empty {
            text-align: center;
            padding: 45px;
            color: #666;
        }

        .back {
            text-align: center;
            margin-top: 35px;
        }

        .back a {
            display: inline-block;
            padding: 11px 22px;
            border-radius: 7px;
            background: #0284c7;
            color: white;
            text-decoration: none;
            font-size: 15px;
        }

        .back a:hover {
            background: #0369a1;
        }

        footer {
            background: #111827;
            color: white;
            text-align: center;
            padding: 25px;
            margin-top: 60px;
        }

        @media (max-width: 800px) {

            .navbar {
                flex-direction: column;
                gap: 10px;
            }

            .container {
                width: 95%;
            }

        }

    </style>

</head>

<body>

<div class="navbar">

    <div class="logo">
        Yogasri<span>Mart</span>
    </div>

    <div class="admin-label">
        Admin &rarr; Manage Orders
    </div>

</div>

<div class="container">

    <div class="welcome">

        <h1>
            Manage Orders
        </h1>

        <p>
            View all orders placed by buyers.
        </p>

    </div>

    <div class="table-container">

        <% if (orders == null || orders.isEmpty()) { %>

            <div class="empty">

                <h2>
                    No Orders Found
                </h2>

                <p>
                    No orders have been placed yet.
                </p>

            </div>

        <% } else { %>

            <table>

                <thead>

                <tr>

                    <th>
                        Order ID
                    </th>

                    <th>
                        Buyer ID
                    </th>

                    <th>
                        Seller ID
                    </th>

                    <th>
                        Product ID
                    </th>

                    <th>
                        Product Name
                    </th>

                    <th>
                        Quantity
                    </th>

                    <th>
                        Total Price
                    </th>

                    <th>
                        Customer Name
                    </th>

                    <th>
                        Address
                    </th>

                    <th>
                        City
                    </th>

                    <th>
                        Pincode
                    </th>

                    <th>
                        Payment
                    </th>

                    <th>
                        Status
                    </th>

                    <th>
                        Date
                    </th>

                </tr>

                </thead>

                <tbody>

                <% for (OrderData order : orders) { %>

                    <tr>

                        <td class="order-id">
                            <%= order.id %>
                        </td>

                        <td>
                            <%= order.buyerId %>
                        </td>

                        <td>
                            <%= order.sellerId %>
                        </td>

                        <td>
                            <%= order.productId %>
                        </td>

                        <td>
                            <strong>
                                <%= order.productName %>
                            </strong>
                        </td>

                        <td>
                            <%= order.quantity %>
                        </td>

                        <td class="price">
                            &#8377;<%= String.format("%.2f", order.totalPrice) %>
                        </td>

                        <td>
                            <%= order.customerName %>
                        </td>

                        <td>
                            <%= order.address %>
                        </td>

                        <td>
                            <%= order.city %>
                        </td>

                        <td>
                            <%= order.pincode %>
                        </td>

                        <td>
                            <%= order.paymentMethod %>
                        </td>

                        <td>

                            <span class="status">
                                <%= order.status %>
                            </span>

                        </td>

                        <td>
                            <%= order.createdAt %>
                        </td>

                    </tr>

                <% } %>

                </tbody>

            </table>

        <% } %>

    </div>

    <div class="back">

        <a href="admin.jsp">
            &larr; Back to Admin Dashboard
        </a>

    </div>

</div>

<footer>

    <p>
        &copy; 2026 YogasriMart | Admin Panel
    </p>

</footer>

</body>

</html>