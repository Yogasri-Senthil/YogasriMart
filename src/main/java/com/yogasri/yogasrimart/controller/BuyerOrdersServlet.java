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

@WebServlet("/buyer-orders")
public class BuyerOrdersServlet extends HttpServlet {

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

    if (!"BUYER".equals(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<OrderDAO.OrderData> orders =
            orderDAO.getOrdersByBuyer(user.getId());

    request.setAttribute("orders", orders);

    request.getRequestDispatcher("buyer-orders.jsp")
            .forward(request, response);
}

}