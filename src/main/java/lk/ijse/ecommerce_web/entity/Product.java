package lk.ijse.ecommerce_web.entity;

public class Product {
    private int id;
    private String name;
    private double price;
    private   int quantity;
    private   int categoryId;
    private   String description;
    private   String image_path;
    private String categoryDescription;

    public Product() {}

    public Product(int id, String name, double price, int quantity, int categoryId, String description, String image_path) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.categoryId = categoryId;
        this.description = description;
        this.image_path = image_path;
    }
    public Product(int id, String name, double price, int quantity, String categoryDescription, String description, String image_path) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.categoryDescription = categoryDescription;
        this.description = description;
        this.image_path = image_path;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage_path() {
        return image_path;
    }

    public void setImage_path(String image_path) {
        this.image_path = image_path;
    }
}
