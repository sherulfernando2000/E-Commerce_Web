package lk.ijse.ecommerce_web;


import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommerce_web.entity.Order;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "AdminOrderDetailsServlet", value = "/orderDetailsServlet")
    public class  AdminOrderDetailsServlet extends HttpServlet {
    @Resource(name= "java:comp/env/jdbc/pool")
    private DataSource dataSource;

        private static final long serialVersionUID = 1L;

        @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
            try(  Connection conn = dataSource.getConnection();) {
                // Fetch orders from the database (replace with actual DAO logic)
                List<Order> orders = new ArrayList<>();

                // Database connection

                String sql = "SELECT o.id AS orderId, \n" +
                        "       u.userName AS customerName, \n" +
                        "       o.orderDate, \n" +
                        "       o.total_amount, \n" +
                        "       p.name AS productName\n" +
                        "FROM orders o\n" +
                        "JOIN users u ON o.userId = u.userId\n" +
                        "JOIN orderdetails od ON o.id = od.orderId\n" +
                        "JOIN products p ON od.productId = p.productId;";

                try (PreparedStatement stmt = conn.prepareStatement(sql);
                     ResultSet rs = stmt.executeQuery()) {
                    while (rs.next()) {
                        Order order = new Order();
                        order.setOrderId(rs.getInt(1));
                        order.setCustomerName(rs.getString(2));
                        order.setOrderDate(rs.getDate(3));
                        order.setTotalAmount(rs.getDouble(4));
                        order.setProductName(rs.getString(5));
                        orders.add(order);
                    }
                }

                // Attach the orders list to the request
                request.setAttribute("orderList", orders);

                // Forward to JSP
                request.getRequestDispatcher("admin/orders.jsp").forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Unable to fetch orders.");
            }
        }
    }

