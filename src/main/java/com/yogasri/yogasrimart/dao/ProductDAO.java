package com.yogasri.yogasrimart.dao;

import com.yogasri.yogasrimart.model.Product;
import com.yogasri.yogasrimart.util.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {

    public boolean addProduct(Product product) {

        String sql = "INSERT INTO products " +
                     "(name, description, price, category, stock, seller_id) " +
                     "VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, product.getName());
            statement.setString(2, product.getDescription());
            statement.setDouble(3, product.getPrice());
            statement.setString(4, product.getCategory());
            statement.setInt(5, product.getStock());
            statement.setInt(6, product.getSellerId());

            int rows = statement.executeUpdate();

            return rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Product> getProductsBySeller(int sellerId) {

        List<Product> products = new ArrayList<>();

        String sql = "SELECT id, name, description, price, category, stock " +
                     "FROM products WHERE seller_id = ? ORDER BY id DESC";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, sellerId);

            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {

                Product product = new Product();

                product.setId(resultSet.getInt("id"));
                product.setName(resultSet.getString("name"));
                product.setDescription(resultSet.getString("description"));
                product.setPrice(resultSet.getDouble("price"));
                product.setCategory(resultSet.getString("category"));
                product.setStock(resultSet.getInt("stock"));

                products.add(product);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return products;
    }
    public boolean deleteProduct(int productId, int sellerId) {

    String sql = "DELETE FROM products WHERE id = ? AND seller_id = ?";

    try (Connection connection = DatabaseConnection.getConnection();
         PreparedStatement statement = connection.prepareStatement(sql)) {

        statement.setInt(1, productId);
        statement.setInt(2, sellerId);

        int rows = statement.executeUpdate();

        return rows > 0;

    } catch (Exception e) {
        e.printStackTrace();
        return false;
    }
}
public boolean updateProduct(Product product) {

    String sql = "UPDATE products SET " +
                 "name = ?, description = ?, price = ?, " +
                 "category = ?, stock = ? " +
                 "WHERE id = ? AND seller_id = ?";

    try (Connection connection = DatabaseConnection.getConnection();
         PreparedStatement statement = connection.prepareStatement(sql)) {

        statement.setString(1, product.getName());
        statement.setString(2, product.getDescription());
        statement.setDouble(3, product.getPrice());
        statement.setString(4, product.getCategory());
        statement.setInt(5, product.getStock());
        statement.setInt(6, product.getId());
        statement.setInt(7, product.getSellerId());

        int rows = statement.executeUpdate();

        return rows > 0;

    } catch (Exception e) {
        e.printStackTrace();
        return false;
    }
}
public Product getProductById(int productId, int sellerId) {

    String sql = "SELECT id, name, description, price, category, stock " +
                 "FROM products WHERE id = ? AND seller_id = ?";

    try (Connection connection = DatabaseConnection.getConnection();
         PreparedStatement statement = connection.prepareStatement(sql)) {

        statement.setInt(1, productId);
        statement.setInt(2, sellerId);

        ResultSet resultSet = statement.executeQuery();

        if (resultSet.next()) {

            Product product = new Product();

            product.setId(resultSet.getInt("id"));
            product.setName(resultSet.getString("name"));
            product.setDescription(resultSet.getString("description"));
            product.setPrice(resultSet.getDouble("price"));
            product.setCategory(resultSet.getString("category"));
            product.setStock(resultSet.getInt("stock"));
            product.setSellerId(sellerId);

            return product;
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return null;
}
}