<%@ page import="lk.ijse.ecommerce_web.Product" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Sonali
  Date: 1/19/2025
  Time: 9:12 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>Buttons Grid</title>

    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <link rel="stylesheet" href="assets/css/bootstrap-5.0.2-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
          integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://unpkg.com/bs-brain@2.0.4/components/registrations/registration-9/assets/css/registration-9.css">
</head>



<body>


<!-- Nav bar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">SD TECH</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup"
                aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse  justify-content-end " id="navbarNavAltMarkup">
            <div class="navbar-nav position-relative d-flex justify-content-around">

                <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
                <a class="nav-link" href="#">Products</a>

                <a class="nav-link" href="#">About us</a>
                <a class="nav-link" href="#">Blog</a>
                <a class="nav-link" href="cart.jsp">
                    <div class="d-flex align-items-center" style="background-color:#212529">
                        <button type="button" class="btn-position-relative cart" style="background-color: #212529">
                            <i class="fa fa-shopping-cart " style="color: white; background-color: #212529"></i>
                            <span class="position-absolute top-0" style="color: white">5</span>

                        </button>
                    </div>

                </a>
                <a class="nav-link active ms-2" aria-current="page" href="registration-save.jsp">Login/Register</a>
            </div>
        </div>
    </div>
</nav>

<!-- collection -->
<section id="collection" class="py-5">
    <div class="container">
        <div class="title text-center">
            <h2 class="position-relative d-inline-block">New Collection</h2>
        </div>

        <div class="row g-0">
            <div class="d-flex flex-wrap justify-content-center mt-5 filter-button-group">
                <button type="button" class="btn m-2  active-filter-btn " data-filter="*">All</button>
                <button type="button" class="btn m-2 " data-filter=".best">Iphones</button>
                <button type="button" class="btn m-2 " data-filter=".feat">Samsung</button>
                <button type="button" class="btn m-2 " data-filter=".new">Honor-X</button>
            </div>


            <div class="collection-list mt-4 row  g-3 p-2 ">
            <%
                List<Product> dataList = (List<Product>) request.getAttribute("products");
                if (dataList != null && !dataList.isEmpty()) {
                    for (Product product : dataList) {

            %>

            <%--<h6><%=product.getId()%></h6>
            <h6><%=product.getName()%></h6>
            <h6><%=product.getPrice()%></h6>
            <h6><%=product.getImage_path()%></h6>
            <img src="<%=product.getImage_path()%>" width="200px" height="200px">--%>




            <%--Card with for loop--%>
                <div class="col-md-6 col-lg-4 col-xl-3 p-2 m-1  best phone-card ">
                    <div class="collection-img position-relative">
                        <img src="<%=product.getImage_path()%>" class="w-100 rounded-3" >
                        <span class="position-absolute bg-primary text-white d-flex align-items-center justify-content-center bg-dark p-1 rounded ">sale</span>
                    </div>
                    <div class="text-center">
                        <div class="rating mt-3">
                            <span class="text-primary"><i class="fas fa-star"></i></span>
                            <span class="text-primary"><i class="fas fa-star"></i></span>
                            <span class="text-primary"><i class="fas fa-star"></i></span>
                            <span class="text-primary"><i class="fas fa-star"></i></span>
                            <span class="text-primary"><i class="fas fa-star"></i></span>
                        </div>
                        <p class="text-capitalize my-1"><%=product.getName()%></p>
                        <span class="fw-bold"><span>Rs.</span><%=product.getPrice()%></span>
                        <div id="counter">
                            <button id="decrease" class="btn-counter">-</button>
                            <span id="display">0</span>
                            <button id="increase" class="btn-counter">+</button>
                        </div>

                        <button type="button" class=" btn-success mt-1 rounded">Add to cart</button>
                    </div>
                </div>


                <%
                        }
                    }
                %>

                <div class="col-md-6 col-lg-4 col-xl-3 p-2 m-1 best phone-card ">
                    <div class="collection-img position-relative">
                        <img src="images/Apple-iPhone-15-2.jpg" class="w-100 rounded-3" >
                        <span
                                class="position-absolute bg-primary text-white d-flex align-items-center justify-content-center bg-dark p-1 rounded ">sale</span>
                    </div>
                    <div class="text-center">
                        <div class="rating mt-3">
                            <span class="text-primary"><i class="fas fa-star"></i></span>
                            <span class="text-primary"><i class="fas fa-star"></i></span>
                            <span class="text-primary"><i class="fas fa-star"></i></span>
                            <span class="text-primary"><i class="fas fa-star"></i></span>
                            <span class="text-primary"><i class="fas fa-star"></i></span>
                        </div>
                        <p class="text-capitalize my-1">Apple-iPhone-15</p>
                        <span class="fw-bold">RS.224,900.00</span>
                    </div>
                </div>




                <div class="col-md-6 col-lg-4 col-xl-3 p-2 m-1 best phone-card ">
                    <div class="collection-img position-relative">
                        <img src="images/Apple-iPhone-15-2.jpg" class="w-100 rounded-3" >
                        <span
                                class="position-absolute bg-primary text-white d-flex align-items-center justify-content-center bg-dark p-1 rounded ">sale</span>
                    </div>
                    <div class="text-center">
                        <div class="rating mt-3">
                            <span class="text-primary"><i class="fas fa-star"></i></span>
                            <span class="text-primary"><i class="fas fa-star"></i></span>
                            <span class="text-primary"><i class="fas fa-star"></i></span>
                            <span class="text-primary"><i class="fas fa-star"></i></span>
                            <span class="text-primary"><i class="fas fa-star"></i></span>
                        </div>
                        <p class="text-capitalize my-1">Apple-iPhone-15</p>
                        <span class="fw-bold">RS.224,900.00</span>
                    </div>
                </div>




                <div class="col-md-6 col-lg-4 col-xl-3 p-2 m-1 best phone-card ">
                    <div class="collection-img position-relative">
                        <img src="images/Apple-iPhone-15-2.jpg" class="w-100 rounded-3" >
                        <span
                                class="position-absolute bg-primary text-white d-flex align-items-center justify-content-center bg-dark p-1 rounded ">sale</span>
                    </div>
                    <div class="text-center">
                        <div class="rating mt-3">
                            <span class="text-primary"><i class="fas fa-star"></i></span>
                            <span class="text-primary"><i class="fas fa-star"></i></span>
                            <span class="text-primary"><i class="fas fa-star"></i></span>
                            <span class="text-primary"><i class="fas fa-star"></i></span>
                            <span class="text-primary"><i class="fas fa-star"></i></span>
                        </div>
                        <p class="text-capitalize my-1">Apple-iPhone-15</p>
                        <span class="fw-bold">RS.224,900.00</span>
                    </div>
                </div>

            </div>


        </div>
    </div>
</section>
<!-- end of collection -->


<script src="assets/css/bootstrap-5.0.2-dist/js/bootstrap.min.js"></script>
<script src="assets/js/jquery-3.7.1.js"></script>
<script src="assets/js/script.js"></script>

</body>
</html>
