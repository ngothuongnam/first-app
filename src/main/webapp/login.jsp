<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
</head>
<body>
    <h2>Login Page</h2>
    <%
        Cookie[] cookies = request.getCookies();
        String savedUsername = null;
        String savedPassword = null;
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("username")) {
                    savedUsername = cookie.getValue();
                }
                if (cookie.getName().equals("password")) {
                    savedPassword = cookie.getValue();
                }
            }
        }

        if ("admin".equals(savedUsername) && "password123".equals(savedPassword)) {
            response.sendRedirect("home.jsp");
        }
    %>
    <% if (request.getParameter("error") != null) { %>
        <p style="color: red;">Invalid username or password. Please try again.</p>
    <% } %>
    <form action="login" method="post">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required><br><br>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br><br>
        <button type="submit">Login</button>
    </form>
</body>
</html>
