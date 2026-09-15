package com.yogasri.yogasrimart.util;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import java.sql.Connection;
import java.sql.SQLException;
public class DatabaseConnection {
    private static HikariDataSource dataSource;
    public static void initialize() {
        HikariConfig config = new HikariConfig();
        config.setJdbcUrl("jdbc:h2:./data/yogasrimart");
        config.setUsername("sa");
        config.setPassword("");
        config.setDriverClassName("org.h2.Driver");
        config.setMaximumPoolSize(10);
        dataSource = new HikariDataSource(config);
        System.out.println("HikariCP connection pool initialized.");
    }
    public static Connection getConnection() throws SQLException {
        if (dataSource == null) {
            throw new SQLException("Database connection pool is not initialized.");
        }
        return dataSource.getConnection();
    }
    public static void shutdown() {
        if (dataSource != null) {
            dataSource.close();
            System.out.println("HikariCP connection pool closed.");
        }
    }
}