<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>YogasriMart - Cart</title>
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
        }
        .container {
            width: 85%;
            max-width: 900px;
            margin: 45px auto;
        }
        h1 {
            margin-bottom: 25px;
        }
        .cart-item {
            background: white;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.08);
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .product-info {
            display: flex;
            align-items: center;
            gap: 20px;
        }
        .product-icon {
            font-size: 55px;
        }
        .product-name {
            font-size: 20px;
            font-weight: bold;
        }
        .price {
            color: #0284c7;
            font-size: 20px;
            font-weight: bold;
        }
        .empty {
            text-align: center;
            color: #666;
        }
        .shop-btn {
            display: inline-block;
            margin-top: 20px;
            background: #0284c7;
            color: white;
            padding: 12px 22px;
            border-radius: 8px;
            text-decoration: none;
        }
    </style>
</head>
<body>
<div class="navbar">
    <div class="logo">
        🛍️ Yogasri<span>Mart</span>
    </div>
    <div class="nav-links">
        <a href="home.jsp">Home</a>
        <a href="products.jsp">Products</a>
        <a href="cart.jsp">Cart 🛒</a>
    </div>
</div>
<div class="container">
    <h1>🛒 Your Shopping Cart</h1>
    <%
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        if (name != null && price != null) {
    %>
        <div class="cart-item">
            <div class="product-info">
                <div class="product-icon">
                    <%
                        if (name.equals("Smart Watch")) {
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
                            out.print("🎧");
                        }
                    %>
                </div>
                <div>
                    <div class="product-name">
                        <%= name %>
                    </div>
                    <p>Quantity: 1</p>
                </div>
            </div>
            <div class="price">
                ₹<%= price %>
            </div>
        </div>
    <%
        } else {
    %>
        <div class="empty">
            <h2>Your cart is empty 🛒</h2>
            <a href="products.jsp" class="shop-btn">
                Continue Shopping
            </a>
        </div>
    <%
        }
    %>
</div>
</body>
</html>