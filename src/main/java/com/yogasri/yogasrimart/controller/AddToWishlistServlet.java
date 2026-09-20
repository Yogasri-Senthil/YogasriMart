package com.yogasri.yogasrimart.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

@WebServlet("/add-to-wishlist")
public class AddToWishlistServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        String sellerId = request.getParameter("sellerId");

        HttpSession session = request.getSession();

        List<Map<String, String>> wishlist =
                (List<Map<String, String>>)
                        session.getAttribute("wishlist");

        if (wishlist == null) {
            wishlist = new ArrayList<>();
        }

        boolean alreadyExists = false;

        for (Map<String, String> product : wishlist) {

            if (product.get("id").equals(id)) {
                alreadyExists = true;
                break;
            }
        }

        if (!alreadyExists) {

            Map<String, String> product =
                    new HashMap<>();

            product.put("id", id);
            product.put("name", name);
            product.put("price", price);
            product.put("sellerId", sellerId);

            wishlist.add(product);

            session.setAttribute(
                    "wishlist",
                    wishlist
            );
        }

        response.sendRedirect("wishlist.jsp");
    }
}