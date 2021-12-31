package com.example.assignment1.controller;

import com.example.assignment1.entity.Product;
import com.example.assignment1.repository.JpaRepository;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class ListProductServlet extends HttpServlet {
    private JpaRepository<Product> productJpaRepository = new JpaRepository<>(Product.class);
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int page = 1;
        int limit = 5;
        if (req.getParameter("page") != null && req.getParameter("page") != ""){
            page = Integer.parseInt(req.getParameter("page"));
        }
        int totalRecord = productJpaRepository.getTotalCount();
        int totalPage = (int) Math.ceil((float)totalRecord / limit);
        List<Product> list = productJpaRepository.paginate(limit,page);
        req.setAttribute("list", list);
        req.setAttribute("totalPage",totalPage);
        req.setAttribute("page",page);
        req.getRequestDispatcher("/admin/product/list.jsp").forward(req,resp);
    }
}
