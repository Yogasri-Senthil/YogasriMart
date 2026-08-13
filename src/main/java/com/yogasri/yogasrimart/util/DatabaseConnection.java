package com.yogasri.yogasrimart.util;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
public class DatabaseConnection {
    private static final String URL = "jdbc:h2:./data/yogasrimart";
    private static final String USER = "sa";
    private static final String PASSWORD = "";
    public static Connection getConnection() throws SQLException {
        Connection connection =
                DriverManager.getConnection(URL, USER, PASSWORD);
        try {
            InputStream inputStream =
                    DatabaseConnection.class.getClassLoader()
                            .getResourceAsStream("schema.sql");
            if (inputStream == null) {
                throw new SQLException("schema.sql not found");
            }
            String sql = new String(
                    inputStream.readAllBytes(),
                    StandardCharsets.UTF_8
            );
            Statement statement = connection.createStatement();
            statement.execute(sql);
            statement.close();
            inputStream.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return connection;
    }
}