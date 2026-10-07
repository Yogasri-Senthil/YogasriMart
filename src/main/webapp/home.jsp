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
            transition: 0.3s;
            text-decoration: none;
            color: #222;
        }

        .category:hover {
            transform: translateY(-5px);
        }

        .category .icon {
            font-size: 40px;
            margin-bottom: 10px;
        }

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

        footer {
            background: #111827;
            color: white;
            text-align: center;
            padding: 25px;
            margin-top: 30px;
        }

        .chat-button {
            position: fixed;
            right: 25px;
            bottom: 25px;
            background: #0284c7;
            color: white;
            border: none;
            border-radius: 50px;
            padding: 15px 22px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            box-shadow: 0 5px 18px rgba(0,0,0,0.2);
            z-index: 1000;
        }

        .chat-button:hover {
            background: #0369a1;
        }

        .chat-box {
            position: fixed;
            right: 25px;
            bottom: 85px;
            width: 350px;
            height: 480px;
            background: white;
            border-radius: 15px;
            box-shadow: 0 5px 25px rgba(0,0,0,0.2);
            display: none;
            flex-direction: column;
            overflow: hidden;
            z-index: 999;
        }

        .chat-header {
            background: #111827;
            color: white;
            padding: 17px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-weight: bold;
        }

        .chat-close {
            background: none;
            border: none;
            color: white;
            font-size: 22px;
            cursor: pointer;
        }

        .chat-messages {
            flex: 1;
            padding: 15px;
            overflow-y: auto;
            background: #f5f6fa;
        }

        .message {
            max-width: 85%;
            padding: 10px 13px;
            margin-bottom: 12px;
            border-radius: 12px;
            line-height: 1.4;
            font-size: 14px;
            white-space: pre-wrap;
        }

        .bot-message {
            background: white;
            color: #222;
            align-self: flex-start;
            box-shadow: 0 2px 7px rgba(0,0,0,0.08);
        }

        .user-message {
            background: #0284c7;
            color: white;
            margin-left: auto;
        }

        .chat-input-area {
            display: flex;
            padding: 10px;
            background: white;
            border-top: 1px solid #ddd;
        }

        .chat-input {
            flex: 1;
            border: 1px solid #ccc;
            border-radius: 8px;
            padding: 10px;
            outline: none;
        }

        .chat-send {
            margin-left: 8px;
            background: #0284c7;
            color: white;
            border: none;
            border-radius: 8px;
            padding: 10px 15px;
            cursor: pointer;
        }

        .chat-send:hover {
            background: #0369a1;
        }

        .typing {
            color: #666;
            font-style: italic;
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

            .navbar {
                flex-direction: column;
                gap: 15px;
            }

            .nav-links a {
                margin-left: 10px;
            }

            .chat-box {
                right: 10px;
                bottom: 80px;
                width: calc(100% - 20px);
                height: 450px;
            }

            .chat-button {
                right: 15px;
                bottom: 15px;
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
        <a href="home.jsp">Home</a>
        <a href="products">Products</a>
        <a href="buyer-orders">My Orders 📦</a>
        <a href="wishlist.jsp">Wishlist ❤️</a>
        <a href="cart.jsp">Cart 🛒</a>
    </div>

</div>

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

        <a href="products" class="shop-btn">
            Start Shopping 🛍️
        </a>

    </div>

    <div class="hero-icon">
        🛒
    </div>

</section>

<section class="section">

    <h2>Explore Categories</h2>

    <div class="categories">

        <a href="products?category=Electronics" class="category">
            <div class="icon">💻</div>
            <h3>Electronics</h3>
        </a>

        <a href="products?category=Fashion" class="category">
            <div class="icon">👗</div>
            <h3>Fashion</h3>
        </a>

        <a href="products?category=Beauty" class="category">
            <div class="icon">💄</div>
            <h3>Beauty</h3>
        </a>

        <a href="products?category=Home" class="category">
            <div class="icon">🏠</div>
            <h3>Home</h3>
        </a>

        <a href="products?category=Accessories" class="category">
            <div class="icon">🎧</div>
            <h3>Accessories</h3>
        </a>

    </div>

</section>

<section class="section">

    <h2>🔥 Today's Deals</h2>

    <div class="deals">

        <div class="product">

            <div class="product-image">🎧</div>

            <h3>Wireless Headphones</h3>

            <p>Premium sound experience</p>

            <div class="price">₹999</div>

            <a href="products" class="shop-btn">
                View Product 🛒
            </a>

        </div>

        <div class="product">

            <div class="product-image">⌚</div>

            <h3>Smart Watch</h3>

            <p>Smart lifestyle companion</p>

            <div class="price">₹1,499</div>

            <a href="products" class="shop-btn">
                View Product 🛒
            </a>

        </div>

        <div class="product">

            <div class="product-image">🎒</div>

            <h3>Travel Backpack</h3>

            <p>Stylish and comfortable</p>

            <div class="price">₹799</div>

            <a href="products" class="shop-btn">
                View Product 🛒
            </a>

        </div>

    </div>

</section>

<footer>

    <p>
        © 2026 YogasriMart | Shop Smart. Live Better. 💙
    </p>

</footer>

<button class="chat-button" onclick="toggleChat()">
    💬 YogasriMart AI
</button>

<div class="chat-box" id="chatBox">

    <div class="chat-header">

        <span>🤖 YogasriMart AI</span>

        <button class="chat-close" onclick="toggleChat()">
            ×
        </button>

    </div>

    <div class="chat-messages" id="chatMessages">

        <div class="message bot-message">
            Hi! 👋 I'm YogasriMart AI.
            How can I help you?
        </div>

    </div>

    <div class="chat-input-area">

        <input
                type="text"
                id="chatInput"
                class="chat-input"
                placeholder="Ask something..."
                maxlength="500"
                onkeydown="handleEnter(event)"
        >

        <button
                class="chat-send"
                onclick="sendMessage()">
            Send
        </button>

    </div>

</div>

<script>

    function toggleChat() {

        const chatBox =
                document.getElementById("chatBox");

        if (chatBox.style.display === "flex") {
            chatBox.style.display = "none";
        } else {
            chatBox.style.display = "flex";
            document.getElementById("chatInput").focus();
        }
    }

    function handleEnter(event) {

        if (event.key === "Enter") {
            sendMessage();
        }
    }

    function addMessage(text, type) {

        const messages =
                document.getElementById("chatMessages");

        const message =
                document.createElement("div");

        message.className =
                "message " + type;

        message.textContent = text;

        messages.appendChild(message);

        messages.scrollTop =
                messages.scrollHeight;

        return message;
    }

    async function sendMessage() {

        const input =
                document.getElementById("chatInput");

        const question =
                input.value.trim();

        if (!question) {
            return;
        }

        addMessage(question, "user-message");

        input.value = "";

        const typing =
                addMessage(
                    "YogasriMart AI is thinking...",
                    "bot-message typing"
                );

        try {

            const response =
                    await fetch("chat", {
                        method: "POST",
                        headers: {
                            "Content-Type":
                                "application/x-www-form-urlencoded"
                        },
                        body:
                            "question=" +
                            encodeURIComponent(question)
                    });

            const answer =
                    await response.text();

            typing.remove();

            if (response.ok) {

                addMessage(
                    answer,
                    "bot-message"
                );

            } else {

                addMessage(
                    "Sorry, I could not process your question.",
                    "bot-message"
                );
            }

        } catch (error) {

            typing.remove();

            addMessage(
                "Sorry, the AI assistant is currently unavailable.",
                "bot-message"
            );
        }
    }

</script>

</body>
</html>