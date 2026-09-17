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
        /* Navigation */
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
        /* Header */
        .page-header {
            text-align: center;
            padding: 45px 20px 25px;
        }
        .page-header h1 {
            font-size: 36px;
            margin-bottom: 10px;
        }
        .page-header p {
            color: #666;
            font-size: 17px;
        }
        /* Search */
        .search-box {
            text-align: center;
            margin: 20px auto 35px;
        }
        .search-box input {
            width: 60%;
            max-width: 600px;
            padding: 14px 18px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 16px;
            outline: none;
        }
        .search-box input:focus {
            border-color: #0284c7;
        }
        /* Categories */
        .categories {
            display: flex;
            justify-content: center;
            gap: 12px;
            flex-wrap: wrap;
            margin-bottom: 35px;
        }
        .category-btn {
            padding: 10px 18px;
            border: none;
            background: white;
            border-radius: 20px;
            cursor: pointer;
            box-shadow: 0 2px 8px rgba(0,0,0,0.08);
        }
        .category-btn:hover {
            background: #0284c7;
            color: white;
        }
        /* Products */
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
        .product-buttons {
            display: flex;
            justify-content: center;
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
        .wish-btn {
            border: none;
            background: #fee2e2;
            padding: 10px 14px;
            border-radius: 6px;
            cursor: pointer;
        }
        .cart-btn:hover {
            background: #0284c7;
        }
        .wish-btn:hover {
            background: #fecaca;
        }
        /* Footer */
        footer {
            background: #111827;
            color: white;
            text-align: center;
            padding: 25px;
        }
        /* Mobile */
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
<!-- Navigation -->
<div class="navbar">
    <div class="logo">
        🛍️ Yogasri<span>Mart</span>
    </div>
    <div class="nav-links">
        <a href="home.jsp">Home</a>
        <a href="products.jsp">Products</a>
        <a href="#">Wishlist ❤️</a>
        <a href="cart.jsp">Cart 🛒</a>
    </div>
</div>
<!-- Page Header -->
<section class="page-header">
    <h1>🛍️ Our Products</h1>
    <p>Discover amazing products at the best prices.</p>
</section>
<!-- Search -->
<div class="search-box">
    <input type="text"
           placeholder="🔍 Search for products...">
</div>
<!-- Categories -->
<div class="categories">
    <button class="category-btn">All</button>
    <button class="category-btn">💻 Electronics</button>
    <button class="category-btn">👗 Fashion</button>
    <button class="category-btn">💄 Beauty</button>
    <button class="category-btn">🏠 Home</button>
    <button class="category-btn">🎧 Accessories</button>
</div>
<!-- Product List -->
<section class="products">
    <!-- Product 1 -->
    <div class="product-card">
        <div class="product-image">🎧</div>
        <h3>Wireless Headphones</h3>
        <p class="description">
            Premium sound experience
        </p>
        <div class="price">
            ₹999
        </div>
        <div class="product-buttons">
         <form action="add-to-cart" method="post">
    <input type="hidden" name="name" value="Wireless Headphones">
    <input type="hidden" name="price" value="999">
    <button type="submit" class="cart-btn">
        🛒 Add to Cart
    </button>
</form>
            <button class="wish-btn">
                ❤️
            </button>
        </div>
    </div>
    <!-- Product 2 -->
    <div class="product-card">
        <div class="product-image">⌚</div>
        <h3>Smart Watch</h3>
        <p class="description">
            Smart lifestyle companion
        </p>
        <div class="price">
            ₹1,499
        </div>
        <div class="product-buttons">
          <form action="add-to-cart" method="post">
    <input type="hidden" name="name" value="Smart Watch">
    <input type="hidden" name="price" value="1499">
    <button type="submit" class="cart-btn">
        🛒 Add to Cart
    </button>
</form>
            <button class="wish-btn">
                ❤️
            </button>
        </div>
    </div>
    <!-- Product 3 -->
    <div class="product-card">
        <div class="product-image">🎒</div>
        <h3>Travel Backpack</h3>
        <p class="description">
            Stylish and comfortable
        </p>
        <div class="price">
            ₹799
        </div>
        <div class="product-buttons">
          <form action="add-to-cart" method="post">
    <input type="hidden" name="name" value="Travel Backpack">
    <input type="hidden" name="price" value="799">
    <button type="submit" class="cart-btn">
        🛒 Add to Cart
    </button>
</form>
            <button class="wish-btn">
                ❤️
            </button>
        </div>
    </div>
    <!-- Product 4 -->
    <div class="product-card">
        <div class="product-image">👟</div>
        <h3>Sports Shoes</h3>
        <p class="description">
            Comfortable shoes for everyday use
        </p>
        <div class="price">
            ₹1,299
        </div>
        <div class="product-buttons">
          <form action="add-to-cart" method="post">
    <input type="hidden" name="name" value="Sports Shoes">
    <input type="hidden" name="price" value="1299">
    <button type="submit" class="cart-btn">
        🛒 Add to Cart
    </button>
</form>
            <button class="wish-btn">
                ❤️
            </button>
        </div>
    </div>
    <!-- Product 5 -->
    <div class="product-card">
        <div class="product-image">💻</div>
        <h3>Laptop</h3>
        <p class="description">
            Powerful laptop for work and study
        </p>
        <div class="price">
            ₹45,999
        </div>
        <div class="product-buttons">
            <form action="add-to-cart" method="post">
    <input type="hidden" name="name" value="Laptop">
    <input type="hidden" name="price" value="45999">
    <button type="submit" class="cart-btn">
        🛒 Add to Cart
    </button>
</form>
            <button class="wish-btn">
                ❤️
            </button>
        </div>
    </div>
    <!-- Product 6 -->
    <div class="product-card">
        <div class="product-image">📱</div>
        <h3>Smart Phone</h3>
        <p class="description">
            Modern smartphone with great features
        </p>
        <div class="price">
            ₹18,999
        </div>
        <div class="product-buttons">
          <form action="add-to-cart" method="post">
    <input type="hidden" name="name" value="Smart Phone">
    <input type="hidden" name="price" value="18999">
    <button type="submit" class="cart-btn">
        🛒 Add to Cart
    </button>
</form>
            <button class="wish-btn">
                ❤️
            </button>
        </div>
    </div>
    <!-- Product 7 -->
    <div class="product-card">
        <div class="product-image">👗</div>
        <h3>Women's Dress</h3>
        <p class="description">
            Stylish and comfortable fashion wear
        </p>
        <div class="price">
            ₹899
        </div>
        <div class="product-buttons">
           <form action="add-to-cart" method="post">
    <input type="hidden" name="name" value="Women's Dress">
    <input type="hidden" name="price" value="899">
    <button type="submit" class="cart-btn">
        🛒 Add to Cart
    </button>
</form>
            <button class="wish-btn">
                ❤️
            </button>
        </div>
    </div>
    <!-- Product 8 -->
    <div class="product-card">
        <div class="product-image">💄</div>
        <h3>Beauty Kit</h3>
        <p class="description">
            Complete beauty care essentials
        </p>
        <div class="price">
            ₹699
        </div>
        <div class="product-buttons">
           <form action="add-to-cart" method="post">
    <input type="hidden" name="name" value="Beauty Kit">
    <input type="hidden" name="price" value="699">
    <button type="submit" class="cart-btn">
        🛒 Add to Cart
    </button>
</form>
            <button class="wish-btn">
                ❤️
            </button>
        </div>
    </div>
</section>
<!-- Footer -->
<footer>
    <p>
        © 2026 YogasriMart | Shop Smart. Live Better. 💙
    </p>
</footer>
</body>
</html>