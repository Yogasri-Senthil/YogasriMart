package com.yogasri.yogasrimart.controller;

import com.yogasri.yogasrimart.model.User;
import com.yogasri.yogasrimart.util.DatabaseConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/update-order-status")
public class UpdateOrderStatusServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        User seller = (User) session.getAttribute("user");

        if (!"SELLER".equals(seller.getRole())) {
            response.sendRedirect("login.jsp");
            return;
        }

        int orderId;

        try {
            orderId = Integer.parseInt(request.getParameter("orderId"));
        } catch (NumberFormatException e) {
            response.sendRedirect("seller-orders.jsp?error=invalidOrder");
            return;
        }

        String status = request.getParameter("status");

        if (status == null) {
            response.sendRedirect("seller-orders.jsp?error=invalidStatus");
            return;
        }

        if (!status.equals("PLACED")
                && !status.equals("SHIPPED")
                && !status.equals("DELIVERED")
                && !status.equals("COMPLETED")
                && !status.equals("CANCELLED")) {

            response.sendRedirect("seller-orders.jsp?error=invalidStatus");
            return;
        }

        String sql = "UPDATE orders SET status = ? " +
                "WHERE id = ? AND seller_id = ?";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, status);
            statement.setInt(2, orderId);
            statement.setInt(3, seller.getId());

            int updated = statement.executeUpdate();

            if (updated > 0) {
                response.sendRedirect("seller-orders.jsp?success=statusUpdated");
            } else {
                response.sendRedirect("seller-orders.jsp?error=updateFailed");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("seller-orders.jsp?error=updateFailed");
        }
    }
}