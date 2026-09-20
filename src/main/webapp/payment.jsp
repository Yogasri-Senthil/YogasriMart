<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>YogasriMart - Payment</title>

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
        }

        .logo {
            font-size: 25px;
            font-weight: bold;
        }

        .logo span {
            color: #38bdf8;
        }

        .container {
            width: 90%;
            max-width: 600px;
            margin: 50px auto;
        }

        .payment-box {
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.08);
        }

        h1 {
            margin-bottom: 10px;
        }

        .subtitle {
            color: #666;
            margin-bottom: 25px;
        }

        label {
            display: block;
            margin-top: 15px;
            margin-bottom: 6px;
            font-weight: bold;
        }

        input {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        .pay-btn {
            width: 100%;
            margin-top: 25px;
            padding: 13px;
            border: none;
            border-radius: 8px;
            background: #0284c7;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }

        .pay-btn:hover {
            background: #0369a1;
        }

        .payment-title {
            margin-bottom: 10px;
        }

    </style>

</head>

<body>


<div class="navbar">

    <div class="logo">

        🛍️ Yogasri<span>Mart</span>

    </div>

</div>


<div class="container">

    <div class="payment-box">

        <h1>💳 Payment</h1>

        <p class="subtitle">
            Complete your payment to place the order.
        </p>


        <%
            String payment = request.getParameter("payment");
        %>


        <!-- IMPORTANT:
             Payment details are submitted to OrderServlet.
        -->

        <form action="place-order" method="post">


            <!-- Payment Method -->

            <input type="hidden"
                   name="payment"
                   value="<%= payment %>">


            <!-- Delivery details will be carried from checkout -->

            <input type="hidden"
                   name="name"
                   value="<%= request.getParameter("name") != null
                           ? request.getParameter("name") : "" %>">

            <input type="hidden"
                   name="address"
                   value="<%= request.getParameter("address") != null
                           ? request.getParameter("address") : "" %>">

            <input type="hidden"
                   name="city"
                   value="<%= request.getParameter("city") != null
                           ? request.getParameter("city") : "" %>">

            <input type="hidden"
                   name="pincode"
                   value="<%= request.getParameter("pincode") != null
                           ? request.getParameter("pincode") : "" %>">


            <% if ("UPI".equals(payment)) { %>


                <h2 class="payment-title">
                    📱 UPI Payment
                </h2>

                <label>UPI ID</label>

                <input type="text"
                       name="upiId"
                       placeholder="example@upi"
                       required>


                <button type="submit"
                        class="pay-btn">

                    Pay Now ₹

                </button>


            <% } else if ("CARD".equals(payment)) { %>


                <h2 class="payment-title">
                    💳 Credit / Debit Card
                </h2>


                <label>Card Number</label>

                <input type="text"
                       name="cardNumber"
                       placeholder="1234 5678 9012 3456"
                       maxlength="19"
                       required>


                <label>Card Holder Name</label>

                <input type="text"
                       name="cardHolder"
                       placeholder="Enter card holder name"
                       required>


                <label>Expiry Date</label>

                <input type="text"
                       name="expiry"
                       placeholder="MM/YY"
                       maxlength="5"
                       required>


                <label>CVV</label>

                <input type="password"
                       name="cvv"
                       placeholder="CVV"
                       maxlength="3"
                       required>


                <button type="submit"
                        class="pay-btn">

                    Pay Now ₹

                </button>


            <% } else { %>


                <h2>
                    Payment method not selected
                </h2>


            <% } %>


        </form>

    </div>

</div>

</body>

</html>