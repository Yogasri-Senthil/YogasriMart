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
import java.util.List;
@WebServlet("/my-products")
public class MyProductsServlet extends HttpServlet {
    private ProductDAO productDAO = new ProductDAO();
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
        int sellerId = user.getId();
        List<Product> products =
                productDAO.getProductsBySeller(sellerId);
        request.setAttribute("products", products);
        request.getRequestDispatcher("my-products.jsp")
               .forward(request, response);
    }
}