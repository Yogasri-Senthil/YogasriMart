package com.yogasri.yogasrimart.dao;

import com.yogasri.yogasrimart.model.Review;
import com.yogasri.yogasrimart.util.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ReviewDAO {

    public boolean addReview(Review review) {

        String sql = "INSERT INTO reviews " +
                "(product_id, buyer_id, order_id, rating, comment) " +
                "VALUES (?, ?, ?, ?, ?)";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, review.getProductId());
            statement.setInt(2, review.getBuyerId());
            statement.setInt(3, review.getOrderId());
            statement.setInt(4, review.getRating());
            statement.setString(5, review.getComment());

            return statement.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Review> getReviewsByProduct(int productId) {

        List<Review> reviews = new ArrayList<>();

        String sql = "SELECT id, product_id, buyer_id, order_id, " +
                "rating, comment, created_at " +
                "FROM reviews " +
                "WHERE product_id = ? " +
                "ORDER BY id DESC";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, productId);

            try (ResultSet resultSet = statement.executeQuery()) {

                while (resultSet.next()) {

                    Review review = new Review();

                    review.setId(resultSet.getInt("id"));
                    review.setProductId(resultSet.getInt("product_id"));
                    review.setBuyerId(resultSet.getInt("buyer_id"));
                    review.setOrderId(resultSet.getInt("order_id"));
                    review.setRating(resultSet.getInt("rating"));
                    review.setComment(resultSet.getString("comment"));
                    review.setCreatedAt(resultSet.getTimestamp("created_at"));

                    reviews.add(review);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return reviews;
    }

    public boolean hasReviewed(int buyerId, int orderId, int productId) {

        String sql = "SELECT COUNT(*) FROM reviews " +
                "WHERE buyer_id = ? AND order_id = ? AND product_id = ?";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, buyerId);
            statement.setInt(2, orderId);
            statement.setInt(3, productId);

            try (ResultSet resultSet = statement.executeQuery()) {

                if (resultSet.next()) {
                    return resultSet.getInt(1) > 0;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}