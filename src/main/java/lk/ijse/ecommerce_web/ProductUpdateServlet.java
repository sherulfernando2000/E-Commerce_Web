package lk.ijse.ecommerce_web;

import jakarta.annotation.Resource;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.sql.DataSource;
import javax.swing.text.html.HTML;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductUpdateServlet", value = "/products-update")
public class ProductUpdateServlet extends HttpServlet {

    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("in doPost in update servlet");
        String id = req.getParameter("update_product_id");
        String updateProductName = req.getParameter("update_product_name");
        String updateProductPrice = req.getParameter("update_product_price");
        String updateQty = req.getParameter("update_qty");
        String updateProductCategory = req.getParameter("update_product_category");
        String updateProductDescription = req.getParameter("update_product_description");

        System.out.println(updateProductName);


        try(Connection connection = dataSource.getConnection();) {
            PreparedStatement pstm = connection.prepareStatement("UPDATE products SET name=? ,price=?, quantity=? ,categoryId=? ,description=? WHERE productId=?");
            pstm.setString(1,updateProductName);
            pstm.setDouble(2, Double.parseDouble(updateProductPrice));
            pstm.setInt(3, Integer.parseInt(updateQty));
            pstm.setInt(4, 1);
            pstm.setString(5,updateProductDescription);
            pstm.setInt(6, Integer.parseInt(id));
            int i = pstm.executeUpdate();

            if (i>0) {
                resp.sendRedirect("products-update?message=product update successfully.");
            } else {
                resp.sendRedirect("products-update?error=product not updated.");
                System.out.println("this not update");
            }


        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("products-update?error=product not updated.");
        }

    }



    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("doget in product_list");

        List<Product> products = new ArrayList<>();

        try (Connection connection = dataSource.getConnection()) {
            PreparedStatement pstm = connection.prepareStatement("Select * from products");
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                double price = rs.getDouble(3);
                int quantity = rs.getInt(4);
                int categoryId = rs.getInt(5);
                String description = rs.getString(6);
                String image_path = rs.getString(7);

                Product product = new Product(id, name, price, quantity, categoryId, description, image_path);

                products.add(product);

            }

            req.setAttribute("products", products);
            RequestDispatcher rd = req.getRequestDispatcher("admin/products.jsp");
            rd.forward(req, resp);


        } catch (SQLException e) {
            e.printStackTrace();
            resp.sendRedirect(
                    "admin/product.jsp?error= products not load"
            );

        }
    }

}
