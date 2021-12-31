package com.example.assignment1.util;

import com.example.assignment1.entity.Product;
import com.example.assignment1.repository.JpaRepository;

public class Example {
    public static void main(String[] args) {
        JpaRepository<Product> productJpaRepository = new JpaRepository<>(Product.class);
        int count = productJpaRepository.getTotalCount();
        System.out.println(count);


    }
}
