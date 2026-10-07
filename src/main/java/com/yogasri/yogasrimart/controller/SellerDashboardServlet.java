package com.yogasri.yogasrimart.controller;

import com.yogasri.yogasrimart.dao.OrderDAO;
import com.yogasri.yogasrimart.dao.OrderDAO.SellerStats;
import com.yogasri.yogasrimart.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/seller-dashboard")
public class SellerDashboardServlet extends HttpServlet {

    private OrderDAO orderDAO = new OrderDAO();

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");

        if (!"SELLER".equals(user.getRole())) {
            response.sendRedirect("login.jsp");
            return;
        }

        SellerStats stats =
                orderDAO.getSellerStats(user.getId());

        request.setAttribute("sellerStats", stats);

        request.getRequestDispatcher("seller.jsp")
                .forward(request, response);
    }
}