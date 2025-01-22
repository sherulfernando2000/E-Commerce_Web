<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>SD TECH</title>

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

                <a class="nav-link active navWord" aria-current="page" href="#">Home</a>
                <a class="nav-link navWord" href="product-list">Products</a>

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
                <a class="nav-link  ms-2" aria-current="page" href="signin.jsp">Login/Register</a>
                <a class="nav-link  ms-2" aria-current="page" href="products">admin</a>
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


<!-- special products -->
<section id = "special" class = "py-5">
    <div class = "container">
        <div class = "title text-center py-5">
            <h2 class = "position-relative d-inline-block">Special Offers</h2>
        </div>

        <div class = "special-list row g-0">
            <div class = "col-md-6 col-lg-4 col-xl-3 p-2">
                <div class = "special-img position-relative overflow-hidden">
                    <img src = "images/Apple-iPhone-16-1.png" class = "w-100">
                    <span class = "position-absolute d-flex align-items-center justify-content-center text-primary fs-4">
                            <i class = "fas fa-heart"></i>
                        </span>
                </div>
                <div class = "text-center">
                    <p class = "text-capitalize mt-3 mb-1">Apple-iPhone-16</p>
                    <span class = "fw-bold d-block"><s>Rs.249000</s><span>Rs.229000</span></span>
                    <a href = "#" class = "btn  mt-3">Add to Cart</a>
                </div>
            </div>

            <div class = "col-md-6 col-lg-4 col-xl-3 p-2">
                <div class = "special-img position-relative overflow-hidden">
                    <img src = "images/Samsung-Galaxy-F05.jpg" class = "w-100">
                    <span class = "position-absolute d-flex align-items-center justify-content-center text-primary fs-4">
                            <i class = "fas fa-heart"></i>
                        </span>
                </div>
                <div class = "text-center">
                    <p class = "text-capitalize mt-3 mb-1">Samsung-Galaxy-F05</p>
                    <span class = "fw-bold d-block"><s>Rs.149000</s><span>Rs.130000</span></span>
                    <a href = "#" class = "btn  mt-3">Add to Cart</a>
                </div>
            </div>

            <div class = "col-md-6 col-lg-4 col-xl-3 p-2">
                <div class = "special-img position-relative overflow-hidden">
                    <img src = "images/Samsung-Galaxy-S24-FE.png" class = "w-100">
                    <span class = "position-absolute d-flex align-items-center justify-content-center text-primary fs-4">
                            <i class = "fas fa-heart"></i>
                        </span>
                </div>
                <div class = "text-center">
                    <p class = "text-capitalize mt-3 mb-1">Samsung-Galaxy-S24</p>
                    <span class = "fw-bold d-block"><s>Rs.289000</s><span>Rs.270000</span></span>
                    <a href = "#" class = "btn  mt-3">Add to Cart</a>
                </div>
            </div>

            <div class = "col-md-6 col-lg-4 col-xl-3 p-2">
                <div class = "special-img position-relative overflow-hidden">
                    <img src = "images/Apple-iPhone-15-2.jpg" class = "w-100">
                    <span class = "position-absolute d-flex align-items-center justify-content-center text-primary fs-4">
                            <i class = "fas fa-heart"></i>
                        </span>
                </div>
                <div class = "text-center">
                    <p class = "text-capitalize mt-3 mb-1">Apple-iPhone-15</p>
                    <span class = "fw-bold d-block"><s>Rs.289000</s><span>Rs.279000</span></span>
                    <a href = "#" class = "btn mt-3">Add to Cart</a>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- end of special products -->


<%-- welcome section--%>

<section id = "special" class = "py-5">
    <div class = "container">
        <div class = "title text-center py-5">
            <h2 class = "position-relative d-inline-block">WELCOME TO SD TECH</h2>
        </div>

        <p>
            Welcome to SD TECH, your premier destination for corporate mobile solutions in Sri Lanka!
            At SD TECHS, we understand the unique needs and demands of our corporate customers, and we are committed to providing you with the utmost convenience and excellence in service. As you step into our dedicated Corporate Order Page, get ready to embark on a seamless journey of acquiring top-notch mobile devices and solutions for your organization.
        </p>

        <p>
            Our mission is to ensure your complete satisfaction by delivering unmatched quality, reliability, and efficiency. From industry-leading brands to tailored solutions, we pride ourselves on offering an exceptional experience that surpasses your expectations. Our dedicated team of experts is always available to provide personalized assistance, helping you make informed decisions and finding the perfect fit for your corporate needs.
            At Celltronics, we believe in forging long-lasting partnerships with our corporate clients. By prioritizing your success and growth, we strive to establish ourselves as your trusted technology partner. Together, let’s elevate your organization’s mobile capabilities and unlock new possibilities for productivity and innovation.
        </p>


    </div>
