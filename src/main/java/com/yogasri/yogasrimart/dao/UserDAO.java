package com.yogasri.yogasrimart.dao;

import com.yogasri.yogasrimart.model.User;
import com.yogasri.yogasrimart.util.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {

    // FIND USER BY EMAIL
    public User findByEmail(String email) {

        String sql = "SELECT * FROM users WHERE email = ?";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, email);

            try (ResultSet resultSet = statement.executeQuery()) {

                if (resultSet.next()) {

                    User user = new User();

                    user.setId(resultSet.getInt("id"));
                    user.setName(resultSet.getString("name"));
                    user.setEmail(resultSet.getString("email"));
                    user.setPassword(resultSet.getString("password_hash"));
                    user.setRole(resultSet.getString("role"));

                    return user;
                }
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return null;
    }


    // REGISTER USER
    public boolean registerUser(User user) {

        String sql =
                "INSERT INTO users " +
                "(name, email, password_hash, role) " +
                "VALUES (?, ?, ?, ?)";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, user.getName());
            statement.setString(2, user.getEmail());
            statement.setString(3, user.getPassword());
            statement.setString(4, user.getRole());

            int rowsInserted = statement.executeUpdate();

            return rowsInserted > 0;

        } catch (Exception e) {

            e.printStackTrace();

            throw new RuntimeException(e);
        }
    }


    // GET ALL USERS
    public List<User> getAllUsers() {

        List<User> users = new ArrayList<>();

        String sql =
                "SELECT id, name, email, password_hash, role " +
                "FROM users ORDER BY id DESC";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement =
                     connection.prepareStatement(sql);
             ResultSet resultSet =
                     statement.executeQuery()) {

            while (resultSet.next()) {

                User user = new User();

                user.setId(resultSet.getInt("id"));
                user.setName(resultSet.getString("name"));
                user.setEmail(resultSet.getString("email"));
                user.setPassword(
                        resultSet.getString("password_hash")
                );
                user.setRole(resultSet.getString("role"));

                users.add(user);
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return users;
    }
}