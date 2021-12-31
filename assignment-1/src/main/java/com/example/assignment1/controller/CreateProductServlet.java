package com.example.assignment1.controller;

import com.example.assignment1.entity.Product;
import com.example.assignment1.repository.JpaRepository;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;


public class CreateProductServlet extends HttpServlet {
    private JpaRepository<Product> productJpaRepository = new JpaRepository<>(Product.class);
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/admin/product/form.jsp").forward(req,resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
             req.setCharacterEncoding("UTF-8");
        try {
            String name = req.getParameter("name");
            String category = req.getParameter("category");
            String description = req.getParameter("description");
            String thumbnail = req.getParameter("thumbnail");
            double price = Double.parseDouble(req.getParameter("price"));
            Date created_at = new Date();
            int status = Integer.parseInt(req.getParameter("status"));
            Product product = new Product(name, category, description, thumbnail, price,created_at, status);
            if (product.isValid()){
                productJpaRepository.save(product);
                resp.sendRedirect("/admin/product/list");
            }
           else {
               HashMap<String, String > errors = product.getErrors();
               req.setAttribute("errors",errors);
               req.setAttribute("product",product);
                req.getRequestDispatcher("/admin/product/form.jsp").forward(req,resp);
            }
        } catch (Exception ex) {
            resp.getWriter().println("Bad request");
        }
    }
}
