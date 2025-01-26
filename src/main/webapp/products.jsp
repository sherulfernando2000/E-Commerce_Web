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
        <form class="d-flex m-0">
            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success" type="submit">Search</button>
        </form>



        <div class="collapse navbar-collapse  justify-content-end " id="navbarNavAltMarkup">
            <div class="navbar-nav position-relative d-flex justify-content-around">

                <a class="nav-link " aria-current="page" href="index.jsp">Home</a>
                <a class="nav-link active" href="#">Products</a>

                <a class="nav-link" href="#">About us</a>
                <a class="nav-link" href="#">Blog</a>
                <a class="nav-link" href="cart.jsp">
                    <div class="d-flex align-items-center" style="background-color:#212529">
                        <button type="button" class="btn-position-relative cart mt-1" style="background-color: #212529">
                            <i class="fa fa-shopping-cart " style="color: white; background-color: #212529"></i>
                            <span class="position-absolute top-0" style="color: white">5</span>

                        </button>
                    </div>

                </a>
                <a class="nav-link  ms-2" aria-current="page" href="registration-save.jsp">Login/Register</a>
            </div>
        </div>
    </div>
</nav>




<!-- collection -->
<section id="collection" class="py-5">
    <div class="container">
        <div class="title text-center">
            <h2 class="position-relative d-inline-block mt-3">New Collection</h2>
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


            <%--Card with for loop--%>
                <div class="col-md-6 col-lg-4 col-xl-3 p-2 m-3  best phone-card ">
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
                            <button id="decrease-<%=product.getId()%>" class="btn-counter rounded-circle">-</button>
                            <span id="display-<%=product.getId()%>">0</span>
                            <button id="increase-<%=product.getId()%>" class="btn-counter rounded-circle">+</button>
                        </div>

                        <button type="button" class=" btn-addToCart mt-1 rounded" onclick="addToCart('<%=product.getId()%>')">Add to cart</button>
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
<script>
    /*$(document).ready(function () {
        let count = 0;

        $("#increase").click(function () {
            count++;
            $("#display").text(count);
        });

        $("#decrease").click(function () {
            count--;
            $("#display").text(count);
        });
    });

*/

    $(document).ready(function () {
        $(".btn-counter").click(function () {
            const buttonId = $(this).attr("id"); // Get the clicked button's ID
            let productId = buttonId.split("-")[1]; // Extract the product ID

            const displayId = "#display-"+productId; // ID of the display element

            let count = parseInt($(displayId).text());

            if (buttonId.startsWith("increase")) {
                count++;
            } else if (buttonId.startsWith("decrease")) {
                if (count > 0) {
                    count--;
                }
            }

            $(displayId).text(count); // Update the quantity display
        });
    });



    const addToCart = (productId)=>{

        /*let quantity = $("#display").text();
        console.log("qty"+ quantity);*/

        const displayId = "#display-"+productId;
        const quantity = $(displayId).text(); // Get the quantity from the correct span

        console.log(`Product ID: ${productId}, Quantity: ${quantity}`);
        alert("item added sucessfully")

        $.ajax({
            url: 'cart',
            type:'POST',
            data:JSON.stringify({
                productId: productId,
                productQty: quantity
            }),
            success:function (resp){
                if (data.status === 'success') {
                    alert('Product added to cart successfully!');
                } else {
                    alert('Failed to add product to cart.');
                }
            },
            error:function (xhr, status, error) {
                console.error('Error:', error);
                alert('An error occurred while adding the product to the cart.');
            }
        });
    }

</script>

</body>
</html>
