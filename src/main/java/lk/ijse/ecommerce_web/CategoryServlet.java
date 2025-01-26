package lk.ijse.ecommerce_web;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CategoryServlet", value = "/categories")
public class CategoryServlet extends HttpServlet {

    @Resource(name= "java:comp/env/jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Category> categories = new ArrayList<>();

        try (Connection connection = dataSource.getConnection();
             PreparedStatement statement = connection.prepareStatement("SELECT * FROM categories")) {

            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt(1);
                String name = resultSet.getString(2);


                categories.add(new Category(id, name));
            }

        } catch (Exception e) {
            throw new ServletException("Error retrieving categories", e);
        }

        // Pass the categories list to the JSP page
        req.setAttribute("categories", categories);
        req.getRequestDispatcher("admin/category.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        System.out.println("name"+name);

        try (Connection connection = dataSource.getConnection()) {
            String sql = "INSERT INTO categories (description) VALUES (?)";
            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setString(1, name);
            int i = pstm.executeUpdate();
            if (i > 0) {
                resp.sendRedirect("categories");
            } else {
                resp.sendRedirect("categories");
            }

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("categories?error=categories save failed");
        }
    }






}
