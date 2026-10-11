package com.yogasri.yogasrimart.util;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

import java.sql.Connection;
import java.sql.SQLException;

public class DatabaseConnection {

    private static HikariDataSource dataSource;

    public static synchronized void initialize() {

        if (dataSource != null && !dataSource.isClosed()) {
            return;
        }

        String host = System.getenv("MYSQLHOST");
        String port = System.getenv("MYSQLPORT");
        String database = System.getenv("MYSQL_DATABASE");
        String username = System.getenv("MYSQLUSER");
        String password = System.getenv("MYSQLPASSWORD");

        if (host == null || port == null || database == null
                || username == null || password == null) {

            throw new IllegalStateException(
                    "Railway MySQL environment variables are missing."
            );
        }

        HikariConfig config = new HikariConfig();

        config.setJdbcUrl(
                "jdbc:mysql://" + host + ":" + port + "/" + database
                        + "?sslMode=REQUIRED"
        );

        config.setUsername(username);
        config.setPassword(password);
        config.setDriverClassName("com.mysql.cj.jdbc.Driver");
        config.setMaximumPoolSize(5);
        config.setConnectionTimeout(30000);

        dataSource = new HikariDataSource(config);

        // Verify the database connection.
        try (Connection connection = dataSource.getConnection()) {
            System.out.println(
                    "Railway MySQL connection verified successfully."
            );
        } catch (SQLException e) {
            dataSource.close();
            dataSource = null;
            throw new IllegalStateException(
                    "Railway MySQL connection failed.", e
            );
        }
    }

    public static Connection getConnection() throws SQLException {

        if (dataSource == null || dataSource.isClosed()) {
            throw new SQLException(
                    "Database connection pool is not initialized."
            );
        }

        return dataSource.getConnection();
    }

    public static synchronized void shutdown() {

        if (dataSource != null) {
            dataSource.close();
            dataSource = null;
        }
    }
}