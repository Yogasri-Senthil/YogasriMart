<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="com.yogasri.yogasrimart.dao.UserDAO" %>
<%@ page import="com.yogasri.yogasrimart.model.User" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>YogasriMart - Manage Users</title>

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
            width: 90%;
            max-width: 1100px;
            margin: 45px auto;
        }

        .heading {
            text-align: center;
            margin-bottom: 30px;
        }

        .heading h1 {
            margin-bottom: 10px;
        }

        .heading p {
            color: #666;
        }

        .table-card {
            background: white;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th {
            background: #111827;
            color: white;
            padding: 13px;
            text-align: left;
        }

        td {
            padding: 13px;
            border-bottom: 1px solid #e5e7eb;
        }

        tr:hover {
            background: #f8fafc;
        }

        .role {
            padding: 5px 10px;
            border-radius: 15px;
            font-size: 13px;
            font-weight: bold;
        }

        .buyer {
            background: #dbeafe;
            color: #1d4ed8;
        }

        .seller {
            background: #dcfce7;
            color: #15803d;
        }

        .admin {
            background: #fef3c7;
            color: #b45309;
        }

        .back {
            text-align: center;
            margin-top: 30px;
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
            margin-top: 50px;
        }

        @media (max-width: 700px) {

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
        Manage Users
    </div>

</div>


<!-- Main -->

<div class="container">

    <div class="heading">

        <h1>
            👥 Manage Users
        </h1>

        <p>
            View registered buyers and sellers.
        </p>

    </div>


    <div class="table-card">

        <table>

            <thead>

            <tr>

                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Role</th>

            </tr>

            </thead>

            <tbody>

            <%
                UserDAO userDAO = new UserDAO();
                List<User> users = userDAO.getAllUsers();

                if (users != null && !users.isEmpty()) {

                    for (User user : users) {

                        String role = user.getRole();

                        String roleClass = "";

                        if ("BUYER".equalsIgnoreCase(role)) {
                            roleClass = "buyer";
                        } else if ("SELLER".equalsIgnoreCase(role)) {
                            roleClass = "seller";
                        } else if ("ADMIN".equalsIgnoreCase(role)) {
                            roleClass = "admin";
                        }
            %>

            <tr>

                <td>
                    <%= user.getId() %>
                </td>

                <td>
                    <%= user.getName() %>
                </td>

                <td>
                    <%= user.getEmail() %>
                </td>

                <td>

                    <span class="role <%= roleClass %>">
                        <%= user.getRole() %>
                    </span>

                </td>

            </tr>

            <%
                    }

                } else {
            %>

            <tr>

                <td colspan="4"
                    style="text-align:center; padding:25px;">

                    No users found.

                </td>

            </tr>

            <%
                }
            %>

            </tbody>

        </table>

    </div>


    <div class="back">

        <a href="admin.jsp">
            ← Back to Admin Dashboard
        </a>

    </div>

</div>


<!-- Footer -->

<footer>

    <p>
        © 2026 YogasriMart | Admin Panel 💙
    </p>

</footer>

</body>

</html>