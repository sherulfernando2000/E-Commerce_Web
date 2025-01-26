package lk.ijse.ecommerce_web;

import com.google.gson.Gson;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommerce_web.entity.Product;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/ProductSearchServlet")
public class ProductSearchServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/your_database_name";
    private static final String DB_USER = "your_db_username";
    private static final String DB_PASSWORD = "your_db_password";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, IOException {
        String query = request.getParameter("query");
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        List<Product> products = new ArrayList<>();
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String sql = "SELECT p.productId, p.name, p.price, p.quantity, c.description AS categoryDescription, p.description AS productDescription, p.image_path " +
                    "FROM product p " +
                    "JOIN categories c ON p.category_id = c.categoryid " +
                    "WHERE p.name LIKE ? OR p.description LIKE ?";

            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setString(1, "%" + query + "%");
                ps.setString(2, "%" + query + "%");

                try (ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                        Product product = new Product(
                                rs.getInt("productId"),
                                rs.getString("name"),
                                rs.getDouble("price"),
                                rs.getInt("quantity"),
                                rs.getString("categoryDescription"),
                                rs.getString("productDescription"),
                                rs.getString("image_path")
                        );
                        products.add(product);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Convert the product list to JSON and send the response
        Gson gson = new Gson();
        String jsonResponse = gson.toJson(products);
        out.print(jsonResponse);
        out.flush();
    }

    // Inner class to represent a product

}