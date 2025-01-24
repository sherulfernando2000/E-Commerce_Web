package lk.ijse.ecommerce_web;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonReader;
import javax.sql.DataSource;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

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
}
