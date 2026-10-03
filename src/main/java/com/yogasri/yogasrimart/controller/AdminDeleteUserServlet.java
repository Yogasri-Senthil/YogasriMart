package com.yogasri.yogasrimart.controller;

import com.yogasri.yogasrimart.dao.UserDAO;
import com.yogasri.yogasrimart.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/admin-delete-user")
public class AdminDeleteUserServlet extends HttpServlet {

    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");

        if (!"ADMIN".equals(user.getRole())) {
            response.sendRedirect("login.jsp");
            return;
        }

        int userId;

        try {
            userId = Integer.parseInt(request.getParameter("id"));
        } catch (NumberFormatException e) {
            response.sendRedirect("admin-users.jsp");
            return;
        }

        if (userId == user.getId()) {
            response.sendRedirect("admin-users.jsp?error=cannotDeleteSelf");
            return;
        }

        boolean deleted = userDAO.deleteUserByAdmin(userId);

        if (deleted) {
            response.sendRedirect("admin-users.jsp?success=deleted");
        } else {
            response.sendRedirect("admin-users.jsp?error=deleteFailed");
        }
    }
}