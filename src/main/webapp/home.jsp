<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home Page</title>
</head>
<body>
    <h2>Welcome</h2>
    <p>You are logged in as <%= request.getCookies()[0].getValue() %>.</p>
</body>
</html>
