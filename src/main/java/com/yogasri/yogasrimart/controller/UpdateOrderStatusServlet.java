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
import java.sql.ResultSet;

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

        String newStatus = request.getParameter("status");

        if (newStatus == null) {
            response.sendRedirect("seller-orders.jsp?error=invalidStatus");
            return;
        }

        if (!newStatus.equals("SHIPPED")
                && !newStatus.equals("DELIVERED")
                && !newStatus.equals("COMPLETED")
                && !newStatus.equals("CANCELLED")) {

            response.sendRedirect("seller-orders.jsp?error=invalidStatus");
            return;
        }

        String currentStatus = null;

        String selectSql =
                "SELECT status FROM orders " +
                "WHERE id = ? AND seller_id = ?";

        try (Connection connection =
                     DatabaseConnection.getConnection();
             PreparedStatement statement =
                     connection.prepareStatement(selectSql)) {

            statement.setInt(1, orderId);
            statement.setInt(2, seller.getId());

            try (ResultSet resultSet =
                         statement.executeQuery()) {

                if (resultSet.next()) {
                    currentStatus =
                            resultSet.getString("status");
                } else {
                    response.sendRedirect(
                            "seller-orders.jsp?error=invalidOrder");
                    return;
                }
            }

            boolean validTransition = false;

            if ("PLACED".equals(currentStatus)) {

                if ("SHIPPED".equals(newStatus)
                        || "CANCELLED".equals(newStatus)) {
                    validTransition = true;
                }

            } else if ("SHIPPED".equals(currentStatus)) {

                if ("DELIVERED".equals(newStatus)
                        || "CANCELLED".equals(newStatus)) {
                    validTransition = true;
                }

            } else if ("DELIVERED".equals(currentStatus)) {

                if ("COMPLETED".equals(newStatus)) {
                    validTransition = true;
                }
            }

            if (!validTransition) {
                response.sendRedirect(
                        "seller-orders.jsp?error=invalidTransition");
                return;
            }

            String updateSql =
                    "UPDATE orders SET status = ? " +
                    "WHERE id = ? AND seller_id = ?";

            try (PreparedStatement updateStatement =
                         connection.prepareStatement(updateSql)) {

                updateStatement.setString(1, newStatus);
                updateStatement.setInt(2, orderId);
                updateStatement.setInt(3, seller.getId());

                int updated =
                        updateStatement.executeUpdate();

                if (updated > 0) {
                    response.sendRedirect(
                            "seller-orders.jsp?success=statusUpdated");
                } else {
                    response.sendRedirect(
                            "seller-orders.jsp?error=updateFailed");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();

            response.sendRedirect(
                    "seller-orders.jsp?error=updateFailed");
        }
    }
}