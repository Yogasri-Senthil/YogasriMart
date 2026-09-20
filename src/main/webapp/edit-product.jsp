<%@ page import="com.yogasri.yogasrimart.model.Product" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    Product product = (Product) request.getAttribute("product");

    if (product == null) {
        response.sendRedirect("my-products");
        return;
    }
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>YogasriMart - Edit Product</title>

    <style>

        body {
            font-family: Arial, sans-serif;
            background: #f5f6fa;
            margin: 0;
            padding: 30px;
        }

        .container {
            max-width: 600px;
            margin: 30px auto;
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 3px 15px rgba(0,0,0,0.1);
        }

        h1 {
            text-align: center;
            color: #111827;
            margin-bottom: 30px;
        }

        label {
            display: block;
            margin-top: 15px;
            margin-bottom: 6px;
            font-weight: bold;
            color: #374151;
        }

        input,
        textarea {
            width: 100%;
            padding: 11px;
            border: 1px solid #d1d5db;
            border-radius: 6px;
            box-sizing: border-box;
            font-size: 15px;
        }

        textarea {
            height: 100px;
            resize: vertical;
        }

        .update-btn {
            width: 100%;
            margin-top: 25px;
            padding: 12px;
            background: #0284c7;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
        }

        .update-btn:hover {
            background: #0369a1;
        }

        .back-btn {
            display: block;
            text-align: center;
            margin-top: 15px;
            padding: 10px;
            background: #111827;
            color: white;
            text-decoration: none;
            border-radius: 6px;
        }

        .back-btn:hover {
            background: #374151;
        }

    </style>

</head>

<body>

<div class="container">

    <h1>✏️ Edit Product</h1>

    <form action="edit-product" method="post">

        <input type="hidden"
               name="id"
               value="<%= product.getId() %>">

        <label>Product Name</label>

        <input type="text"
               name="name"
               value="<%= product.getName() %>"
               required>


        <label>Description</label>

        <textarea name="description"
                  required><%= product.getDescription() %></textarea>


        <label>Price (₹)</label>

        <input type="number"
               name="price"
               step="0.01"
               min="0"
               value="<%= product.getPrice() %>"
               required>


        <label>Category</label>

        <input type="text"
               name="category"
               value="<%= product.getCategory() %>"
               required>


        <label>Stock</label>

        <input type="number"
               name="stock"
               min="0"
               value="<%= product.getStock() %>"
               required>


        <button type="submit"
                class="update-btn">

            Update Product ✅

        </button>

    </form>


    <a href="my-products"
       class="back-btn">

        ← Back to My Products

    </a>

</div>

</body>

</html>