</section>








<!-- newsletter -->
<section id = "newsletter" class = "py-5">
    <div class = "container">
        <div class = "d-flex flex-column align-items-center justify-content-center">
            <div class = "title text-center pt-3 pb-5">
                <h2 class = "position-relative d-inline-block ms-4">SUBSCRIBE US</h2>
            </div>

            <p class = "text-center text-muted">Subscribe us to know about latest offers and discount items.</p>
            <div class = "input-group mb-3 mt-3">
                <input type = "text" class = "form-control" placeholder="Enter Your Email ...">
                <button class = "btn " type = "submit">Subscribe</button>
            </div>
        </div>
    </div>
</section>
<!-- end of newsletter -->

<!-- footer -->
<footer class = "bg-dark py-5">
    <div class = "container">
        <div class = "row text-white g-4">
            <div class = "col-md-6 col-lg-3">
                <a class = "text-uppercase text-decoration-none brand text-white" href = "index.html">SDTECH</a>
                <p class = "text-white text-muted mt-3">Welcome to Celltronics, your premier destination for corporate mobile solutions in Sri Lanka!</p>
            </div>

            <div class = "col-md-6 col-lg-3">
                <h5 class = "fw-light">Links</h5>
                <ul class = "list-unstyled">
                    <li class = "my-3">
                        <a href = "#" class = "text-white text-decoration-none text-muted">
                            <i class = "fas fa-chevron-right me-1"></i> Home
                        </a>
                    </li>
                    <li class = "my-3">
                        <a href = "#" class = "text-white text-decoration-none text-muted">
                            <i class = "fas fa-chevron-right me-1"></i> Collection
                        </a>
                    </li>
                    <li class = "my-3">
                        <a href = "#" class = "text-white text-decoration-none text-muted">
                            <i class = "fas fa-chevron-right me-1"></i> Blogs
                        </a>
                    </li>
                    <li class = "my-3">
                        <a href = "#" class = "text-white text-decoration-none text-muted">
                            <i class = "fas fa-chevron-right me-1"></i> About Us
                        </a>
                    </li>
                </ul>
            </div>

            <div class = "col-md-6 col-lg-3">
                <h5 class = "fw-light mb-3">Contact Us</h5>
                <div class = "d-flex justify-content-start align-items-start my-2 text-muted">
                        <span class = "me-3">
                            <i class = "fas fa-map-marked-alt"></i>
                        </span>
                    <span class = "fw-light">
                            351 R. A. De Mel Mawatha, Colombo 00300
                        </span>
                </div>
                <div class = "d-flex justify-content-start align-items-start my-2 text-muted">
                        <span class = "me-3">
                            <i class = "fas fa-envelope"></i>
                        </span>
                    <span class = "fw-light">
                            sdtech.support@gmail.com
                        </span>
                </div>
                <div class = "d-flex justify-content-start align-items-start my-2 text-muted">
                        <span class = "me-3">
                            <i class = "fas fa-phone-alt"></i>
                        </span>
                    <span class = "fw-light">
                            +9786 6776 236
                        </span>
                </div>
            </div>

            <div class = "col-md-6 col-lg-3">
                <h5 class = "fw-light mb-3">Follow Us</h5>
                <div>
                    <ul class = "list-unstyled d-flex">
                        <li>
                            <a href = "#" class = "text-white text-decoration-none text-muted fs-4 me-4">
                                <i class = "fab fa-facebook-f"></i>
                            </a>
                        </li>
                        <li>
                            <a href = "#" class = "text-white text-decoration-none text-muted fs-4 me-4">
                                <i class = "fab fa-twitter"></i>
                            </a>
                        </li>
                        <li>
                            <a href = "#" class = "text-white text-decoration-none text-muted fs-4 me-4">
                                <i class = "fab fa-instagram"></i>
                            </a>
                        </li>
                        <li>
                            <a href = "#" class = "text-white text-decoration-none text-muted fs-4 me-4">
                                <i class = "fab fa-pinterest"></i>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</footer>
<!-- end of footer -->





<script src="assets/css/bootstrap-5.0.2-dist/js/bootstrap.min.js"></script>
<script src="assets/js/jquery-3.7.1.js"></script>
<script src="assets/js/script.js"></script>

</body>
</html>