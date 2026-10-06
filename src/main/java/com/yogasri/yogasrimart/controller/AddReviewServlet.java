package com.yogasri.yogasrimart.controller;

import com.yogasri.yogasrimart.dao.OrderDAO;
import com.yogasri.yogasrimart.dao.ReviewDAO;
import com.yogasri.yogasrimart.model.Review;
import com.yogasri.yogasrimart.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/add-review")
public class AddReviewServlet extends HttpServlet {

    private ReviewDAO reviewDAO = new ReviewDAO();
    private OrderDAO orderDAO = new OrderDAO();

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

        if (!"BUYER".equals(user.getRole())) {
            response.sendRedirect("login.jsp");
            return;
        }

        int productId;
        int orderId;
        int rating;

        try {
            productId = Integer.parseInt(request.getParameter("productId"));
            orderId = Integer.parseInt(request.getParameter("orderId"));
            rating = Integer.parseInt(request.getParameter("rating"));
        } catch (NumberFormatException e) {
            response.sendRedirect("buyer-orders?error=invalidReview");
            return;
        }

        String comment = request.getParameter("comment");

        if (rating < 1 || rating > 5) {
            response.sendRedirect("buyer-orders?error=invalidRating");
            return;
        }

        if (comment == null) {
            comment = "";
        }

        comment = comment.trim();

        if (comment.length() > 500) {
            response.sendRedirect("buyer-orders?error=commentTooLong");
            return;
        }

        if (!orderDAO.isCompletedOrder(
                user.getId(),
                orderId,
                productId)) {

            response.sendRedirect("buyer-orders?error=notEligible");
            return;
        }

        if (reviewDAO.hasReviewed(
                user.getId(),
                orderId,
                productId)) {

            response.sendRedirect("buyer-orders?error=alreadyReviewed");
            return;
        }

        Review review = new Review();

        review.setProductId(productId);
        review.setBuyerId(user.getId());
        review.setOrderId(orderId);
        review.setRating(rating);
        review.setComment(comment);

        boolean added = reviewDAO.addReview(review);

        if (added) {
            response.sendRedirect("buyer-orders?success=reviewAdded");
        } else {
            response.sendRedirect("buyer-orders?error=reviewFailed");
        }
    }
}