const fetchData = () => {$.ajax({
    url: 'http://localhost:8080/E_Commerce_Web_war_exploded/cart',
    type:'GET',
    success:(resp)=>{
        console.log("resp"+resp);
        // Clear existing cards before appending new ones
        $("#cardsBody").empty();

        let subtotal = 0; // Initialize subtotal

        resp.map((product)=>{

            // Calculate subtotal (price * quantity for each product)
            subtotal += product.price * product.quantity;

            //console.log(product)
            $("#cardsBody").append(`
                        <div  class="card mb-3 id="card-${product.id}">
                                    <div class="card-body">
                                        <div class="d-flex justify-content-between">
                                            <div class="d-flex flex-row align-items-center">
                                                <div>
                                                    <img
                                                            src="${product.image_path}"
                                                            class="img-fluid rounded-3" alt="Shopping item" style="width: 65px;">
                                                </div>
                                                <div class="ms-3">
                                                    <h5>${product.name}</h5>
                                                    <p class="small mb-0">${product.description}</p>
                                                </div>
                                            </div>
                                            <div class="d-flex flex-row align-items-center">
                                                <div style="width: 50px;">
                                                    <h5 class="fw-normal mb-0">${product.quantity}</h5>
                                                </div>
                                                <div style="width: 80px;">
                                                    <h6 class="mb-0">Rs.</h6><h6 class="priceText">${product.price}</h6>
                                                </div>
                                                <a href="#!" class="delete-product" data-id="${product.productId}" style="color: #cecece;"><i class="fas fa-trash-alt"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                `)

        })

        // Update the payment section
        const shippingCost = 0; // Replace with a dynamic value if needed
        const total = subtotal + shippingCost;

        // Dynamically update the payment section
        $(".subtotal-amount").text(`Rs. ${subtotal.toFixed(2)}`);
        $(".shipping-amount").text(`Rs. ${shippingCost.toFixed(2)}`);
        $(".total-amount").text(`Rs. ${total.toFixed(2)}`);
        $(".checkout-btn span:first-child").text(`Rs. ${total.toFixed(2)}`);


    },
    error:(err)=>{
        console.error("Error loading products:", xhr.responseText, error);
        alert("Failed to load product.")
    }
})
}

fetchData();

$(document).on("click", ".delete-product", function () {
    const productId = $(this).data("id"); // Get the product ID
    const cardId = `#card-${productId}`; // Construct the card's unique ID

    console.log(cardId+"--"+ productId);
    // Send an AJAX DELETE request to the server
    $.ajax({
        url: `http://localhost:8080/E_Commerce_Web_war_exploded/cart/${productId}`, // Update endpoint accordingly
        type: "DELETE",
        success: (resp) => {
            if (resp.status === "success") {
                // Remove the card from the DOM
                $(cardId).remove();
                alert("Product removed successfully.");
                fetchData();
            } else {
                alert("Failed to remove product.");
            }
        },
        error: (xhr, status, error) => {
            console.error("Error:", error);
            alert("An error occurred while removing the product.");
        }
    });
});


// JavaScript: AJAX for Checkout
$(document).on("click", ".checkoutBtn", function () {
    const shippingCost = 0; // Shipping cost, if applicable

    // Prepare order data
    const orderData = {
        items: [], // Product details from cart
        totalAmount: 0 // Total amount for the order
    };

    // Collect cart items
    $("#cardsBody .card").each(function () {
        const product = {
            productId: $(this).find(".delete-product").data("id"),
            quantity: parseInt($(this).find(".fw-normal").text()),
            price: parseFloat($(this).find(".priceText").text())
        };
        console.log(product.price+"+"+product.quantity+"+"+product.productId);
        orderData.items.push(product);
        orderData.totalAmount += product.price * product.quantity;
    });

    // Send data to backend
    $.ajax({
        url: "http://localhost:8080/E_Commerce_Web_war_exploded/order",
        type: "POST",
        contentType: "application/json",
        data: JSON.stringify(orderData),
        success: (resp) => {
            console.log("Order placed successfully:", resp);

            // Show success message
            alert("Your order has been placed successfully!");

            // Clear the cart
            $("#cardsBody").empty();
            $(".subtotal-amount, .total-amount").text("Rs. 0.00");
        },
        error: (xhr, status, error) => {
            console.error("Error placing order:", xhr.responseText);
            alert("Failed to place the order. Please try again.");
        }
    });
});

$(document).ready(function () {
    $("#searchForm").on("submit", function (e) {
        e.preventDefault();

        const searchQuery = $("#searchInput").val();

        $.ajax({
            url: "ProductSearchServlet", // Servlet URL
            type: "GET",
            data: { query: searchQuery },
            dataType: "json",
            success: function (response) {
                let productsHtml = "";

                if (response.length > 0) {
                    response.forEach(product => {
                        productsHtml += `
                                <div class="col-md-6 col-lg-4 col-xl-3 p-2 m-3 best phone-card">
                                    <div class="collection-img position-relative">
                                        <img src="${product.imagePath}" class="w-100 rounded-3">
                                        <span class="position-absolute bg-primary text-white d-flex align-items-center justify-content-center bg-dark p-1 rounded">Sale</span>
                                    </div>
                                    <div class="text-center">
                                        <div class="rating mt-3">
                                            <span class="text-primary"><i class="fas fa-star"></i></span>
                                            <span class="text-primary"><i class="fas fa-star"></i></span>
                                            <span class="text-primary"><i class="fas fa-star"></i></span>
                                            <span class="text-primary"><i class="fas fa-star"></i></span>
                                            <span class="text-primary"><i class="fas fa-star"></i></span>
                                        </div>
                                        <p class="text-capitalize my-1">${product.name}</p>
                                        <span class="fw-bold">Rs. ${product.price}</span>
                                        <div id="counter">
                                            <button id="decrease-${product.productId}" class="btn-counter rounded-circle">-</button>
                                            <span id="display-${product.productId}">0</span>
                                            <button id="increase-${product.productId}" class="btn-counter rounded-circle">+</button>
                                        </div>
                                        <button type="button" class="btn-addToCart mt-1 rounded" onclick="addToCart('${product.productId}')">Add to cart</button>
                                    </div>
                                </div>
                            `;
                    });
                } else {
                    productsHtml = "<p>No products found.</p>";
                }

                // Replace the productContainer content
                $("#productContainer").html(productsHtml);
            },
            error: function (xhr, status, error) {
                console.error("Error occurred:", error);
                $("#productContainer").html("<p>An error occurred while fetching products.</p>");
            }
        });
    });
});