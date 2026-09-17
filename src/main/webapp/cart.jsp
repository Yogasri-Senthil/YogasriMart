<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
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
            max-width: 950px;
            margin: 45px auto;
        }
        h1 {
            margin-bottom: 25px;
        }
        .cart-item {
            background: white;
            padding: 20px;
            margin-bottom: 15px;
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
            font-size: 50px;
        }
        .product-name {
            font-size: 20px;
            font-weight: bold;
        }
        .quantity {
            color: #666;
            margin-top: 5px;
        }
        .price {
            color: #0284c7;
            font-size: 20px;
            font-weight: bold;
        }
        .total-box {
            background: white;
            padding: 25px;
            margin-top: 25px;
            border-radius: 12px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.08);
            text-align: right;
        }
        .total {
            font-size: 24px;
            font-weight: bold;
            color: #111827;
            margin-bottom: 20px;
        }
        .shop-btn,
        .checkout-btn {
            display: inline-block;
            padding: 12px 22px;
            border-radius: 8px;
            text-decoration: none;
            color: white;
            margin-left: 10px;
        }
        .shop-btn {
            background: #6b7280;
        }
        .checkout-btn {
            background: #0284c7;
        }
        .empty {
            text-align: center;
            color: #666;
            background: white;
            padding: 50px;
            border-radius: 12px;
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
        List<Map<String, String>> cart =
                (List<Map<String, String>>) session.getAttribute("cart");
        double total = 0;
        if (cart != null && !cart.isEmpty()) {
            for (Map<String, String> product : cart) {
                String name = product.get("name");
                String priceString = product.get("price");
                double price = Double.parseDouble(priceString);
                total += price;
    %>
        <div class="cart-item">
            <div class="product-info">
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
                <div>
                    <div class="product-name">
                        <%= name %>
                    </div>
                    <div class="quantity">
                        Quantity: 1
                    </div>
                </div>
            </div>
            <div class="price">
                ₹<%= String.format("%.0f", price) %>
            </div>
        </div>
    <%
            }
    %>
        <div class="total-box">
            <div class="total">
                Total: ₹<%= String.format("%.0f", total) %>
            </div>
            <a href="products.jsp" class="shop-btn">
                Continue Shopping
            </a>
            <a href="checkout.jsp" class="checkout-btn">
                Proceed to Checkout
            </a>
        </div>
    <%
        } else {
    %>
        <div class="empty">
            <h2>Your cart is empty 🛒</h2>
            <p style="margin-top:10px;">
                Add some products to your cart.
            </p>
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