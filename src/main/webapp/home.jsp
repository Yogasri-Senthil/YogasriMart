<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>YogasriMart - Home</title>
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
        /* Navigation Bar */
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
        /* Hero Section */
        .hero {
            min-height: 380px;
            padding: 70px 7%;
            display: flex;
            align-items: center;
            justify-content: space-between;
            background: linear-gradient(135deg, #dbeafe, #f0f9ff);
        }
        .hero-text {
            max-width: 550px;
        }
        .hero-text h1 {
            font-size: 48px;
            margin-bottom: 15px;
        }
        .hero-text h1 span {
            color: #0284c7;
        }
        .hero-text p {
            font-size: 18px;
            color: #555;
            margin-bottom: 25px;
        }
        .shop-btn {
            display: inline-block;
            background: #0284c7;
            color: white;
            padding: 13px 25px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: bold;
        }
        .shop-btn:hover {
            background: #0369a1;
        }
        .hero-icon {
            font-size: 150px;
        }
        /* Categories */
        .section {
            padding: 45px 7%;
        }
        .section h2 {
            text-align: center;
            margin-bottom: 30px;
            font-size: 30px;
        }
        .categories {
            display: grid;
            grid-template-columns: repeat(5, 1fr);
            gap: 18px;
        }
        .category {
            background: white;
            padding: 25px 10px;
            text-align: center;
            border-radius: 12px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.08);
            cursor: pointer;
        }
        .category:hover {
            transform: translateY(-5px);
        }
        .category .icon {
            font-size: 40px;
            margin-bottom: 10px;

        /* Deals */
        .deals {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 25px;
        }
        .product {
            background: white;
            padding: 25px;
            border-radius: 12px;
            text-align: center;
            box-shadow: 0 3px 12px rgba(0,0,0,0.08);
        }
        .product-image {
            font-size: 75px;
            margin-bottom: 15px;
        }
        .product h3 {
            margin-bottom: 8px;
        }
        .price {
            color: #0284c7;
            font-size: 20px;
            font-weight: bold;
            margin: 10px;
        }
        .cart-btn {
            border: none;
            background: #111827;
            color: white;
            padding: 10px 18px;
            border-radius: 6px;
            cursor: pointer;
        }
        /* Footer */
        footer {
            background: #111827;
            color: white;
            text-align: center;
            padding: 25px;
            margin-top: 30px;
        }
        @media (max-width: 800px) {
            .categories {
                grid-template-columns: repeat(2, 1fr);
            }
            .deals {
                grid-template-columns: 1fr;
            }
            .hero-icon {
                display: none;
            }
            .hero-text h1 {
                font-size: 36px;
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
    <div class="nav-links">
        <a href="home.jsp">Home</a>
        <a href="products.jsp">Products</a>
        <a href="#">Wishlist ❤️</a>
        <a href="#">Cart 🛒</a>
    </div>
</div>
<!-- Hero -->
<section class="hero">
    <div class="hero-text">
        <h1>
            Shop <span>Smart.</span><br>
            Live Better.
        </h1>
        <p>
            Discover amazing products, exciting deals
            and everything you need in one place.
        </p>
        <a href="products.jsp" class="shop-btn">
            Start Shopping 🛍️
        </a>
    </div>
    <div class="hero-icon">
        🛒
    </div>
</section>
<!-- Categories -->
<section class="section">
    <h2>Explore Categories</h2>
    <div class="categories">
        <div class="category">
            <div class="icon">💻</div>
            <h3>Electronics</h3>
        </div>
        <div class="category">
            <div class="icon">👗</div>
            <h3>Fashion</h3>
        </div>
        <div class="category">
            <div class="icon">💄</div>
            <h3>Beauty</h3>
        </div>
        <div class="category">
            <div class="icon">🏠</div>
            <h3>Home</h3>
        </div>
        <div class="category">
            <div class="icon">🎧</div>
            <h3>Accessories</h3>
        </div>
    </div>
</section>
<!-- Today's Deals -->
<section class="section">
    <h2>🔥 Today's Deals</h2>
    <div class="deals">
        <div class="product">
            <div class="product-image">🎧</div>
            <h3>Wireless Headphones</h3>
            <p>Premium sound experience</p>
            <div class="price">₹999</div>
            <button class="cart-btn">Add to Cart 🛒</button>
        </div>
        <div class="product">
            <div class="product-image">⌚</div>
            <h3>Smart Watch</h3>
            <p>Smart lifestyle companion</p>
            <div class="price">₹1,499</div>
            <button class="cart-btn">Add to Cart 🛒</button>
        </div>
        <div class="product">
            <div class="product-image">🎒</div>
            <h3>Travel Backpack</h3>
            <p>Stylish and comfortable</p>
            <div class="price">₹799</div>
            <button class="cart-btn">Add to Cart 🛒</button>
        </div>
    </div>
</section>
<!-- Footer -->
<footer>
    <p>© 2026 YogasriMart | Shop Smart. Live Better. 💙</p>
</footer>
</body>
</html>