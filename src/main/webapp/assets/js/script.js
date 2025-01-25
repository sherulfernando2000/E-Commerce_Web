const fetchData = () => {$.ajax({
    url: 'http://localhost:8080/E_Commerce_Web_war_exploded/cart',
    type:'GET',
    success:(resp)=>{
        console.log("resp"+resp);
        resp.map((product)=>{
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
                                                    <h6 class="mb-0" ><span>Rs.</span>${product.price}</h6>
                                                </div>
                                                <a href="#!" class="delete-product" data-id="${product.productId}" style="color: #cecece;"><i class="fas fa-trash-alt"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                `)

        })

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