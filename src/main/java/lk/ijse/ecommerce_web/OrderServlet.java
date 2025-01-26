package lk.ijse.ecommerce_web;

import jakarta.annotation.Resource;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonObject;
import javax.json.JsonReader;
import javax.sql.DataSource;
import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

@WebServlet(name = "OrderServlet", value = "/order")
public class OrderServlet extends HttpServlet {
    @Resource(name= "java:comp/env/jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, IOException {
        response.setContentType("application/json");

        try {
           /* // Parse JSON from request body
            StringBuilder sb = new StringBuilder();
            BufferedReader reader = request.getReader();
            String line;
            while ((line = reader.readLine()) != null) {
                sb.append(line);
            }*/

            JsonReader jreader = Json.createReader(request.getInputStream());
            JsonObject orderData = jreader.readObject();
            jreader.close();

            double totalAmount = orderData.getJsonNumber("totalAmount").doubleValue();
            JsonArray items = orderData.getJsonArray("items");

            // Simulate user ID (replace with actual user authentication)
            HttpSession session = request.getSession();

            int userId =   (int) session.getAttribute("userId");; // Replace with actual logged-in user ID

            // Insert into orders table
            Connection conn = dataSource.getConnection();
            String insertOrderQuery = "INSERT INTO orders (userId, orderDate, total_amount) VALUES (?, NOW(), ?)";
            PreparedStatement psOrder = conn.prepareStatement(insertOrderQuery, Statement.RETURN_GENERATED_KEYS);
            psOrder.setInt(1, userId);
            psOrder.setDouble(2, totalAmount);
            psOrder.executeUpdate();

            // Get generated order ID
            ResultSet rsOrder = psOrder.getGeneratedKeys();
            rsOrder.next();
            int orderId = rsOrder.getInt(1);

            // Insert into orderdetails table
            String insertDetailsQuery = "INSERT INTO orderdetails (orderId, productId, quantity, price) VALUES (?, ?, ?, ?)";
            PreparedStatement psDetails = conn.prepareStatement(insertDetailsQuery);

            for (int i = 0; i < items.toArray().length; i++) {
                JsonObject item = items.getJsonObject(i);
                int productId = item.getInt("productId");
                int quantity = item.getInt("quantity");
                double price = item.getInt("price");

                psDetails.setInt(1, orderId);
                psDetails.setInt(2, productId);
                psDetails.setInt(3, quantity);
                psDetails.setDouble(4, price);
                psDetails.addBatch();
            }

            psDetails.executeBatch();

            // Close resources
            psDetails.close();
            psOrder.close();
            conn.close();

            // Send success response
            response.getWriter().write("{\"message\":\"Order placed successfully!\"}");

        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"error\":\"Failed to place order.\"}");
        }
    }

}
