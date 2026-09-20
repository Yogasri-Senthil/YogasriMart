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

@WebServlet("/remove-from-cart")
public class RemoveFromCartServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        List<Map<String, String>> cart =
                (List<Map<String, String>>) session.getAttribute("cart");

        String productId = request.getParameter("id");

        if (cart != null && productId != null) {

            cart.removeIf(product ->
                    productId.equals(product.get("id"))
            );

            session.setAttribute("cart", cart);
        }

        response.sendRedirect("cart.jsp");
    }
}