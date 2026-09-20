package com.yogasri.yogasrimart.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/remove-from-wishlist")
public class RemoveFromWishlistServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");

        HttpSession session = request.getSession();

        List<Map<String, String>> wishlist =
                (List<Map<String, String>>)
                        session.getAttribute("wishlist");

        if (wishlist != null && id != null) {

            wishlist.removeIf(product ->
                    id.equals(product.get("id"))
            );

            session.setAttribute(
                    "wishlist",
                    wishlist
            );
        }

        response.sendRedirect("wishlist.jsp");
    }
}