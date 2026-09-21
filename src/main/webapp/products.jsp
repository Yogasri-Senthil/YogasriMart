<%@ page import="java.util.List" %>
<%@ page import="com.yogasri.yogasrimart.model.Product" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>YogasriMart - Products</title>

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

        /* NAVBAR */

        .navbar {
            background: #111827;
            color: white;
            padding: 18px 7%;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .logo {
            font-size: 25px;
            font-weight: bold;
        }

        .logo span {
            color: #38bdf8;
        }

        .nav-links a {
            color: white;
            text-decoration: none;
            margin-left: 25px;
            font-size: 15px;
        }

        .nav-links a:hover {
            color: #38bdf8;
        }

        /* HEADER */

        .page-header {
            text-align: center;
            padding: 40px 20px 20px;
        }

        .page-header h1 {
            font-size: 36px;
            margin-bottom: 10px;
        }

        .page-header p {
            color: #666;
            font-size: 17px;
        }

        /* SEARCH */

        .search-box {
            text-align: center;
            margin: 20px auto 30px;
        }

        .search-box input {
            width: 60%;
            max-width: 600px;
            padding: 13px 18px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 16px;
            outline: none;
        }

        .search-box input:focus {
            border-color: #0284c7;
        }

        /* CATEGORY BUTTONS */

        .categories {
            display: flex;
            justify-content: center;
            gap: 12px;
            flex-wrap: wrap;
            margin-bottom: 35px;
        }

        .category-btn {
            display: inline-block;
            padding: 10px 18px;
            border: none;
            background: white;
            border-radius: 20px;
            cursor: pointer;
            box-shadow: 0 2px 8px rgba(0,0,0,0.08);
            text-decoration: none;
            color: #222;
            font-size: 14px;
        }

        .category-btn:hover {
            background: #0284c7;
            color: white;
        }

        /* PRODUCTS */

        .products {
            padding: 0 7% 50px;
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 25px;
        }

        .product-card {
            background: white;
            border-radius: 14px;
            padding: 22px;
            text-align: center;
            box-shadow: 0 3px 12px rgba(0,0,0,0.08);
            transition: 0.3s;
        }

        .product-card:hover {
            transform: translateY(-6px);
        }

        /* OLD PRODUCT ICON */

        .product-image {
            font-size: 75px;
            margin-bottom: 15px;
        }

        .product-card h3 {
            margin-bottom: 8px;
        }

        .description {
            color: #666;
            font-size: 14px;
            min-height: 35px;
        }

        .price {
            color: #0284c7;
            font-size: 21px;
            font-weight: bold;
            margin: 12px 0;
        }

        /* BUTTONS */

        .product-buttons {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 8px;
        }

        .cart-btn {
            border: none;
            background: #111827;
            color: white;
            padding: 10px 14px;
            border-radius: 6px;
            cursor: pointer;
        }

        .cart-btn:hover {
            background: #0284c7;
        }

        .wish-btn {
            border: none;
            background: #fee2e2;
            padding: 10px 14px;
            border-radius: 6px;
            cursor: pointer;
        }

        .wish-btn:hover {
            background: #fecaca;
        }

        /* NO PRODUCTS */

        .no-products {
            grid-column: 1 / -1;
            background: white;
            padding: 50px;
            text-align: center;
            border-radius: 12px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.08);
        }

        /* FOOTER */

        footer {
            background: #111827;
            color: white;
            text-align: center;
            padding: 25px;
        }

        /* MOBILE */

        @media (max-width: 1000px) {

            .products {
                grid-template-columns: repeat(2, 1fr);
            }

        }

        @media (max-width: 600px) {

            .navbar {
                flex-direction: column;
                gap: 15px;
            }

            .nav-links a {
                margin-left: 10px;
            }

            .search-box input {
                width: 85%;
            }

            .products {
                grid-template-columns: 1fr;
            }

        }

    </style>

</head>


<body>


<!-- NAVIGATION -->

<div class="navbar">

    <div class="logo">
        🛍️ Yogasri<span>Mart</span>
    </div>

    <div class="nav-links">

        <a href="home.jsp">
            Home
        </a>

        <a href="products">
            Products
        </a>

        <a href="wishlist.jsp">
            Wishlist ❤️
        </a>

        <a href="cart.jsp">
            Cart 🛒
        </a>

    </div>

