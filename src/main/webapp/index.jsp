<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
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

                <a class="nav-link active" aria-current="page" href="#">Home</a>
                <a class="nav-link" href="product-list">Products</a>

                <a class="nav-link" href="">About us</a>
                <a class="nav-link" href="#">Blog</a>
                <a class="nav-link" href="cart.jsp">
                    <div class="d-flex align-items-center" style="background-color:#212529">
                        <button type="button" class="btn-position-relative cart" style="background-color: #212529">
                            <i class="fa fa-shopping-cart " style="color: white; background-color: #212529"></i>
                            <span class="position-absolute top-0" style="color: white">5</span>

                        </button>
                    </div>

                </a>
                <a class="nav-link active ms-2" aria-current="page" href="signin.jsp">Login/Register</a>
                <a class="nav-link active ms-2" aria-current="page" href="admin/products.jsp">admin</a>
            </div>
        </div>
    </div>
</nav>

<!-- Header -->
<header id="header" class="vh-100 carousel slide" data-bs-ride="carousel">
    <div class="container h-100 d-flex align-items-center carousel-inner overflow-hidden">
        <div class="text-center text-card carousel-item active">
            <h2 class="text-white">Best collection</h2>
            <h1 class="text-white">New Arrivals</h1>
            <a href="#" class="btn mt-3 text-uppercase">shop now</a>
        </div>

        <div class="text-center text-card carousel-item ">
            <h2 class="text-white">Best Price</h2>
            <h1 class="text-white"> More Offers</h1>
            <a href="#" class="btn mt-3 text-uppercase">Buy now</a>
        </div>
    </div>


</header>



<


<script src="assets/css/bootstrap-5.0.2-dist/js/bootstrap.min.js"></script>
<script src="assets/js/jquery-3.7.1.js"></script>
<script src="assets/js/script.js"></script>

</body>
</html>