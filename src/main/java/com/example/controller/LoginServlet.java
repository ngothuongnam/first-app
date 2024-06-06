package com.example.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Lấy thông tin từ request
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Kiểm tra tên đăng nhập và mật khẩu
        if ("admin".equals(username) && "password123".equals(password)) {

            // Nếu đăng nhập thành công, tạo cookie lưu trữ thông tin đăng nhập
            Cookie usernameCookie = new Cookie("username", username);
            Cookie passwordCookie = new Cookie("password", password);
            usernameCookie.setMaxAge(60 * 60 * 24 * 30); // Thời gian sống của cookie: 30 ngày
            passwordCookie.setMaxAge(60 * 60 * 24 * 30); // Thời gian sống của cookie: 30 ngày
            response.addCookie(usernameCookie);
            response.addCookie(passwordCookie);

            // Chuyển hướng đến trang chính
            response.sendRedirect("home.jsp");
        } else {
            // Nếu đăng nhập không thành công, chuyển hướng đến trang đăng nhập lại với thông báo lỗi
            response.sendRedirect("login.jsp?error=1");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}


