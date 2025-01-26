<%@ page import="lk.ijse.ecommerce_web.entity.Category" %>
<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.ecommerce_web.entity.Customer" %><%--
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
    <title>Customer Management</title>
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
                    <a class="nav-link" href="../products">Products</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="customers">Customers</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="categories">Categories</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="orderDetailsServlet">Order Details</a>
                </li>
            </ul>
            <a class=" logo ms-auto " href="#">SD TECH</a>

        </div>
    </div>
</nav>

<!-- Customer Management Section -->
<div class="container mt-5">
    <h1 class="text-center">Customer Management</h1>


    <!-- Customer List Table -->
    <div class="mt-5">
        <h2 class="text-center">Customer List</h2>
        <table class="table table-bordered">
            <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody id="customerTableBody">
            <!-- Customer rows will be dynamically added here -->
            <%
                List<Customer> dataList = (List<Customer>) request.getAttribute("customers");
                if (dataList != null && !dataList.isEmpty()) {
                    for (Customer customer : dataList) {
            %>
            <tr>
                <td><%= customer.getId() %></td>
                <td><%= customer.getUserName() %></td>
                <td><%= customer.getEmail() %></td>

                <td>
                    <button class="btn btn-warning btn-sm" onclick="editCategory('<%= customer.getId() %>', '<%= customer.getUserName() %>')">Edit</button>
                    <button type="button" class="btn btn-danger" id="deleteProduct">Delete</button>
                </td>
            </tr>
            <%
                    }
                }
            %>

            </tbody>
        </table>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // JavaScript to handle dynamic customer list


    function editCustomer(index) {
        const customer = customers[index];
        document.getElementById('customerId').value = customer.id;
        document.getElementById('customerName').value = customer.name;
        document.getElementById('customerEmail').value = customer.email;
        document.getElementById('customerPhone').value = customer.phone;
    }

    function deleteCustomer(index) {
        customers.splice(index, 1);
        loadCustomerTable();
    }

    document.getElementById('customerForm').addEventListener('submit', function(e) {
        e.preventDefault();
        const id = document.getElementById('customerId').value;
        const name = document.getElementById('customerName').value;
        const email = document.getElementById('customerEmail').value;
        const phone = document.getElementById('customerPhone').value;

        const existingIndex = customers.findIndex(c => c.id === id);
        if (existingIndex >= 0) {
            customers[existingIndex] = { id, name, email, phone };
        } else {
            customers.push({ id, name, email, phone });
        }

        loadCustomerTable();
        this.reset();
    });

    loadCustomerTable();
</script>

</body>
</html>
