<%@ page import="lk.ijse.ecommerce_web.entity.Product" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Sonali
  Date: 1/19/2025
  Time: 12:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <%--<style>
        #dropZone {
            transition: border-color 0.3s ease, background-color 0.3s ease;
        }
        #dropZone:hover {
            border-color: #66afe9;
            background-color: #f1f1f1;
            cursor: pointer;
        }

        tr:hover{
            background-color: rgb(232, 178, 74);
            cursor: pointer;

        }

        #productTableBody tr.active {
            background-color: #e8b24a;
        }

    </style>--%>
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
        <div class="collapse navbar-collapse d-flex" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link active" href="../products">Products</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="customers">Customers</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="categories">Categories</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="orderDetailsServlet">Order Details</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">User</a>
                </li>
            </ul>
                 <a class=" logo ms-auto " href="#">SD TECH</a>
        </div>
    </div>
</nav>


<div class="container mt-5">
    <h1 class="text-center">Product Management</h1>
    <form  action="products" method="post" id="productForm" class="mt-4" enctype="multipart/form-data">
        <div class="row mb-3">
            <div class="col-md-6">
                <label for="productName" class="form-label">Product Name</label>
                <input type="text" class="form-control" id="productName" placeholder="Enter product name" name="name">
            </div>
            <div class="col-md-6">
                <label for="productPrice" class="form-label">Price</label>
                <input type="number" class="form-control" id="productPrice" placeholder="Enter product price" name="price">
            </div>
        </div>
        <div class="row mb-3">
            <div class="col-md-6">
                <label for="productQuantity" class="form-label">Quantity on Hand</label>
                <input type="number" class="form-control" id="productQuantity" placeholder="Enter quantity" name="quantity">
            </div>
            <div class="col-md-6">
                <label for="productCategory" class="form-label">Category</label>
                <select id="productCategory" class="form-select" name="category">
                    <option selected disabled>Select category</option>
                    <option value="electronics">Iphones</option>
                    <option value="clothing">Samsung</option>
                    <option value="home_appliances">X-Honor</option>
                </select>
            </div>
        </div>
        <div class="mb-3">
            <label for="productDescription" class="form-label">Description</label>
            <textarea class="form-control" id="productDescription" rows="3" placeholder="Enter product description" name="description"></textarea>
        </div>
       <%-- <div class="mb-3">
            <label for="productImage" class="form-label">Upload Product Image</label>
            <input class="form-control" type="file" id="productImage" accept=".jpg,.jpeg,.png" name="image">
        </div>

        <div class="mb-3 text-center">
            <!-- Image preview container -->
            <img id="imagePreview" src="#" alt="Image Preview" style="display: none; max-width: 200px; max-height: 200px; border: 1px solid #ddd; margin-top: 10px;">
        </div>--%>

        <div class="mb-3">
            <label for="dropZone" class="form-label">Drag and Drop Product Image</label>
            <!-- Drag-and-Drop Container -->
            <div id="dropZone"
                 style="width: 100%; height: 200px; border: 2px dashed #ccc; border-radius: 10px; display: flex; align-items: center; justify-content: center; text-align: center; background-color: #f9f9f9;">
                <p style="color: #aaa;">Drag & Drop an image here or click to select one</p>
            </div>
            <!-- Hidden Input Field for Fallback -->
            <input type="file" id="fileInput" name="image" accept="image/*" style="display: none;" />
        </div>

        <!-- Preview Area -->
        <div class="mb-3 text-center">
            <img id="imagePreview" src="#" alt="Image Preview" style="display: none; max-width: 200px; max-height: 200px; border: 1px solid #ddd; margin-top: 10px; border-radius: 5px;">
        </div>


        <div class="text-center">
            <button type="submit" class="btn btn-success" id="saveProduct" >Save</button>
            <button type="button" class="btn btn-primary" id="updateProduct">Update</button>
            <button type="button" class="btn btn-danger" id="deleteProduct">Delete</button>
        </div>
    </form>

    <div class="modal fade" id="update_modal" tabindex="-1" aria-labelledby="update_modal" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="container m-2">
                        <form action="products-update" method="post">
                            <div class="mb-3">
                                <label for="update_procut_id" class="form-label">Product Id</label>
                                <input type="text" class="form-control" id="update_procut_id" name="update_product_id" readonly>
                            </div>
                            <div class="mb-3">
                                <label for="update_product_name" class="form-label">Product Name</label>
                                <input type="text" class="form-control" id="update_product_name" name="update_product_name">
                            </div>
                            <div class="mb-3">
                                <label for="update_product_price" class="form-label">Product Price</label>
                                <input type="text" class="form-control" id="update_product_price" name="update_product_price" >
                            </div>
                            <div class="mb-3">
                                <label for="update_qty" class="form-label">Product Quantity</label>
                                <input type="text" class="form-control" id="update_qty" name="update_qty">
                            </div>
                            <%--category--%>
                            <div class="col-md-6">
                                <label for="update_product_category" class="form-label">Category</label>
                                <select id="update_product_category" class="form-select" name="update_product_category">
                                    <option selected disabled>Select category</option>
                                    <option value="iphones">Iphones</option>
                                    <option value="samsung">Samsung</option>
                                    <option value="x-honor">X-Honor</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="update_product_description" class="form-label">Description</label>
                                <textarea class="form-control" id="update_product_description" name="update_product_description" rows="3" placeholder="Enter product description" name="description"></textarea>
                            </div>
                            <button id="btn_update_user" type="submit" class="btn btn-primary">Update</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>



    <div class="mt-5">
        <h2 class="text-center">Product List</h2>
        <table class="table table-bordered mt-3">
            <thead class="table-dark">
            <tr>
                <th>#</th>
                <th>Name</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Category</th>
                <th>Description</th>
                <th>Image</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody id="productTableBody">
            <!-- Dynamic rows will be added here -->
            <%
                List<Product> dataList = (List<Product>) request.getAttribute("products");
                if (dataList != null && !dataList.isEmpty()) {
                    for (Product product : dataList) {

            %>

            <tr>
                <td><%=product.getId()%></td>
                <td><%=product.getName()%></td>
                <td><%=product.getPrice()%></td>
                <td><%=product.getQuantity()%></td>
                <td><%=product.getCategoryId()%></td>
                <td><%=product.getDescription()%></td>
                <td><img src="<%=product.getImage_path()%>" width="20px" height="30px"></td>
                <td>
                    <button class="btn btn-warning btn-sm" onclick="editUser('<%=product.getId()%>','<%=product.getName()%>','<%=product.getPrice()%>','<%=product.getQuantity()%>','<%=product.getCategoryId()%>','<%=product.getDescription()%>')">Edit</button>
                    <a href="product-delete?id=<%=product.getId()%>" ><button class='btn btn-danger btn-sm deleteProduct' data-index=`<%=product.getId()%>`>Delete</button></a>
<%--                    <button  onclick="confirmDelete(event,product.getId() )"><button class='btn btn-danger btn-sm deleteProduct' data-index=`<%=product.getId()%>`>Delete</button></button>--%>
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



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>

    const editUser = (productId,name,price,quantity,category,description) => {
        $('#update_procut_id').val(productId)
        $('#update_product_name').val(name)
        $('#update_product_price').val(price)
        $('#update_qty').val(quantity)
        $('#update_product_category').val('Iphone')
        $('#update_product_description').val(description)



        $('#update_modal').modal('show')
    }

   function confirmDelete(event, url) {
       console.log(url)
       event.preventDefault(); // Prevent the default action (navigation)
       if (confirm("Are you sure you want to delete this item?")) {
           // If the user confirms, navigate to the servlet
           console.log(url);
           // http://localhost:8080/E_Commerce_Web_war_exploded/product-delete?id=
           window.location.href = url;
       }
       // If the user cancels, simply return false
       return false;
   }


    const dropZone = document.getElementById('dropZone');
    const fileInput = document.getElementById('fileInput');
    const imagePreview = document.getElementById('imagePreview');

    // Event: Open file input when clicking on the drop zone
    dropZone.addEventListener('click', () => fileInput.click());

    // Event: Handle file input selection
    fileInput.addEventListener('change', (event) => handleFiles(event.target.files));

    // Event: Drag and drop
    dropZone.addEventListener('dragover', (event) => {
        event.preventDefault(); // Prevent default to allow drop
        dropZone.style.borderColor = '#66afe9'; // Highlight on drag over
    });

    dropZone.addEventListener('dragleave', () => {
        dropZone.style.borderColor = '#ccc'; // Reset border color when leaving
    });

    dropZone.addEventListener('drop', (event) => {
        event.preventDefault(); // Prevent default behavior (opening file)
        dropZone.style.borderColor = '#ccc'; // Reset border color
        const files = event.dataTransfer.files; // Get the dropped files
        handleFiles(files);
    });

    // Function to handle file(s) and preview image
    function handleFiles(files) {
        if (files.length > 0) {
            const file = files[0];
            if (file.type.startsWith('image/')) { // Ensure it's an image
                const reader = new FileReader();
                reader.onload = (e) => {
                    imagePreview.src = e.target.result; // Set preview image source
                    imagePreview.style.display = 'block'; // Show preview
                };
                reader.readAsDataURL(file); // Read the file
            } else {
                alert('Please upload a valid image file.');
            }
        }
    }


        /*====details fill when table row clicked====*/

        $("#productTableBody").on('click','tr',function () {
            console.log("clicked");
            productIndex = $(this).index();


            // Remove 'active' class from all rows
            $("#productTableBody tr").removeClass("active");

            // Add 'active' class to the clicked row
            $(this).addClass("active");


            // Extract data from the clicked row
            let productId = $(this).find('td:nth-child(1)').text().trim();
            let productName = $(this).find('td:nth-child(2)').text().trim();
            let productPrice = $(this).find('td:nth-child(3)').text().trim();
            let productQuantity = $(this).find('td:nth-child(4)').text().trim();
            let productCategory = $(this).find('td:nth-child(5)').text().trim();
            let productDescription = $(this).find('td:nth-child(6)').text().trim();

            // Set the data into input fields
            $('#productName').val(productName);
            $('#productPrice').val(productPrice);
            $('#productQuantity').val(productQuantity);
            $('#productCategory').val(productCategory);
            $('#productDescription').val(productDescription);



        })

   /* $(document).ready(function () {
          let productArray = [];

          function renderTable() {
              let tableBody = "";
              productArray.forEach((product, index) => {
                  tableBody += `<tr>
                          <td>${index + 1}</td>
                        <td>${product.name}</td>
                        <td>${product.price}</td>
                        <td>${product.quantity}</td>
                        <td>${product.category}</td>
                        <td>${product.description}</td>
                        <td><img src="${product.image}" alt="Product Image" style="width: 50px; height: 50px;"></td>
                        <td>
                            <button class='btn btn-primary btn-sm editProduct' data-index='${index}'>Edit</button>
                            <button class='btn btn-danger btn-sm deleteProduct' data-index='${index}'>Delete</button>
                        </td>
                    </tr>`;
            });
            $("#productTableBody").html(tableBody);
        }*/

   /*  $("#saveProduct").click(function () {
         const product = {
             name: $("#productName").val(),
             price: $("#productPrice").val(),
             quantity: $("#productQuantity").val(),
             category: $("#productCategory").val(),
             description: $("#productDescription").val(),
             image: URL.createObjectURL($("#productImage")[0].files[0])
         };

         productArray.push(product);
         renderTable();
         $("#productForm")[0].reset();
     });document
*/
   /*$(document).on("click", ".deleteProduct", function () {
       const index = $(this).data("index");
       productArray.splice(index, 1);
       renderTable();
   });

   $(document).on("click", ".editProduct", function () {
       const index = $(this).data("index");
       const product = productArray[index];

       $("#productName").val(product.name);
       $("#productPrice").val(product.price);
       $("#productQuantity").val(product.quantity);
       $("#productCategory").val(product.category);
       $("#productDescription").val(product.description);

       $("#updateProduct").off("click").on("click", function () {
           productArray[index] = {
               name: $("#productName").val(),
               price: $("#productPrice").val(),
               quantity: $("#productQuantity").val(),
               category: $("#productCategory").val(),
               description: $("#productDescription").val(),
               image: product.image
           };

           renderTable();
           $("#productForm")[0].reset();
       });
   });
});
*/

   // JavaScript function to preview the uploaded image
   /*function previewImage(event) {
       const file = event.target.files[0]; // Get the selected file
       const preview = document.getElementById('imagePreview'); // Get the preview element

       if (file) {
           const reader = new FileReader();
           reader.onload = function (e) {
               preview.src = e.target.result; // Set the preview source to the image file
               preview.style.display = 'block'; // Make the image preview visible
           };
           reader.readAsDataURL(file); // Read the file as a Data URL
       } else {
           preview.src = '#'; // Reset the preview
           preview.style.display = 'none'; // Hide the preview
       }
   }
*/



</script>


</body>
</html>
