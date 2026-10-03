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
import java.nio.file.Paths;
import java.util.UUID;

@WebServlet("/add-product")
@MultipartConfig(
        maxFileSize = 5 * 1024 * 1024,
        maxRequestSize = 10 * 1024 * 1024
)
public class AddProductServlet extends HttpServlet {

    private final ProductDAO productDAO = new ProductDAO();

    private static final String UPLOAD_DIRECTORY =
            "D:\\YogasriMart\\uploads\\products";

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null ||
                session.getAttribute("user") == null) {

            response.sendRedirect("login.jsp");
            return;
        }

        User user =
                (User) session.getAttribute("user");

        String name =
                request.getParameter("productName");

        String category =
                request.getParameter("category");

        String priceText =
                request.getParameter("price");

        String quantityText =
                request.getParameter("quantity");

        String description =
                request.getParameter("description");

        try {

            double price =
                    Double.parseDouble(priceText);

            int stock =
                    Integer.parseInt(quantityText);

            Product product =
                    new Product();

            product.setName(name);
            product.setCategory(category);
            product.setPrice(price);
            product.setStock(stock);
            product.setDescription(description);
            product.setSellerId(user.getId());

            Part imagePart =
                    request.getPart("productImage");

            String imagePath = null;

            if (imagePart != null &&
                    imagePart.getSize() > 0) {

                String originalFileName =
                        Paths.get(
                                imagePart.getSubmittedFileName()
                        ).getFileName().toString();

                String extension = "";

                int dotIndex =
                        originalFileName.lastIndexOf(".");

                if (dotIndex >= 0) {
                    extension =
                            originalFileName
                                    .substring(dotIndex)
                                    .toLowerCase();
                }

                if (!extension.equals(".jpg") &&
                        !extension.equals(".jpeg") &&
                        !extension.equals(".png") &&
                        !extension.equals(".webp")) {

                    response.sendRedirect(
                            "add-product.jsp?error=invalidimage"
                    );
                    return;
                }

                File uploadDirectory =
                        new File(UPLOAD_DIRECTORY);

                if (!uploadDirectory.exists()) {
                    uploadDirectory.mkdirs();
                }

                String fileName =
                        UUID.randomUUID().toString()
                                + extension;

                File imageFile =
                        new File(
                                uploadDirectory,
                                fileName
                        );

                imagePart.write(
                        imageFile.getAbsolutePath()
                );

                imagePath =
                        "product-images/" + fileName;

                product.setImagePath(imagePath);
            }

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