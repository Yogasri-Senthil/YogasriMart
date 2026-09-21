<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>YogasriMart - Login</title>

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

        .login-container {
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

        .register {
            margin-top: 15px;
            text-align: center;
        }

        /* Error message */

        .error-message {
            background: #fee2e2;
            color: #b91c1c;
            border: 1px solid #fecaca;
            padding: 10px;
            border-radius: 5px;
            margin-top: 15px;
            text-align: center;
            font-size: 14px;
        }

        /* Success message */

        .success-message {
            background: #dcfce7;
            color: #166534;
            border: 1px solid #bbf7d0;
            padding: 10px;
            border-radius: 5px;
            margin-top: 15px;
            text-align: center;
            font-size: 14px;
        }

    </style>

</head>


<body>


<div class="login-container">


    <h1>
        YogasriMart
    </h1>


    <p>
        Welcome back! Please login.
    </p>


    <!-- ERROR MESSAGE -->

    <%

        String error = request.getParameter("error");

        if ("notregistered".equals(error)) {

    %>

        <div class="error-message">
            Please register before logging in.
        </div>

    <%

        } else if ("invalid".equals(error)) {

    %>

        <div class="error-message">
            Invalid email or password.
        </div>

    <%

        } else if ("failed".equals(error)) {

    %>

        <div class="error-message">
            Login failed. Please try again.
        </div>

    <%

        }

    %>


    <!-- SUCCESS MESSAGE -->

    <%

        String success = request.getParameter("success");

        if ("registered".equals(success)) {

    %>

        <div class="success-message">
            Registration successful. Please login.
        </div>

    <%

        }

    %>


    <!-- LOGIN FORM -->

    <form action="login" method="post">


        <label for="email">
            Email
        </label>

        <input
                type="email"
                id="email"
                name="email"
                placeholder="Enter your email"
                required
        >


        <label for="password">
            Password
        </label>

        <input
                type="password"
                id="password"
                name="password"
                placeholder="Enter your password"
                required
        >


        <button type="submit">
            Login
        </button>


    </form>


    <!-- REGISTER -->

    <div class="register">

        Don't have an account?

        <a href="${pageContext.request.contextPath}/register.jsp">
            Register
        </a>

    </div>


</div>


</body>

</html>