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

@WebServlet("/edit-product")
public class EditProductServlet extends HttpServlet {

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

    try {

        int productId =
                Integer.parseInt(request.getParameter("id"));

        Product product =
                productDAO.getProductById(productId, user.getId());

        if (product == null) {
            response.sendRedirect("my-products?error=notFound");
            return;
        }

        request.setAttribute("product", product);

        request.getRequestDispatcher("edit-product.jsp")
               .forward(request, response);

    } catch (Exception e) {

        e.printStackTrace();

        response.sendRedirect(
                "my-products?error=invalidProduct"
        );
    }
}
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

        try {

            int productId = Integer.parseInt(request.getParameter("id"));

            String name = request.getParameter("name");
            String description = request.getParameter("description");
            double price = Double.parseDouble(request.getParameter("price"));
            String category = request.getParameter("category");
            int stock = Integer.parseInt(request.getParameter("stock"));

            Product product = new Product();

            product.setId(productId);
            product.setName(name);
            product.setDescription(description);
            product.setPrice(price);
            product.setCategory(category);
            product.setStock(stock);
            product.setSellerId(user.getId());

            boolean updated = productDAO.updateProduct(product);

            if (updated) {
                response.sendRedirect("my-products?success=updated");
            } else {
                response.sendRedirect("my-products?error=updateFailed");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("my-products?error=invalidData");
        }
    }
}