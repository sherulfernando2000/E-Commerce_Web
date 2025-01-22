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
import java.sql.SQLException;

@WebServlet(name = "ProductDeleteServlet", value = "/product-delete")
public class ProductDeleteServlet extends HttpServlet {
    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("doget in ProductDeleteServlet");

        String idString = req.getParameter("id");
        int id = Integer.parseInt(idString);

        Connection connection = null;
        try {
           connection = dataSource.getConnection();
            PreparedStatement pstm = connection.prepareStatement("DELETE FROM products WHERE productId = ?");
            pstm.setInt(1, id);
            int i = pstm.executeUpdate();
            if (i >0) {
                resp.sendRedirect("products?message=product delete successfully");
            }else {
                resp.sendRedirect("products?error=product not deleted");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            resp.sendRedirect("products?error=product not deleted");

        }finally {
            try {
                connection.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }

    }

    /*@Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("in doPost of delete servlet");

        String idString = req.getParameter("id");
        int id = Integer.parseInt(idString);

        try {
            Connection connection = dataSource.getConnection();
            PreparedStatement pstm = connection.prepareStatement("DELETE FROM products WHERE productId = ?");
            pstm.setInt(1, id);
            int i = pstm.executeUpdate();
            if (i >0) {
                resp.sendRedirect("admin/products.jsp?message=product delete successfully");
            }else {
                resp.sendRedirect("admin/products.jsp?error=product not deleted");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            resp.sendRedirect("admin/products.jsp?error=product not deleted");

        }


    }*/
}
