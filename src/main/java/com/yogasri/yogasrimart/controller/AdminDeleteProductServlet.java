package com.yogasri.yogasrimart.controller;

import com.yogasri.yogasrimart.dao.ProductDAO;
import com.yogasri.yogasrimart.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/admin-delete-product")
public class AdminDeleteProductServlet extends HttpServlet {

    private ProductDAO productDAO = new ProductDAO();

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

        int productId;

        try {
            productId = Integer.parseInt(request.getParameter("id"));
        } catch (NumberFormatException e) {
            response.sendRedirect("admin-products.jsp");
            return;
        }

        boolean deleted = productDAO.deleteProductByAdmin(productId);

        if (deleted) {
            response.sendRedirect("admin-products.jsp?success=deleted");
        } else {
            response.sendRedirect("admin-products.jsp?error=deleteFailed");
        }
    }
}