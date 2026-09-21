package com.yogasri.yogasrimart.controller;

import com.yogasri.yogasrimart.dao.ProductDAO;
import com.yogasri.yogasrimart.model.Product;
import com.yogasri.yogasrimart.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import java.io.File;
import java.io.IOException;

@WebServlet("/add-product")
@MultipartConfig(
        maxFileSize = 5 * 1024 * 1024,        // 5 MB
        maxRequestSize = 6 * 1024 * 1024       // 6 MB
)
public class AddProductServlet extends HttpServlet {

    private ProductDAO productDAO = new ProductDAO();

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        // Check login
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");


        // Get product details
        String name = request.getParameter("productName");
        String category = request.getParameter("category");
        String priceText = request.getParameter("price");
        String quantityText = request.getParameter("quantity");
        String description = request.getParameter("description");


        // Get uploaded image
        Part imagePart = request.getPart("productImage");


        try {

            double price = Double.parseDouble(priceText);
            int stock = Integer.parseInt(quantityText);


            // Check image
            if (imagePart == null || imagePart.getSize() == 0) {

                response.sendRedirect("add-product.jsp?error=imageRequired");
                return;
            }


            // Get original file name
            String originalFileName =
                    imagePart.getSubmittedFileName();


            // Remove unsafe path information
            originalFileName =
                    new File(originalFileName).getName();


            // Create unique file name
            String fileExtension = "";

            int dotIndex = originalFileName.lastIndexOf(".");

            if (dotIndex > 0) {
                fileExtension =
                        originalFileName.substring(dotIndex);
            }


            String fileName =
                    "product_" +
                    System.currentTimeMillis() +
                    fileExtension;


            // Upload directory
            String uploadPath =
                    getServletContext().getRealPath(
                            "/uploads/products"
                    );


            File uploadDirectory =
                    new File(uploadPath);


            // Create folder if it doesn't exist
            if (!uploadDirectory.exists()) {
                uploadDirectory.mkdirs();
            }


            // Save image
            imagePart.write(
                    new File(
                            uploadDirectory,
                            fileName
                    ).getAbsolutePath()
            );


            // Path stored in database
            String imagePath =
                    "uploads/products/" + fileName;


            // Create Product object
            Product product = new Product();

            product.setName(name);
            product.setCategory(category);
            product.setPrice(price);
            product.setStock(stock);
            product.setDescription(description);

            // Logged-in seller
            product.setSellerId(user.getId());

            // Product image
            product.setImagePath(imagePath);


            // Save product
            boolean added =
                    productDAO.addProduct(product);


            if (added) {

                response.sendRedirect(
                        "seller.jsp?success=productAdded"
                );

            } else {

                response.sendRedirect(
                        "add-product.jsp?error=failed"
                );
            }


        } catch (NumberFormatException e) {

            response.sendRedirect(
                    "add-product.jsp?error=invalid"
            );

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                    "add-product.jsp?error=failed"
            );
        }
    }
}