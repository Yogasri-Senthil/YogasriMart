<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="java.util.List" %>
<%@ page import="com.yogasri.yogasrimart.dao.ProductDAO" %>
<%@ page import="com.yogasri.yogasrimart.model.Product" %>

<%
    ProductDAO productDAO = new ProductDAO();
    List<Product> products = productDAO.getAllProducts();
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>YogasriMart - Manage Products</title>

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
            width: 90%;
            max-width: 1200px;
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
        }

        th {
            background: #111827;
            color: white;
            padding: 14px;
            text-align: left;
            white-space: nowrap;
        }

        td {
            padding: 14px;
            border-bottom: 1px solid #e5e7eb;
            vertical-align: middle;
        }

        tr:hover {
            background: #f8fafc;
        }

        .product-name {
            font-weight: bold;
        }

        .price {
            color: #0284c7;
            font-weight: bold;
            white-space: nowrap;
        }

        .stock {
            font-weight: bold;
        }

        .empty {
            text-align: center;
            padding: 45px;
            color: #666;
        }

        .empty h2 {
            margin-bottom: 10px;
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

            th,
            td {
                font-size: 13px;
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
        Admin &rarr; Manage Products
    </div>

</div>


<!-- Main Container -->

<div class="container">


    <!-- Heading -->

    <div class="welcome">

        <h1>
            Manage Products
        </h1>

        <p>
            View all products added by sellers.
        </p>

    </div>


    <!-- Product Table -->

    <div class="table-container">

        <% if (products == null || products.isEmpty()) { %>


            <div class="empty">

                <h2>
                    No Products Found
                </h2>

                <p>
                    No products have been added yet.
                </p>

            </div>


        <% } else { %>


            <table>

                <thead>

                <tr>

                    <th>
                        ID
                    </th>

                    <th>
                        Product Name
                    </th>

                    <th>
                        Description
                    </th>

                    <th>
                        Price
                    </th>

                    <th>
                        Category
                    </th>

                    <th>
                        Stock
                    </th>

                    <th>
                        Seller ID
                    </th>

                </tr>

                </thead>


                <tbody>


                <% for (Product product : products) { %>

                    <tr>

                        <td>
                            <%= product.getId() %>
                        </td>


                        <td class="product-name">
                            <%= product.getName() %>
                        </td>


                        <td>
                            <%= product.getDescription() %>
                        </td>


                        <td class="price">

                            &#8377;<%= String.format("%.2f", product.getPrice()) %>

                        </td>


                        <td>
                            <%= product.getCategory() %>
                        </td>


                        <td class="stock">
                            <%= product.getStock() %>
                        </td>


                        <td>
                            <%= product.getSellerId() %>
                        </td>

                    </tr>

                <% } %>


                </tbody>

            </table>


        <% } %>

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