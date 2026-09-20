<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>YogasriMart - Wishlist</title>

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

        .nav-links a {
            color: white;
            text-decoration: none;
            margin-left: 25px;
            font-size: 15px;
        }

        .nav-links a:hover {
            color: #38bdf8;
        }

        .container {
            width: 85%;
            max-width: 1100px;
            margin: 45px auto;
        }

        h1 {
            margin-bottom: 25px;
        }

        .wishlist {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
        }

        .wishlist-item {
            background: white;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.08);
            text-align: center;
        }

        .product-icon {
            font-size: 65px;
            margin-bottom: 15px;
        }

        .product-name {
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .price {
            color: #0284c7;
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .button-group {
            display: flex;
            justify-content: center;
            gap: 10px;
        }

        .cart-btn {
            border: none;
            background: #111827;
            color: white;
            padding: 10px 15px;
            border-radius: 6px;
            cursor: pointer;
        }

        .remove-btn {
            border: none;
            background: #dc2626;
            color: white;
            padding: 10px 15px;
            border-radius: 6px;
            cursor: pointer;
        }

        .cart-btn:hover {
            background: #0284c7;
        }

        .remove-btn:hover {
            background: #b91c1c;
        }

        .empty {
            text-align: center;
            color: #666;
            background: white;
            padding: 50px;
            border-radius: 12px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.08);
        }

        .heart {
            font-size: 70px;
            margin-bottom: 20px;
        }

        .shop-btn {
            display: inline-block;
            margin-top: 20px;
            background: #0284c7;
            color: white;
            padding: 12px 22px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: bold;
        }

        @media (max-width: 800px) {

            .wishlist {
                grid-template-columns: 1fr;
            }

            .navbar {
                flex-direction: column;
                gap: 15px;
            }

        }

    </style>

</head>

<body>


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


<div class="container">

    <h1>
        ❤️ My Wishlist
    </h1>


<%

    List<Map<String, String>> wishlist =
            (List<Map<String, String>>)
                    session.getAttribute("wishlist");


    if (wishlist != null && !wishlist.isEmpty()) {

%>


<div class="wishlist">


<%

        for (Map<String, String> product : wishlist) {

            String name = product.get("name");
            String price = product.get("price");

%>


    <div class="wishlist-item">

        <div class="product-icon">

            <%

                if (name.equals("Wireless Headphones")) {
                    out.print("🎧");

                } else if (name.equals("Smart Watch")) {
                    out.print("⌚");

                } else if (name.equals("Travel Backpack")) {
                    out.print("🎒");

                } else if (name.equals("Sports Shoes")) {
                    out.print("👟");

                } else if (name.equals("Laptop")) {
                    out.print("💻");

                } else if (name.equals("Smart Phone")) {
                    out.print("📱");

                } else if (name.equals("Women's Dress")) {
                    out.print("👗");

                } else if (name.equals("Beauty Kit")) {
                    out.print("💄");

                } else {
                    out.print("🛍️");
                }

            %>

        </div>


        <div class="product-name">

            <%= name %>

        </div>


        <div class="price">

            ₹<%= String.format("%.0f",
                    Double.parseDouble(price)) %>

        </div>


        <div class="button-group">


            <!-- Add to Cart -->

            <form action="add-to-cart" method="post">

                <input type="hidden"
                       name="id"
                       value="<%= product.get("id") %>">

                <input type="hidden"
                       name="name"
                       value="<%= product.get("name") %>">

                <input type="hidden"
                       name="price"
                       value="<%= product.get("price") %>">

                <input type="hidden"
                       name="sellerId"
                       value="<%= product.get("sellerId") %>">

                <button type="submit"
                        class="cart-btn">

                    🛒 Add to Cart

                </button>

            </form>


            <!-- Remove from Wishlist -->

            <form action="remove-from-wishlist"
                  method="post">

                <input type="hidden"
                       name="id"
                       value="<%= product.get("id") %>">

                <button type="submit"
                        class="remove-btn">

                    🗑️ Remove

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

        <div class="heart">
            💔
        </div>

        <h2>
            Your Wishlist is Empty
        </h2>

        <p style="margin-top:10px;">
            Add your favorite products to your wishlist.
        </p>

        <a href="products"
           class="shop-btn">

            Browse Products 🛍️

        </a>

    </div>


<%

    }

%>


</div>

</body>

</html>