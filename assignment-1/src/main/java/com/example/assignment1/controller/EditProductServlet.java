package com.example.assignment1.controller;

import com.example.assignment1.entity.Product;
import com.example.assignment1.repository.JpaRepository;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class EditProductServlet extends HttpServlet {
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
                req.getRequestDispatcher("/admin/product/edit.jsp").forward(req,resp);
            }
        }catch (Exception ex){
            resp.getWriter().println("Bad request");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {

            req.setCharacterEncoding("UTF-8");
            int id = Integer.parseInt(req.getParameter("id"));
            Product product =productJpaRepository.findById(id);
            if (product == null){
                resp.getWriter().println("Product is not found or has been deleted!");
            }
            String name = req.getParameter("name");
            String category = req.getParameter("category");
            String description = req.getParameter("description");
            String thumbnail = req.getParameter("thumbnail");
            double price = Double.parseDouble(req.getParameter("price"));
            int status = Integer.parseInt(req.getParameter("status"));
            product.setName(name);
            product.setCategory(category);
            product.setDescription(description);
            product.setThumbnail(thumbnail);
            product.setPrice(price);
            product.setStatus(status);
            productJpaRepository.update(product);
            resp.sendRedirect("/admin/product/list");
        } catch (Exception ex) {
            resp.getWriter().println("Bad request");
        }
    }
}
