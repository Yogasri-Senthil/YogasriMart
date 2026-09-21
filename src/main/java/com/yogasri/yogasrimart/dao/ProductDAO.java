package com.yogasri.yogasrimart.dao;

import com.yogasri.yogasrimart.model.Product;
import com.yogasri.yogasrimart.util.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {

    // ADD PRODUCT
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

            return statement.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }


    // GET ALL PRODUCTS
    public List<Product> getAllProducts() {

        List<Product> products = new ArrayList<>();

        String sql = "SELECT id, name, description, price, category, " +
                "stock, seller_id " +
                "FROM products ORDER BY id DESC";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {

                Product product = new Product();

                product.setId(resultSet.getInt("id"));
                product.setName(resultSet.getString("name"));
                product.setDescription(resultSet.getString("description"));
                product.setPrice(resultSet.getDouble("price"));
                product.setCategory(resultSet.getString("category"));
                product.setStock(resultSet.getInt("stock"));
                product.setSellerId(resultSet.getInt("seller_id"));

                products.add(product);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return products;
    }


    // GET PRODUCTS BY SELLER
    public List<Product> getProductsBySeller(int sellerId) {

        List<Product> products = new ArrayList<>();

        String sql = "SELECT id, name, description, price, category, " +
                "stock, seller_id " +
                "FROM products " +
                "WHERE seller_id = ? ORDER BY id DESC";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, sellerId);

            try (ResultSet resultSet = statement.executeQuery()) {

                while (resultSet.next()) {

                    Product product = new Product();

                    product.setId(resultSet.getInt("id"));
                    product.setName(resultSet.getString("name"));
                    product.setDescription(resultSet.getString("description"));
                    product.setPrice(resultSet.getDouble("price"));
                    product.setCategory(resultSet.getString("category"));
                    product.setStock(resultSet.getInt("stock"));
                    product.setSellerId(resultSet.getInt("seller_id"));

                    products.add(product);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return products;
    }


    // GET ONE PRODUCT BY ID AND SELLER ID
    public Product getProductById(int productId, int sellerId) {

        String sql = "SELECT id, name, description, price, category, " +
                "stock, seller_id " +
                "FROM products " +
                "WHERE id = ? AND seller_id = ?";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, productId);
            statement.setInt(2, sellerId);

            try (ResultSet resultSet = statement.executeQuery()) {

                if (resultSet.next()) {

                    Product product = new Product();

                    product.setId(resultSet.getInt("id"));
                    product.setName(resultSet.getString("name"));
                    product.setDescription(resultSet.getString("description"));
                    product.setPrice(resultSet.getDouble("price"));
                    product.setCategory(resultSet.getString("category"));
                    product.setStock(resultSet.getInt("stock"));
                    product.setSellerId(resultSet.getInt("seller_id"));

                    return product;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }


    // DELETE PRODUCT
    public boolean deleteProduct(int productId, int sellerId) {

        String sql = "DELETE FROM products " +
                "WHERE id = ? AND seller_id = ?";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, productId);
            statement.setInt(2, sellerId);

            return statement.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }


    // UPDATE PRODUCT
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

            return statement.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}