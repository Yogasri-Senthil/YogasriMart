<%@ page import="java.util.List" %>
<%@ page import="com.yogasri.yogasrimart.model.Product" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>YogasriMart - My Products</title>

    <style>

        body {
            font-family: Arial, sans-serif;
            background: #f5f6fa;
            margin: 0;
            padding: 30px;
        }

        h1 {
            color: #111827;
            text-align: center;
        }

        .products {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            margin-top: 30px;
        }

        .product {
            background: white;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.08);
        }

        .product h2 {
            color: #0284c7;
            margin-bottom: 10px;
        }

        .price {
            font-size: 20px;
            font-weight: bold;
            color: #16a34a;
        }

        .stock {
            color: #555;
        }

        /* Buttons */

        .button-group {
            display: flex;
            gap: 10px;
            margin-top: 15px;
        }

        .edit-btn {
            padding: 10px 18px;
            background: #0284c7;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            font-weight: bold;
        }

        .edit-btn:hover {
            background: #0369a1;
        }

        .delete-btn {
            padding: 10px 18px;
            background: #dc2626;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-weight: bold;
        }

        .delete-btn:hover {
            background: #b91c1c;
        }

        /* Back Button */

        .back-btn {
            display: inline-block;
            margin-top: 30px;
            padding: 10px 18px;
            background: #111827;
            color: white;
            text-decoration: none;
            border-radius: 6px;
        }

        .back-btn:hover {
            background: #374151;
        }

        /* Empty */

        .empty {
            text-align: center;
            margin-top: 50px;
            color: #666;
        }

        /* Mobile */

        @media (max-width: 800px) {

            .products {
                grid-template-columns: 1fr;
            }

            .button-group {
                flex-direction: column;
            }

        }

    </style>

</head>

<body>

<h1>🛍️ My Products</h1>

<%

    List<Product> products =
            (List<Product>) request.getAttribute("products");

    if (products != null && !products.isEmpty()) {

%>

<div class="products">

<%

        for (Product product : products) {

%>

    <div class="product">

        <h2>
            <%= product.getName() %>
        </h2>

        <p>
            <%= product.getDescription() %>
        </p>

        <p>
            Category:
            <strong>
                <%= product.getCategory() %>
            </strong>
        </p>

        <p class="price">
            ₹<%= product.getPrice() %>
        </p>

        <p class="stock">
            Stock:
            <%= product.getStock() %>
        </p>


        <!-- Edit and Delete Buttons -->

        <div class="button-group">

            <!-- Edit Product -->

            <a href="edit-product?id=<%= product.getId() %>"
               class="edit-btn">

                Edit Product ✏️

            </a>


            <!-- Delete Product -->

            <form action="delete-product"
                  method="post"
                  onsubmit="return confirm('Are you sure you want to delete this product?');">

                <input type="hidden"
                       name="id"
                       value="<%= product.getId() %>">

                <button type="submit"
                        class="delete-btn">

                    Delete 🗑️

                </button>

            </form>

        </div>

    </div>

<%

        }

%>

</div>

<%

    } else {

%>

    <div class="empty">

        <h2>No products found.</h2>

        <p>
            You haven't added any products yet.
        </p>

    </div>

<%

    }
%>
<a href="seller.jsp" class="back-btn">
    ← Back to Seller Dashboard
</a>
</body>
</html>