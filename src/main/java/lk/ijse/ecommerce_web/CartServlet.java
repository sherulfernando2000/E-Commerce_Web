package lk.ijse.ecommerce_web;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


import javax.json.*;
import javax.sql.DataSource;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "CartServlet", value = "/cart")
public class CartServlet extends HttpServlet {
    @Resource(name= "java:comp/env/jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("do post in cart servlet");


        JsonReader reader = Json.createReader(req.getReader());
        JsonObject jsonObject = reader.readObject();
        String id = jsonObject.getString("productId");
        String qty = jsonObject.getString("productQty");
        System.out.println(id+" "+qty);
        int productIdInt = Integer.parseInt(id);
        int qtyInt = Integer.parseInt(qty);


        System.out.println(id+" "+qty);
        HttpSession session = req.getSession();
        int userId = (int) session.getAttribute("userId");
        PrintWriter writer = resp.getWriter();

        try( Connection connection = dataSource.getConnection()) {
            PreparedStatement pstm = connection.prepareStatement("INSERT INTO cart(userId,productId,quantity) VALUES (?,?,?) ");

            pstm.setInt(1, userId);
            pstm.setInt(2, productIdInt);
            pstm.setInt(3, qtyInt);
            int i = pstm.executeUpdate();
            resp.setContentType("application/json");

            if (i>0) {
                writer.write("{\"status\":\"success\"}");


            } else {
                writer.write("{\"status\":\"failure\"}");

            }


        }catch (Exception e){
            e.printStackTrace();
            writer.write("{\"status\":\"failure\"}");

        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try(Connection connection = dataSource.getConnection();) {

            HttpSession session = req.getSession();
            int userId = (int) session.getAttribute("userId");
            PreparedStatement pstm = connection.prepareStatement("select * from cart where userId = ?");
            pstm.setInt(1, userId);
            ResultSet resultSet = pstm.executeQuery();
            JsonArrayBuilder products = Json.createArrayBuilder();
            while (resultSet.next()) {
                int productId = resultSet.getInt("productId");
                int quantity = resultSet.getInt("quantity");
                System.out.println("productid:"+productId+" "+quantity);

                JsonObjectBuilder productJson = Json.createObjectBuilder();

                Product product = searchProduct(productId);
                String name = product.getName();
                double price = product.getPrice();
                String description = product.getDescription();
                String imagePath = product.getImage_path();

                productJson.add("productId", productId);
                productJson.add("name",name);
                productJson.add("price",price);
                productJson.add("description",description);
                productJson.add("image_path",imagePath);
                productJson.add("quantity",quantity);

                products.add(productJson);

            }



            resp.setContentType("application/json");
            resp.setStatus(HttpServletResponse.SC_OK); //202 ok
            PrintWriter writer = resp.getWriter();
            writer.write(products.build().toString());
            writer.flush();
            writer.close();

        } catch (SQLException e) {
            e.printStackTrace();
            resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }


    }

    private Product searchProduct(int productId) {
        try(Connection connection = dataSource.getConnection();) {

            PreparedStatement pstm = connection.prepareStatement("select * from products where productId = ?");
            pstm.setInt(1, productId);
            ResultSet resultSet = pstm.executeQuery();
            System.out.println("after rs");
            if (resultSet.next()) {
                Product product = new Product();
                String name = resultSet.getString(2);
                String price = resultSet.getString(3);

                String description = resultSet.getString(6);
                String image_path = resultSet.getString(7);
                product.setName(name);
                product.setPrice(Double.parseDouble(price));
                product.setDescription(description);
                product.setImage_path(image_path);
                return product;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

    return null;
    }


    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int productId = Integer.parseInt(req.getPathInfo().substring(1)); // Extract product ID from URL
        PrintWriter writer = resp.getWriter();
        resp.setContentType("application/json");

        try (Connection conn = dataSource.getConnection()) {
            String sql = "DELETE FROM cart WHERE productId = ?";
            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setInt(1, productId);

            int rows = pstm.executeUpdate();
            if (rows > 0) {
                writer.write("{\"status\":\"success\"}");
            } else {
                writer.write("{\"status\":\"failure\"}");
            }
        } catch (Exception e) {
            e.printStackTrace();
            writer.write("{\"status\":\"error\"}");
        }
    }

}
