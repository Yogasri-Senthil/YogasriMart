<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.yogasri.yogasrimart.util.DatabaseConnection" %>

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

        .error {
            text-align: center;
            padding: 30px;
            color: #dc2626;
            background: #fee2e2;
            border-radius: 10px;
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


<!-- Navigation -->

<div class="navbar">

    <div class="logo">
        Yogasri<span>Mart</span>
    </div>

    <div class="admin-label">
        Admin &rarr; Manage Orders
    </div>

</div>


<!-- Main Container -->

<div class="container">


    <!-- Heading -->

    <div class="welcome">

        <h1>
            Manage Orders
        </h1>

        <p>
            View all orders placed by buyers.
        </p>

    </div>


    <div class="table-container">


        <%
            String sql =
                    "SELECT id, buyer_id, seller_id, product_id, " +
                    "product_name, quantity, total_price, " +
                    "customer_name, address, city, pincode, " +
                    "payment_method, status, created_at " +
                    "FROM orders ORDER BY id DESC";

            boolean hasOrders = false;

            try (
                    Connection connection =
                            DatabaseConnection.getConnection();

                    PreparedStatement statement =
                            connection.prepareStatement(sql);

                    ResultSet resultSet =
                            statement.executeQuery()
            ) {

        %>


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


            <%

                while (resultSet.next()) {

                    hasOrders = true;

            %>


                <tr>

                    <td class="order-id">
                        <%= resultSet.getInt("id") %>
                    </td>

                    <td>
                        <%= resultSet.getInt("buyer_id") %>
                    </td>

                    <td>
                        <%= resultSet.getInt("seller_id") %>
                    </td>

                    <td>
                        <%= resultSet.getInt("product_id") %>
                    </td>

                    <td>
                        <strong>
                            <%= resultSet.getString("product_name") %>
                        </strong>
                    </td>

                    <td>
                        <%= resultSet.getInt("quantity") %>
                    </td>

                    <td class="price">
                        &#8377;<%= String.format(
                                "%.2f",
                                resultSet.getDouble("total_price")
                        ) %>
                    </td>

                    <td>
                        <%= resultSet.getString("customer_name") %>
                    </td>

                    <td>
                        <%= resultSet.getString("address") %>
                    </td>

                    <td>
                        <%= resultSet.getString("city") %>
                    </td>

                    <td>
                        <%= resultSet.getString("pincode") %>
                    </td>

                    <td>
                        <%= resultSet.getString("payment_method") %>
                    </td>

                    <td>

                        <span class="status">
                            <%= resultSet.getString("status") %>
                        </span>

                    </td>

                    <td>
                        <%= resultSet.getTimestamp("created_at") %>
                    </td>

                </tr>

            <%

                }

            %>

            </tbody>

        </table>

        <%

            if (!hasOrders) {

        %>

            <div class="empty">

                <h2>
                    No Orders Found
                </h2>

                <p>
                    No orders have been placed yet.
                </p>

            </div>

        <%

            }

        } catch (Exception e) {

        %>

            <div class="error">

                <h2>
                    Unable to Load Orders
                </h2>

                <p>
                    Please check the database connection.
                </p>

            </div>

        <%

                e.printStackTrace();

            }

        %>

    </div>

    <!-- Back Button -->

    <div class="back">

        <a href="admin.jsp">
            &larr; Back to Admin Dashboard
        </a>

    </div>


</div>

<!-- Footer -->

<footer>

    <p>
        &copy; 2026 YogasriMart | Admin Panel
    </p>

</footer>

</body>

</html>