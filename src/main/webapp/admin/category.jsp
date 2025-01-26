
<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.ecommerce_web.entity.Category" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Category Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/adminStyle.css">
    <style>
        tr:hover {
            background-color: rgb(232, 178, 74);
            cursor: pointer;
        }

        #categoryTableBody tr.active {
            background-color: #e8b24a;
        }
    </style>
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
                    <a class="nav-link" href="customers">Customers</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="categories">Categories</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="orderDetailsServlet">Order Details</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="../index.jsp">User</a>
                </li>
            </ul>
            <a class=" logo ms-auto " href="#">SD TECH</a>

        </div>
    </div>
</nav>

<div class="container mt-5">
    <h1 class="text-center">Category Management</h1>
    <form action="categories" method="post" id="categoryForm" class="mt-4">
        <div class="row mb-3">

            <div class="col-md-6">
                <label for="categoryId" class="form-label">Category ID</label>
                <input type="number" class="form-control" id="categoryId" placeholder="Enter category ID"  name="action" value="add" required>
            </div>

            <div class="col-md-6">
                <label for="categoryName" class="form-label">Category Name</label>
                <input type="text" class="form-control" id="categoryName" placeholder="Enter category name"  name="name" value="add" required>
            </div>

        </div>

        <div class="text-center">
           <button type="submit" class="btn btn-success" id="saveCategory">Save</button>
        </div>
    </form>

    <div class="mt-5">
        <h2 class="text-center">Category List</h2>
        <table class="table table-bordered mt-3">
            <thead class="table-dark">
            <tr>

                <th>Category ID</th>
                <th>Category Name</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody id="categoryTableBody">
            <%
                List<Category> dataList = (List<Category>) request.getAttribute("categories");
                if (dataList != null && !dataList.isEmpty()) {
                    for (Category category : dataList) {
            %>
            <tr>
                <td><%= category.getId() %></td>
                <td><%= category.getName() %></td>

                <td>
                    <button class="btn btn-warning btn-sm" onclick="editCategory('<%= category.getId() %>', '<%= category.getName() %>')">Edit</button>
                    <a href="category-delete?id=<%= category.getId() %>"><button class="btn btn-danger btn-sm">Delete</button></a>
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

<!-- Update Category Modal -->
<div class="modal fade" id="update_modal" tabindex="-1" aria-labelledby="update_modal" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <div class="container m-2">
                    <form action="category-update" method="post">
                        <div class="mb-3">
                            <label for="update_category_id" class="form-label">Category ID</label>
                            <input type="text" class="form-control" id="update_category_id" name="update_category_id" readonly>
                        </div>
                        <div class="mb-3">
                            <label for="update_category_name" class="form-label">Category Name</label>
                            <input type="text" class="form-control" id="update_category_name" name="update_category_name">
                        </div>
                        <button type="submit" class="btn btn-primary">Update</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
    const editCategory = (categoryId, categoryName) => {
        $('#update_category_id').val(categoryId)
        $('#update_category_name').val(categoryName)


        $('#update_modal').modal('show')
    }
</script>

</body>
</html>
