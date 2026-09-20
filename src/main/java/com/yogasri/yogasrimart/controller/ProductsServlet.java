package com.yogasri.yogasrimart.controller;

import com.yogasri.yogasrimart.dao.ProductDAO;
import com.yogasri.yogasrimart.model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/products")
public class ProductsServlet extends HttpServlet {

    private ProductDAO productDAO = new ProductDAO();

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        // Get all products from database
        List<Product> allProducts = productDAO.getAllProducts();

        // Get category from URL
        String category = request.getParameter("category");

        List<Product> products = new ArrayList<>();

        // If no category is selected, show all products
        if (category == null || category.trim().isEmpty()) {

            products = allProducts;

        } else {

            // Show only selected category products
            for (Product product : allProducts) {

                if (product.getCategory() != null &&
                    product.getCategory().equalsIgnoreCase(category)) {

                    products.add(product);
                }
            }
        }

        // Send products to products.jsp
        request.setAttribute("products", products);

        // Send selected category also
        request.setAttribute("selectedCategory", category);

        request.getRequestDispatcher("products.jsp")
                .forward(request, response);
    }
}