package com.example;

import com.sun.net.httpserver.HttpServer;
import com.sun.net.httpserver.HttpHandler;
import com.sun.net.httpserver.HttpExchange;
import java.io.IOException;
import java.net.InetSocketAddress;

public class Main {
    public static void main(String[] args) throws IOException {
        // Start health check server on port 8080
        HttpServer server = HttpServer.create(new InetSocketAddress(8080), 0);
        
        // Health check endpoint
        server.createContext("/health", new HttpHandler() {
            @Override
            public void handle(HttpExchange exchange) throws IOException {
                String response = "{\"status\":\"UP\",\"version\":\"1.0.0\"}";
                exchange.getResponseHeaders().set("Content-Type", "application/json");
                exchange.sendResponseHeaders(200, response.getBytes().length);
                exchange.getResponseBody().write(response.getBytes());
                exchange.close();
            }
        });
        
        // API endpoint for calculator
        server.createContext("/api/calculate", new HttpHandler() {
            @Override
            public void handle(HttpExchange exchange) throws IOException {
                String query = exchange.getRequestURI().getQuery();
                String response = "{\"message\":\"Calculator API\"}";
                exchange.getResponseHeaders().set("Content-Type", "application/json");
                exchange.sendResponseHeaders(200, response.getBytes().length);
                exchange.getResponseBody().write(response.getBytes());
                exchange.close();
            }
        });
        
        server.setExecutor(null);
        server.start();
        System.out.println("✅ Server started on port 8080");
    }
}
