package com.yogasri.yogasrimart.util;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import java.sql.Connection;
import java.sql.SQLException;

public class DatabaseConnection {

    private static HikariDataSource dataSource;

    public static void initialize() {

        HikariConfig config = new HikariConfig();

        String host = System.getenv("MYSQLHOST");
        String port = System.getenv("MYSQLPORT");
        String database = System.getenv("MYSQLDATABASE");
        String username = System.getenv("MYSQLUSER");
        String password = System.getenv("MYSQL_PASSWORD");

        if (host == null || port == null || database == null
                || username == null || password == null) {

            throw new IllegalStateException(
                "Railway MySQL environment variables are missing."
            );
        }

        config.setJdbcUrl(
            "jdbc:mysql://" + host + ":" + port + "/" + database
                + "?sslMode=REQUIRED"
        );

        config.setUsername(username);
        config.setPassword(password);
        config.setDriverClassName("com.mysql.cj.jdbc.Driver");
        config.setMaximumPoolSize(10);

        dataSource = new HikariDataSource(config);

        System.out.println("MySQL connection pool initialized.");
    }

    public static Connection getConnection() throws SQLException {

        if (dataSource == null) {
            throw new SQLException(
                "Database connection pool is not initialized."
            );
        }

        return dataSource.getConnection();
    }

    public static void shutdown() {

        if (dataSource != null) {
            dataSource.close();
        }
    }
}