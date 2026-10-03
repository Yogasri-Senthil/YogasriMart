package com.yogasri.yogasrimart.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/add-to-cart")
public class AddToCartServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        String sellerId = request.getParameter("sellerId");
        String imagePath = request.getParameter("imagePath");

        HttpSession session = request.getSession();

        List<Map<String, String>> cart =
                (List<Map<String, String>>) session.getAttribute("cart");

        if (cart == null) {
            cart = new ArrayList<>();
        }

        Map<String, String> product = new HashMap<>();

        product.put("id", id);
        product.put("name", name);
        product.put("price", price);
        product.put("sellerId", sellerId);
        product.put("imagePath", imagePath);
        product.put("quantity", "1");

        cart.add(product);

        session.setAttribute("cart", cart);

        response.sendRedirect("cart.jsp");
    }
}