</div>


<!-- PAGE HEADER -->

<section class="page-header">

    <h1>
        🛍️ Our Products
    </h1>

    <p>
        Discover amazing products at the best prices.
    </p>

</section>


<!-- SEARCH -->

<div class="search-box">

    <input
        type="text"
        id="searchInput"
        placeholder="🔍 Search for products..."
        onkeyup="searchProducts()">

</div>


<!-- CATEGORY FILTER -->

<div class="categories">

    <a href="products"
       class="category-btn">
        All
    </a>

    <a href="products?category=Electronics"
       class="category-btn">
        💻 Electronics
    </a>

    <a href="products?category=Fashion"
       class="category-btn">
        👗 Fashion
    </a>

    <a href="products?category=Beauty"
       class="category-btn">
        💄 Beauty
    </a>

    <a href="products?category=Home"
       class="category-btn">
        🏠 Home
    </a>

    <a href="products?category=Accessories"
       class="category-btn">
        🎧 Accessories
    </a>

</div>


<!-- PRODUCTS -->

<section class="products" id="productContainer">


<%

    List<Product> products =
            (List<Product>) request.getAttribute("products");

    if (products != null && !products.isEmpty()) {

        for (Product product : products) {

%>


    <div class="product-card"
         data-name="<%= product.getName() %>"
         data-category="<%= product.getCategory() %>">


        <!-- OLD PRODUCT ICON -->

        <div class="product-image">
            🛍️
        </div>


        <!-- PRODUCT NAME -->

        <h3>
            <%= product.getName() %>
        </h3>


        <!-- DESCRIPTION -->

        <p class="description">
            <%= product.getDescription() %>
        </p>


        <!-- CATEGORY -->

        <p style="margin-top:8px;color:#777;font-size:13px;">
            <%= product.getCategory() %>
        </p>


        <!-- PRICE -->

        <div class="price">
            ₹<%= String.format("%.0f", product.getPrice()) %>
        </div>


        <!-- BUTTONS -->

        <div class="product-buttons">


            <!-- ADD TO CART -->

            <form action="add-to-cart"
                  method="post">

                <input
                    type="hidden"
                    name="id"
                    value="<%= product.getId() %>">

                <input
                    type="hidden"
                    name="name"
                    value="<%= product.getName() %>">

                <input
                    type="hidden"
                    name="price"
                    value="<%= product.getPrice() %>">

                <input
                    type="hidden"
                    name="sellerId"
                    value="<%= product.getSellerId() %>">

                <button
                    type="submit"
                    class="cart-btn">

                    🛒 Add to Cart

                </button>

            </form>


            <!-- ADD TO WISHLIST -->

            <form action="add-to-wishlist"
                  method="post">

                <input
                    type="hidden"
                    name="id"
                    value="<%= product.getId() %>">

                <input
                    type="hidden"
                    name="name"
                    value="<%= product.getName() %>">

                <input
                    type="hidden"
                    name="price"
                    value="<%= product.getPrice() %>">

                <input
                    type="hidden"
                    name="sellerId"
                    value="<%= product.getSellerId() %>">

                <button
                    type="submit"
                    class="wish-btn">

                    ❤️

                </button>

            </form>


        </div>


    </div>


<%

        }

    } else {

%>


    <div class="no-products">

        <h2>
            No products available
        </h2>

        <p style="margin-top:10px;">
            Seller has not added any products yet.
        </p>

    </div>


<%

    }

%>


</section>


<!-- FOOTER -->

<footer>

    <p>
        © 2026 YogasriMart |
        Shop Smart. Live Better. 💙
    </p>

</footer>


<!-- SEARCH JAVASCRIPT -->

<script>

function searchProducts() {

    let input =
        document.getElementById("searchInput")
        .value
        .toLowerCase();

    let products =
        document.querySelectorAll(".product-card");

    products.forEach(function(product) {

        let name =
            product
            .getAttribute("data-name")
            .toLowerCase();

        if (name.includes(input)) {

            product.style.display = "";

        } else {

            product.style.display = "none";

        }

    });

}

</script>


</body>

</html>