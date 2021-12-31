package com.example.assignment1.entity;

import com.example.assignment1.annotation.Column;
import com.example.assignment1.annotation.Entity;
import com.example.assignment1.annotation.Id;
import com.example.assignment1.util.SQLDataTypes;
import com.example.assignment1.util.ValidationUtil;

import java.util.Date;
import java.util.HashMap;

@Entity(tableName = "products")
public class Product {

    @Id(autoIncrement = true)
    @Column(columnName = "id", columnType = SQLDataTypes.INTEGER)
    private int id;
    @Column(columnName = "name", columnType = SQLDataTypes.VARCHAR50)
    private String name;
    @Column(columnName = "category", columnType = SQLDataTypes.VARCHAR255)
    private String category;
    @Column(columnName = "description", columnType = SQLDataTypes.VARCHAR255)
    private String description;
    @Column(columnName = "thumbnail", columnType = SQLDataTypes.TEXT)
    private String thumbnail;
    @Column(columnName = "price", columnType = SQLDataTypes.DOUBLE)
    private double price;
    @Column(columnName = "created_at", columnType = SQLDataTypes.DATE)
    private Date created_at;
    @Column(columnName = "updated_at",columnType = SQLDataTypes.DATE)
    private Date updated_at;
    @Column(columnName = "status", columnType = SQLDataTypes.INTEGER)
    private int status;

    public Product() {
        this.name = "";
        this.category ="";
        this.description = "";
        this.thumbnail = "";

    }


    public Product(String name, String category, String description, String thumbnail, double price, Date created_at, int status) {
        this.name = name;
        this.category = category;
        this.description = description;
        this.thumbnail = thumbnail;
        this.price = price;
        this.created_at = created_at;
        this.updated_at = updated_at;
        this.status = status;
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

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }

    public Date getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(Date updated_at) {
        this.updated_at = updated_at;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    // kiểm tra đối tượng có hợp lệ hay không.
    public boolean isValid() {
        return getErrors().size() == 0;
    }

    // trả về danh sách lỗi
    public HashMap<String, String> getErrors() {
        HashMap<String, String> errors = new HashMap<>();
        if (name == null || name.length() == 0) {
            errors.put("name", "Vui lòng nhập tên sản phẩm");
        }else if(name.length() <= 7){
            errors.put("name","Tên sản phẩm phải lớn hơn 7 kí tự");
        }
        if (category == null || category.length() == 0) {
            errors.put("category", "Vui lòng nhập tên category");
        }

        if (description == null || description.length() == 0) {
            errors.put("description", "Vui lòng nhập mô tả sản phẩm");
        }

        if (thumbnail == null || thumbnail.length() == 0) {
            errors.put("thumbnail", "Vui lòng lựa chọn ảnh cho sản phẩm.");
        } else if (!ValidationUtil.checkUrl(thumbnail)) {
            errors.put("thumbnail", "Ảnh sai định dạng, vui lòng nhập vào một link.");
        }

        if (price ==  0) {
            errors.put("price", "Vui lòng nhập giá cho sản phẩm.");
        }


        return errors;
    }
}