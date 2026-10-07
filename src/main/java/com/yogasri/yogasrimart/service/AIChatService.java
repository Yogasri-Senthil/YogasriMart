package com.yogasri.yogasrimart.service;

import com.openai.client.OpenAIClient;
import com.openai.client.okhttp.OpenAIOkHttpClient;
import com.openai.models.ChatModel;
import com.openai.models.responses.Response;
import com.openai.models.responses.ResponseCreateParams;

public class AIChatService {

    private final OpenAIClient client;

    public AIChatService() {
        client = OpenAIOkHttpClient.fromEnv();
    }

    public String ask(String question) {

        if (question == null || question.trim().isEmpty()) {
            return "Please enter a question.";
        }

        String cleanQuestion = question.trim();

        if (cleanQuestion.length() > 500) {
            return "Please keep your question within 500 characters.";
        }

        String prompt =
                "You are YogasriMart AI Assistant. " +
                "YogasriMart is a Java-based online shopping website. " +
                "Help users with products, shopping, cart, wishlist, " +
                "orders, checkout, payments, and seller features. " +
                "Give simple and helpful answers. " +
                "If a question is unrelated to YogasriMart, politely " +
                "say that you can mainly help with YogasriMart. " +
                "User question: " + cleanQuestion;

        ResponseCreateParams params =
                ResponseCreateParams.builder()
                        .input(prompt)
                        .model(ChatModel.GPT_5_2)
                        .build();

        Response response = client.responses().create(params);

        return response.output()
                .stream()
                .flatMap(item -> item.message().stream())
                .flatMap(message -> message.content().stream())
                .flatMap(content -> content.outputText().stream())
                .map(outputText -> outputText.text())
                .findFirst()
                .orElse("Sorry, I could not generate a response.");
    }
}