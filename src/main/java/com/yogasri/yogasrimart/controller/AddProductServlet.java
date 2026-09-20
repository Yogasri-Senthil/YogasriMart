package com.yogasri.yogasrimart.controller;
import com.yogasri.yogasrimart.dao.ProductDAO;
import com.yogasri.yogasrimart.model.Product;
import com.yogasri.yogasrimart.model.User;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
@WebServlet("/add-product")
public class AddProductServlet extends HttpServlet {
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
        String name = request.getParameter("productName");
        String category = request.getParameter("category");
        String priceText = request.getParameter("price");
        String quantityText = request.getParameter("quantity");
        String description = request.getParameter("description");
        try {
            double price = Double.parseDouble(priceText);
            int stock = Integer.parseInt(quantityText);
            Product product = new Product();
            product.setName(name);
            product.setCategory(category);
            product.setPrice(price);
            product.setStock(stock);
            product.setDescription(description);
            // Logged-in seller ID
            product.setSellerId(user.getId());
            boolean added = productDAO.addProduct(product);
            if (added) {
                response.sendRedirect("seller.jsp?success=productAdded");
            } else {
                response.sendRedirect("add-product.jsp?error=failed");
            }
        } catch (NumberFormatException e) {
            response.sendRedirect("add-product.jsp?error=invalid");
        }
    }
}