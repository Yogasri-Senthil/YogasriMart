<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>YogasriMart - Add Product</title>

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
            max-width: 600px;
            margin: 45px auto;
        }

        .form-card {
            background: white;
            padding: 35px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
        }

        h1 {
            text-align: center;
            margin-bottom: 10px;
        }

        .subtitle {
            text-align: center;
            color: #666;
            margin-bottom: 30px;
        }

        label {
            display: block;
            margin-top: 18px;
            margin-bottom: 7px;
            font-weight: bold;
        }

        input,
        select,
        textarea {
            width: 100%;
            padding: 11px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 15px;
        }

        textarea {
            height: 100px;
            resize: vertical;
        }

        /* Product Image */

        .image-input {
            padding: 9px;
            background: #f8fafc;
            cursor: pointer;
        }

        .image-note {
            margin-top: 7px;
            color: #777;
            font-size: 13px;
        }

        .btn {
            width: 100%;
            margin-top: 25px;
            padding: 12px;
            border: none;
            border-radius: 7px;
            background: #0284c7;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }

        .btn:hover {
            background: #0369a1;
        }

        .back {
            text-align: center;
            margin-top: 20px;
        }

        .back a {
            color: #0284c7;
            text-decoration: none;
            font-weight: bold;
        }

    </style>

</head>


<body>


<!-- Navigation -->

<div class="navbar">

    <div class="logo">
        Yogasri<span>Mart</span>
    </div>

    <div>
        Seller
    </div>

</div>


<!-- Main Container -->

<div class="container">


    <div class="form-card">


        <h1>
            Add Product
        </h1>


        <p class="subtitle">
            Add a new product to YogasriMart
        </p>


        <!-- IMPORTANT:
             enctype is required for image upload
        -->

        <form action="add-product"
              method="post"
              enctype="multipart/form-data">


            <!-- Product Name -->

            <label for="productName">
                Product Name
            </label>

            <input
                    type="text"
                    id="productName"
                    name="productName"
                    placeholder="Enter product name"
                    required
            >


            <!-- Category -->

            <label for="category">
                Category
            </label>

            <select
                    id="category"
                    name="category"
                    required
            >

                <option value="">
                    Select Category
                </option>

                <option value="Electronics">
                    Electronics
                </option>

                <option value="Fashion">
                    Fashion
                </option>

                <option value="Beauty">
                    Beauty
                </option>

                <option value="Home">
                    Home
                </option>

                <option value="Accessories">
                    Accessories
                </option>

            </select>


            <!-- Price -->

            <label for="price">
                Price (&#8377;)
            </label>

            <input
                    type="number"
                    id="price"
                    name="price"
                    placeholder="Enter price"
                    min="1"
                    step="0.01"
                    required
            >


            <!-- Quantity -->

            <label for="quantity">
                Quantity
            </label>

            <input
                    type="number"
                    id="quantity"
                    name="quantity"
                    placeholder="Enter available quantity"
                    min="1"
                    required
            >


            <!-- Description -->

            <label for="description">
                Description
            </label>

            <textarea
                    id="description"
                    name="description"
                    placeholder="Enter product description"
                    required
            ></textarea>


            <!-- PRODUCT IMAGE -->

            <label for="productImage">
                Product Image
            </label>

            <input
                    type="file"
                    id="productImage"
                    name="productImage"
                    class="image-input"
                    accept="image/jpeg,image/png,image/webp"
                    required
            >

            <p class="image-note">
                Upload JPG, PNG or WEBP image of your product.
            </p>


            <!-- Submit -->

            <button
                    type="submit"
                    class="btn"
            >
                Add Product
            </button>


        </form>


        <!-- Back -->

        <div class="back">

            <a href="seller.jsp">
                &larr; Back to Seller Dashboard
            </a>

        </div>


    </div>

</div>


</body>

</html>