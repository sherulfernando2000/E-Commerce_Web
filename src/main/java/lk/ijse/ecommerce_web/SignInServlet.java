package lk.ijse.ecommerce_web;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "SignInServlet", value = "/signin")
public class SignInServlet extends HelloServlet {
    @Resource(name= "java:comp/env/jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("dopost in signIn");

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        if (password != null && !password.isEmpty() && email != null && !email.isEmpty()) {
            try {
                Connection connection = dataSource.getConnection();
                PreparedStatement pstm = connection.prepareStatement("select password,role from users where email=?");
                pstm.setString(1, email);


                ResultSet rs = pstm.executeQuery();
                if (rs.next() ) {
                    if (password.equals(rs.getString(1))) {
                        if (rs.getString(2).equals("admin")) {
                            resp.sendRedirect("products.jsp?message=login successfully");
                        }else{
                            resp.sendRedirect("signin?message=user login success");
                        }


                    }else {
                        resp.sendRedirect("signin?error=wrong email or password");
                    }
                }else{
                    resp.sendRedirect("signin?error=wrong email or password");
                }



            } catch (SQLException e) {
                e.printStackTrace();
                resp.sendRedirect("signin?error=wrong email or password");
            }


        }
    }
}
