package com.yogasri.yogasrimart.controller;

import com.yogasri.yogasrimart.dao.ProductDAO;
import com.yogasri.yogasrimart.dao.ReviewDAO;
import com.yogasri.yogasrimart.model.Product;
import com.yogasri.yogasrimart.model.Review;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/products")
public class ProductsServlet extends HttpServlet {

    private ProductDAO productDAO = new ProductDAO();
    private ReviewDAO reviewDAO = new ReviewDAO();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        List<Product> allProducts = productDAO.getAllProducts();

        String category = request.getParameter("category");

        List<Product> products = new ArrayList<>();

        if (category == null || category.trim().isEmpty()) {

            products = allProducts;

        } else {

            for (Product product : allProducts) {

                if (product.getCategory() != null &&
                    product.getCategory().equalsIgnoreCase(category)) {

                    products.add(product);
                }
            }
        }

        Map<Integer, List<Review>> productReviews = new HashMap<>();

        for (Product product : products) {

            List<Review> reviews =
                    reviewDAO.getReviewsByProduct(product.getId());

            productReviews.put(product.getId(), reviews);
        }

        request.setAttribute("products", products);
        request.setAttribute("selectedCategory", category);
        request.setAttribute("productReviews", productReviews);

        request.getRequestDispatcher("products.jsp")
                .forward(request, response);
    }
}