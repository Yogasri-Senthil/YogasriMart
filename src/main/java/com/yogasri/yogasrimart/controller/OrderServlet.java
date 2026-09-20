package com.yogasri.yogasrimart.controller;

import com.yogasri.yogasrimart.dao.OrderDAO;
import com.yogasri.yogasrimart.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/place-order")
public class OrderServlet extends HttpServlet {

    private OrderDAO orderDAO = new OrderDAO();

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String pincode = request.getParameter("pincode");
        String payment = request.getParameter("payment");

        HttpSession session = request.getSession();

        // Debug information
        System.out.println("=================================");
        System.out.println("ORDER REQUEST RECEIVED");
        System.out.println("SESSION ID = " + session.getId());
        System.out.println("USER IN SESSION = "
                + session.getAttribute("user"));
        System.out.println("PAYMENT = " + payment);
        System.out.println("=================================");

        User user = (User) session.getAttribute("user");

        if (user == null) {

            System.out.println("USER IS NULL - REDIRECTING TO LOGIN");

            response.sendRedirect("login.jsp");
            return;
        }

        List<Map<String, String>> cart =
                (List<Map<String, String>>) session.getAttribute("cart");

        if (cart == null || cart.isEmpty()) {

            System.out.println("CART IS EMPTY");

            response.sendRedirect("cart.jsp");
            return;
        }

        for (Map<String, String> product : cart) {

            String idValue = product.get("id");
            String sellerIdValue = product.get("sellerId");

            if (idValue == null || sellerIdValue == null) {
                continue;
            }

            int productId =
                    Integer.parseInt(idValue);

            int sellerId =
                    Integer.parseInt(sellerIdValue);

            String productName =
                    product.get("name");

            double price =
                    Double.parseDouble(product.get("price"));

            int quantity = 1;

            if (product.get("quantity") != null) {

                quantity =
                        Integer.parseInt(
                                product.get("quantity")
                        );
            }

            double totalPrice =
                    price * quantity;

            orderDAO.createOrder(
                    user.getId(),
                    sellerId,
                    productId,
                    productName,
                    quantity,
                    totalPrice,
                    name,
                    address,
                    city,
                    pincode,
                    payment
            );
        }

        session.removeAttribute("cart");

        response.sendRedirect("order-success.jsp");
    }
}