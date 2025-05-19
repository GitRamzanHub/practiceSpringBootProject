
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home Page</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/navbar.css">
    <style>
        /* Ensure the main content doesn't overlap with the sidebar */
        .main-content {
            margin-left: 250px; /* Width of the sidebar */
            padding: 20px;
        }
    </style>
</head>
<body>
    <!-- Include the navigation bar -->
    <%@ include file="navbar.jsp" %>

    <!-- Main content -->
    <div class="main-content">
        <h1>Welcome to the Dashboard</h1>
        <p>This is the main content area.</p>
    </div>
</body>
</html>