package com.yogasri.yogasrimart.listener;
import com.yogasri.yogasrimart.util.DatabaseConnection;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.io.InputStream;
import java.sql.Connection;
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
            String sql = new String(inputStream.readAllBytes());
            try (Statement statement = connection.createStatement()) {
                statement.execute(sql);
            }
            System.out.println("Database tables created successfully.");
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Database schema initialization failed.", e);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Error reading schema.sql.", e);
        }
        System.out.println("Database connection pool initialized successfully.");
    }
    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        DatabaseConnection.shutdown();
        System.out.println("YogasriMart Database Initializer Stopped");
    }
}