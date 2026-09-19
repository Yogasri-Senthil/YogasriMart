<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>YogasriMart - Register</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f2f2f2;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .register-container {
            background: white;
            width: 350px;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.15);
        }
        h1 {
            text-align: center;
            margin-bottom: 10px;
        }
        p {
            text-align: center;
            color: #666;
        }
        label {
            display: block;
            margin-top: 15px;
            margin-bottom: 5px;
        }
        input {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        button {
            width: 100%;
            padding: 11px;
            margin-top: 20px;
            border: none;
            border-radius: 5px;
            background: #333;
            color: white;
            cursor: pointer;
        }
        button:hover {
            background: #555;
        }
        .login {
            margin-top: 15px;
            text-align: center;
        }
        .role-options {
            display: flex;
            gap: 20px;
            margin-top: 8px;
        }
        .role-options label {
            margin: 0;
            display: flex;
            align-items: center;
            gap: 5px;
        }
        .role-options input {
            width: auto;
        }
    </style>
</head>
<body>
<div class="register-container">
    <h1>YogasriMart</h1>
    <p>Create your account</p>
    <form action="register" method="post">
        <label for="name">Name</label>
        <input type="text"
               id="name"
               name="name"
               placeholder="Enter your name"
               required>
        <label for="email">Email</label>
        <input type="email"
               id="email"
               name="email"
               placeholder="Enter your email"
               required>
        <label for="password">Password</label>
        <input type="password"
               id="password"
               name="password"
               placeholder="Create a password"
               required>
        <label>Choose Role</label>
        <div class="role-options">
            <label>
                <input type="radio"
                       name="role"
                       value="BUYER"
                       required>
                &#128722; Buyer
            </label>
            <label>
                <input type="radio"
                       name="role"
                       value="SELLER">
                &#127978; Seller
            </label>
        </div>
        <button type="submit">Register</button>
    </form>
    <div class="login">
        Already have an account?
        <a href="login.jsp">Login</a>
    </div>
</div>
</body>
</html>