package com.yogasri.yogasrimart.listener;

import com.yogasri.yogasrimart.util.DatabaseConnection;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

@WebListener
public class DatabaseInitializer implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {

        System.out.println("YogasriMart Database Initializer Started");

        DatabaseConnection.initialize();

        try (
                Connection connection = DatabaseConnection.getConnection();
                InputStream inputStream = sce.getServletContext()
                        .getResourceAsStream("/WEB-INF/classes/schema.sql")
        ) {

            if (inputStream == null) {
                throw new RuntimeException("schema.sql not found");
            }

            String sql = new String(
                    inputStream.readAllBytes(),
                    StandardCharsets.UTF_8
            );

            try (Statement statement = connection.createStatement()) {

                statement.execute(sql);

            }

            System.out.println("Database tables created successfully.");

            // Create default ADMIN account
            createDefaultAdmin(connection);

        } catch (SQLException e) {

            e.printStackTrace();

            throw new RuntimeException(
                    "Database schema initialization failed.",
                    e
            );

        } catch (Exception e) {

            e.printStackTrace();

            throw new RuntimeException(
                    "Error reading schema.sql.",
                    e
            );
        }

        System.out.println(
                "Database connection pool initialized successfully."
        );
    }


    private void createDefaultAdmin(Connection connection)
            throws SQLException {

        String checkSql =
                "SELECT COUNT(*) FROM users WHERE email = ?";

        String insertSql =
                "INSERT INTO users " +
                "(name, email, password_hash, role) " +
                "VALUES (?, ?, ?, ?)";

        try (PreparedStatement checkStatement =
                     connection.prepareStatement(checkSql)) {

            checkStatement.setString(1, "admin@gmail.com");

            var resultSet = checkStatement.executeQuery();

            if (resultSet.next() && resultSet.getInt(1) == 0) {

                try (PreparedStatement insertStatement =
                             connection.prepareStatement(insertSql)) {

                    insertStatement.setString(
                            1,
                            "Admin"
                    );

                    insertStatement.setString(
                            2,
                            "admin@gmail.com"
                    );

                    insertStatement.setString(
                            3,
                            "Admin@123"
                    );

                    insertStatement.setString(
                            4,
                            "ADMIN"
                    );

                    insertStatement.executeUpdate();

                    System.out.println(
                            "Default ADMIN account created."
                    );
                }

            } else {

                System.out.println(
                        "ADMIN account already exists."
                );
            }
        }
    }


    @Override
    public void contextDestroyed(ServletContextEvent sce) {

        DatabaseConnection.shutdown();

        System.out.println(
                "YogasriMart Database Initializer Stopped"
        );
    }
}