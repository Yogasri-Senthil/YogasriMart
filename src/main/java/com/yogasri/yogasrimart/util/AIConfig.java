package com.yogasri.yogasrimart.util;

public class AIConfig {

    public static String getApiKey() {

        String apiKey = System.getenv("OPENAI_API_KEY");

        if (apiKey == null || apiKey.trim().isEmpty()) {
            throw new IllegalStateException(
                    "OPENAI_API_KEY environment variable is not configured."
            );
        }

        return apiKey;
    }
}