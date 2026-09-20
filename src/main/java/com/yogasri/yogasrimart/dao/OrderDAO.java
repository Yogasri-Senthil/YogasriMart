package com.yogasri.yogasrimart.dao;

import com.yogasri.yogasrimart.util.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO {

    public boolean createOrder(
            int buyerId,
            int sellerId,
            int productId,
            String productName,
            int quantity,
            double totalPrice,
            String customerName,
            String address,
            String city,
            String pincode,
            String paymentMethod) {

        String sql = "INSERT INTO orders " +
                "(buyer_id, seller_id, product_id, product_name, quantity, " +
                "total_price, customer_name, address, city, pincode, " +
                "payment_method, status) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement =
                     connection.prepareStatement(sql)) {

            statement.setInt(1, buyerId);
            statement.setInt(2, sellerId);
            statement.setInt(3, productId);
            statement.setString(4, productName);
            statement.setInt(5, quantity);
            statement.setDouble(6, totalPrice);
            statement.setString(7, customerName);
            statement.setString(8, address);
            statement.setString(9, city);
            statement.setString(10, pincode);
            statement.setString(11, paymentMethod);
            statement.setString(12, "PLACED");

            return statement.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<OrderData> getOrdersBySeller(int sellerId) {

        List<OrderData> orders = new ArrayList<>();

        String sql = "SELECT * FROM orders " +
                "WHERE seller_id = ? ORDER BY id DESC";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement =
                     connection.prepareStatement(sql)) {

            statement.setInt(1, sellerId);

            ResultSet rs = statement.executeQuery();

            while (rs.next()) {

                OrderData order = new OrderData();

                order.id = rs.getInt("id");
                order.productName = rs.getString("product_name");
                order.quantity = rs.getInt("quantity");
                order.totalPrice = rs.getDouble("total_price");
                order.customerName = rs.getString("customer_name");
                order.address = rs.getString("address");
                order.city = rs.getString("city");
                order.pincode = rs.getString("pincode");
                order.paymentMethod = rs.getString("payment_method");
                order.status = rs.getString("status");

                orders.add(order);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return orders;
    }

    public static class OrderData {

        public int id;
        public String productName;
        public int quantity;
        public double totalPrice;
        public String customerName;
        public String address;
        public String city;
        public String pincode;
        public String paymentMethod;
        public String status;
    }
}