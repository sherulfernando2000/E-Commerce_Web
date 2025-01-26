<%@ page import="lk.ijse.ecommerce_web.entity.Order" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Sonali
  Date: 1/19/2025
  Time: 12:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/adminStyle.css">
</head>
<body>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-light navbar-custom">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Admin Dashboard</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="products">Products</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="customers">Customers</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="categories">Categories</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="orderDetailsServlet">Order Details</a>
                </li>
            </ul>
            <a class=" logo ms-auto " href="#">SD TECH</a>

        </div>
    </div>
</nav>

<!-- Order Details Section -->
<div class="container mt-5">
    <h1 class="text-center">Order Details</h1>
    <table class="table table-striped table-bordered mt-4">
        <thead class="table-dark">
        <tr>
            <th>Order ID</th>
            <th>Customer Name</th>
            <th>Order Date</th>
            <th>Total Amount</th>
            <th>Status</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            // Simulate retrieving order data
            List<Order> orders = (List<Order>) request.getAttribute("orderList");
            if (orders != null && !orders.isEmpty()) {
                for (Order order : orders) {
        %>
        <tr>
            <td><%= order.getOrderId() %></td>
            <td><%= order.getCustomerName() %></td>
            <td><%= order.getOrderDate() %></td>
            <td><%= order.getTotalAmount() %></td>
            <td><%= order.getProductName() %></td>
            <td>

                <a href="deleteOrder.jsp?orderId=<%= order.getOrderId() %>" class="btn btn-danger btn-sm">Cancel</a>
            </td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="6" class="text-center">No orders found</td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
