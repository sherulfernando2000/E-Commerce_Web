package lk.ijse.ecommerce_web;

import jakarta.annotation.Resource;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import javax.sql.DataSource;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/products")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10,      // 10MB
        maxRequestSize = 1024 * 1024 * 50   // 50MB
)
public class ProductServlet extends HttpServlet {
    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;

    private static final String UPLOAD_DIR = "uploaded_images"; // Directory to save images

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("post in product");
        // Get form data
        String name = req.getParameter("name");
        String price = req.getParameter("price");
        String quantity = req.getParameter("quantity");
        String category = req.getParameter("category");
        String description = req.getParameter("description");

        // Get the uploaded file (image)
        Part filePart = req.getPart("image");

        // Get the filename from the uploaded part
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

        // Define the upload path (project directory)
        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;

        // Create the directory if it doesn't exist
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        // Save the file on the server
        if (fileName != null && !fileName.isEmpty()) {
            String filePath = uploadPath + File.separator + fileName;
            filePart.write(filePath); // Save the file

            // OPTIONAL: Store file path or name in the database
            try (var connection = dataSource.getConnection()) {
                String sql = "INSERT INTO products (name, price, quantity, categoryId, description, image_path) VALUES (?, ?, ?, ?, ?, ?)";
                try (var stmt = connection.prepareStatement(sql)) {
                    stmt.setString(1, name);
                    stmt.setDouble(2, Double.parseDouble(price));
                    stmt.setInt(3, Integer.parseInt(quantity));
                    stmt.setInt(4, 1); // need to change
                    stmt.setString(5, description);
                    stmt.setString(6, UPLOAD_DIR + "/" + fileName); // Save relative path
                    int i = stmt.executeUpdate();
                    if (i>0) {
                        resp.sendRedirect("products?message=product saved successfully");
                    } else {
                        resp.sendRedirect("products?error=product not saved");
                    }


                }
            } catch (Exception e) {
                e.printStackTrace();
                resp.sendRedirect("products?error=product not saved");
            }finally {

            }

        }

        // Respond with success
        /*resp.setContentType("text/html");
        resp.getWriter().write("<h3>Product added successfully with image!</h3>");*/
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("doget in product_list");

        List<Product> products = new ArrayList<>();

        try( Connection connection = dataSource.getConnection()) {
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
            rd.forward(req,resp);


        } catch (SQLException e) {
            e.printStackTrace();
            resp.sendRedirect(
                    "admin/product.jsp?error= products not load"
            );

        }

    }




}
