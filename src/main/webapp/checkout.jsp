<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>YogasriMart - Checkout</title>

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

        .container {
            width: 90%;
            max-width: 850px;
            margin: 40px auto;
        }

        h1 {
            margin-bottom: 25px;
        }

        .checkout-box {
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.08);
        }

        .section {
            margin-bottom: 25px;
        }

        .section h2 {
            margin-bottom: 15px;
        }

        label {
            display: block;
            margin-top: 12px;
            margin-bottom: 5px;
            font-weight: bold;
        }

        input {
            width: 100%;
            padding: 11px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        .payment-option {
            margin-top: 10px;
        }

        .payment-option input {
            width: auto;
            margin-right: 8px;
        }

        .place-order {
            width: 100%;
            padding: 13px;
            border: none;
            border-radius: 8px;
            background: #0284c7;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }

        .place-order:hover {
            background: #0369a1;
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

    <h1>🛒 Checkout</h1>


    <div class="checkout-box">


        <!-- COD FORM -->

        <form action="place-order"
              method="post"
              id="checkoutForm">


            <div class="section">

                <h2>📍 Delivery Details</h2>


                <label>Name</label>

                <input type="text"
                       name="name"
                       placeholder="Enter your name"
                       required>


                <label>Address</label>

                <input type="text"
                       name="address"
                       placeholder="Enter delivery address"
                       required>


                <label>City</label>

                <input type="text"
                       name="city"
                       placeholder="Enter city"
                       required>


                <label>PIN Code</label>

                <input type="text"
                       name="pincode"
                       placeholder="Enter PIN code"
                       required>

            </div>


            <div class="section">

                <h2>💳 Payment Method</h2>


                <div class="payment-option">

                    <input type="radio"
                           name="payment"
                           value="COD"
                           checked
                           onchange="changePayment()">

                    Cash on Delivery

                </div>


                <div class="payment-option">

                    <input type="radio"
                           name="payment"
                           value="UPI"
                           onchange="changePayment()">

                    UPI

                </div>


                <div class="payment-option">

                    <input type="radio"
                           name="payment"
                           value="CARD"
                           onchange="changePayment()">

                    Credit / Debit Card

                </div>

            </div>


            <button class="place-order"
                    type="submit"
                    id="submitButton">

                Place Order

            </button>


        </form>

    </div>

</div>


<script>

function changePayment() {

    const payment =
        document.querySelector(
            'input[name="payment"]:checked'
        ).value;

    const form =
        document.getElementById("checkoutForm");

    const button =
        document.getElementById("submitButton");


   if (payment === "COD") {

    form.action = "place-order";

    button.textContent = "Place Order";

} else if (payment === "UPI") {

    form.action = "payment.jsp?payment=UPI";

    button.textContent = "Continue to UPI Payment";

} else if (payment === "CARD") {

    form.action = "payment.jsp?payment=CARD";

    button.textContent = "Continue to Card Payment";

}

}

</script>


</body>

</html>