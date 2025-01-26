package lk.ijse.ecommerce_web;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

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
            try(Connection connection = dataSource.getConnection();) {
                PreparedStatement pstm = connection.prepareStatement("select password,role,userId,userName from users where email=?");
                pstm.setString(1, email);


                ResultSet rs = pstm.executeQuery();
                if (rs.next() ) {
                    Object userId = rs.getObject(3);
                   Object userName = rs.getObject(4);
                    System.out.println("userId"+ userId);
                    System.out.println("userId"+ userName);

                    if (password.equals(rs.getString(1))) {
                        if (rs.getString(2).equals("admin")) {
                            /*Object userId = rs.getObject(3);*/
                            System.out.println("userId"+ userId);
                            HttpSession session = req.getSession();     //new add 2 line
                            session.setAttribute("userId", userId);
                            session.setAttribute("userName", userName);

                            resp.sendRedirect("products");  //admin/products.jsp?message=login successfully
                        }else{
                            HttpSession session = req.getSession();     //new add 2 line
                            session.setAttribute("userId", userId);
                            session.setAttribute("userName", userName);
                            resp.sendRedirect("index.jsp?message=user login success");
                        }


                    }else {
                        resp.sendRedirect("index.jsp?error=wrong email or password");
                    }
                }else{
                    resp.sendRedirect("index.jsp?error=wrong email or password");
                }



            } catch (SQLException e) {
                e.printStackTrace();
                resp.sendRedirect("signin?error=wrong email or password");
            }


        }
    }
}
