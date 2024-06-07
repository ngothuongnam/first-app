<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome</title>
</head>
<body>
    <%
        String username = (String) session.getAttribute("username");
        if (username == null) {
            response.sendRedirect("loginv1.jsp");
        }
    %>
    <h2>Welcome, <%= username %></h2>
    <a href="logoutv1">Logout</a>
</body>
</html>
