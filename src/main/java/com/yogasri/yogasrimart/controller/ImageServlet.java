package com.yogasri.yogasrimart.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.Files;

@WebServlet("/product-images/*")
public class ImageServlet extends HttpServlet {

    private static final String IMAGE_DIRECTORY =
            "D:\\YogasriMart\\uploads\\products";

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String pathInfo = request.getPathInfo();

        if (pathInfo == null ||
                pathInfo.equals("/") ||
                pathInfo.contains("..")) {

            response.sendError(
                    HttpServletResponse.SC_NOT_FOUND
            );
            return;
        }

        String fileName =
                new File(pathInfo).getName();

        File imageFile =
                new File(
                        IMAGE_DIRECTORY,
                        fileName
                );

        if (!imageFile.exists() ||
                !imageFile.isFile()) {

            response.sendError(
                    HttpServletResponse.SC_NOT_FOUND
            );
            return;
        }

        String contentType =
                getServletContext()
                        .getMimeType(
                                imageFile.getName()
                        );

        if (contentType == null) {
            contentType = "application/octet-stream";
        }

        response.setContentType(contentType);
        response.setContentLengthLong(
                imageFile.length()
        );

        try (OutputStream outputStream =
                     response.getOutputStream()) {

            Files.copy(
                    imageFile.toPath(),
                    outputStream
            );
        }
    }
}