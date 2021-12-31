package com.example.assignment1.controller;

import com.example.assignment1.entity.Product;
import com.example.assignment1.repository.JpaRepository;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class GetDetailProductServlet extends HttpServlet {
    private JpaRepository<Product> productJpaRepository = new JpaRepository<>(Product.class);
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int id =Integer.parseInt(req.getParameter("id")) ;
            Product product = productJpaRepository.findById(id);
            if (product == null){
                resp.getWriter().println("Product not found!");
            }
            else{
                req.setAttribute("product", product);
                req.getRequestDispatcher("/admin/product/detail.jsp").forward(req,resp);
            }
        }catch (Exception ex){
            resp.getWriter().println("Bad request");
        }
    }
}
