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

        try {
            // Initialize database connection
            DatabaseConnection.initialize();

            // Get database connection
            try (Connection connection =
                         DatabaseConnection.getConnection()) {

                // Load schema.sql from WEB-INF/classes
                InputStream inputStream =
                        DatabaseInitializer.class
                                .getClassLoader()
                                .getResourceAsStream("schema.sql");

                if (inputStream == null) {
                    throw new IllegalStateException(
                            "schema.sql not found in WEB-INF/classes"
                    );
                }

                String sql;

                try (inputStream) {
                    sql = new String(
                            inputStream.readAllBytes(),
                            StandardCharsets.UTF_8
                    );
                }

                // Execute SQL statements
                try (Statement statement =
                             connection.createStatement()) {

                    for (String query : sql.split(";")) {
                        query = query.trim();

                        if (!query.isEmpty()) {
                            statement.execute(query);
                        }
                    }
                }

                System.out.println(
                        "Database tables created successfully."
                );

                // Create default admin account
                createDefaultAdmin(connection);
            }

            System.out.println(
                    "Database initialization completed successfully."
            );

        } catch (Exception e) {
            System.err.println("Database initialization failed.");
            e.printStackTrace();

            throw new RuntimeException(
                    "Database initialization failed.", e
            );
        }
    }

    private void createDefaultAdmin(Connection connection)
            throws SQLException {

        String sql =
                "INSERT INTO users (name, email, password_hash, role) "
                + "VALUES (?, ?, ?, ?) "
                + "ON DUPLICATE KEY UPDATE email = email";

        try (PreparedStatement statement =
                     connection.prepareStatement(sql)) {

            statement.setString(1, "Admin");
            statement.setString(2, "admin@gmail.com");

            // Replace with the password hash expected by your login code.
            statement.setString(3, "Admin@123");

            statement.setString(4, "ADMIN");

            statement.executeUpdate();
        }

        System.out.println("Default ADMIN account created.");
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {

        DatabaseConnection.shutdown();

        System.out.println(
                "YogasriMart Database Initializer Stopped"
        );
    }
}