<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Navigation Bar</title>
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <div class="sidebar">
        <!-- Logo -->
        <div class="logo">VG Info</div>

        <!-- Search Bar -->
        <!-- <div class="search-bar">
            <i class="fas fa-search"></i>
            <input type="text" placeholder="Search...">
        </div> -->

        <!-- Menu Items -->
        <div class="menu">
            <div class="menu-item active">
                <i class="fas fa-home"></i>
                Home
            </div>
            <div class="menu-item">
                <i class="fas fa-chart-bar"></i>
                Send Email
            </div>
            <div class="menu-item">
                <i class="fas fa-bell"></i>
                Download Excel
            </div>
            <div class="menu-item">
                <i class="fas fa-chart-line"></i>
                Test 1
            </div>
            <div class="menu-item">
                <i class="fas fa-heart"></i>
                Test 2
            </div>
            <div class="menu-item">
                <i class="fas fa-wallet"></i>
                Test 3
            </div>
            <div class="menu-item">
                <i class="fas fa-sign-out-alt"></i>
                Logout
            </div>
        </div>

        <!-- Dark Mode Toggle -->
       <!-- <div class="dark-mode-toggle">
            <span><i class="fas fa-moon"></i> Dark Mode</span>
            <label class="switch">
                <input type="checkbox" id="darkModeToggle">
                <span class="slider"></span>
            </label>
        </div> -->
    </div>

    <script>
        // Dark Mode Toggle Functionality
        const toggle = document.getElementById('darkModeToggle');
        const sidebar = document.querySelector('.sidebar');

        toggle.addEventListener('change', function() {
            if (this.checked) {
                sidebar.classList.add('dark-mode');
                localStorage.setItem('darkMode', 'enabled');
            } else {
                sidebar.classList.remove('dark-mode');
                localStorage.setItem('darkMode', 'disabled');
            }
        });

        // Check for saved dark mode preference
        if (localStorage.getItem('darkMode') === 'enabled') {
            toggle.checked = true;
            sidebar.classList.add('dark-mode');
        }
    </script>
</body>
</html>