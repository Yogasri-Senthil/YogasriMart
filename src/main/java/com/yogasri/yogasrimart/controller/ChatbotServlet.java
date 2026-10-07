package com.yogasri.yogasrimart.controller;

import com.yogasri.yogasrimart.service.AIChatService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/chat")
public class ChatbotServlet extends HttpServlet {

    private AIChatService aiChatService;

    @Override
    public void init() throws ServletException {
        aiChatService = new AIChatService();
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/plain; charset=UTF-8");

        String question = request.getParameter("question");

        try {

            String answer = aiChatService.ask(question);

            response.getWriter().write(answer);

        } catch (Exception e) {

            e.printStackTrace();

            response.setStatus(
                    HttpServletResponse.SC_INTERNAL_SERVER_ERROR);

            response.getWriter().write(
                    "Sorry, the AI assistant is temporarily unavailable."
            );
        }
    }
}