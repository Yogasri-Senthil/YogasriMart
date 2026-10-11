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

        // Support both database variable names.
        String database = System.getenv("MYSQL_DATABASE");

        if (database == null || database.isBlank()) {
            database = System.getenv("MYSQLDATABASE");
        }

        String username = System.getenv("MYSQLUSER");

        // Support both password variable names.
        String password = System.getenv("MYSQLPASSWORD");

        if (password == null || password.isBlank()) {
            password = System.getenv("MYSQL_PASSWORD");
        }

        // Validate required environment variables.
        if (host == null || host.isBlank()
                || port == null || port.isBlank()
                || database == null || database.isBlank()
                || username == null || username.isBlank()
                || password == null || password.isBlank()) {

            throw new IllegalStateException(
                    "Railway MySQL environment variables are missing. "
                    + "Check MYSQLHOST, MYSQLPORT, MYSQL_DATABASE/"
                    + "MYSQLDATABASE, MYSQLUSER and MYSQLPASSWORD."
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

        HikariDataSource newDataSource = new HikariDataSource(config);

        // Verify database connection before saving the pool.
        try (Connection connection = newDataSource.getConnection()) {

            dataSource = newDataSource;

            System.out.println(
                    "Railway MySQL connection verified successfully."
            );

        } catch (SQLException e) {

            newDataSource.close();

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