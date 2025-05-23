<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/login.css">

    <title>Login</title>
</head>
<body>
    <div class="container-fluid h-100">
        <div class="row h-100">
            <!-- Left Side: Login Card -->
            <div class="col-md-4 d-flex justify-content-center align-items-center login-left">
              	   <c:if test="${not empty message}">
                      <div class="card-title text-danger" id="cardTitleMsg">
                          ${message}
                      </div>
                  </c:if>
                  <div class="card-body" style="padding: 0px 30px 0px 30px;">
	                  	<div class="row align-items-center mb-5 icon-title">
					        <div class="col-sm-2" id="icon-container" style="justify-content: center; overflow: hidden;">
					        	<img src="${pageContext.request.contextPath}/static/images/employee.png" 
					        	     style="object-fit: contain; width: 50px; height: 50px;"alt="employee-icon">
					        </div>
					        <div class="col-sm-10" id="icon-text" style="font-size: 35px; color: #0072ffdb;">Employee Data</div>
					    </div>
                      	<h5 class="login-title">Welcome back</h5>
	                      <form action="${pageContext.request.contextPath}/loginDetails" method="post">
	                          <!-- Username -->
	                          <div class="form-group" style="position: relative;">
	                              <input type="text" id="username" name="username" placeholder="Username" required>
	                              <label for="username">Username</label>
	                              <i class="fa fa-envelope" id="maiIcon"></i>
	                          </div>
	
	                          <!-- Password -->
	                          <div class="form-group" style="position: relative;">
	                              <input type="password" id="password" name="password" placeholder="Password" required>
	                              <label for="password">Password</label>
	                              <i class="fas fa-eye" id="eyeIcon" style="cursor: pointer;"></i>
	                          </div>
	
	                          <%-- <div class="form-label mt-3" style="font-size: 12px; text-align: right;">
	                              <a href="${pageContext.request.contextPath}/forgotPassword">Forgot Password</a>
	                          </div> --%>
	                          <div class="form-label mt-3" style="font-size: 13px; text-align: right; color: #585757b0;">
		                          <a style="text-decoration: none;" href="${pageContext.request.contextPath}/forgotPassword">Forgot Password</a>
		                      </div>
	
	                          <div class="d-grid gap-2">
	                              <button type="submit" style="font-weight: bold; font-size: 20px;" class="custom-btn btn-gradiant-primary">Sign in</button>
	                          </div>
	                      </form>

	                      <div class="form-label mt-5" style="font-size: 15px; text-align: center;color: #585757b0;">
	                          Don't have an account?  <a style="text-decoration: none;" href="${pageContext.request.contextPath}/addEmployee">Sign Up</a>
	                      </div>
                  </div>
            </div>

            <!-- Right Side: Background Image -->
            <div class="col-md-8 login-right d-none d-md-block"></div>
        </div>
    </div>

    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

    <script type="text/javascript">
        const passwordField = document.getElementById('password');
        const eyeIcon = document.getElementById('eyeIcon');

        eyeIcon.addEventListener('click', () => {
            const isPassword = passwordField.type === 'password';
            passwordField.type = isPassword ? 'text' : 'password';
            eyeIcon.classList.toggle('fa-eye');
            eyeIcon.classList.toggle('fa-eye-slash');
        });

        // Optional: Use AJAX for form submission (currently unused)
        function submitLoginDetails() {
            let username = $('#username').val() || '';
            let password = $('#password').val() || '';

            $.ajax({
                url: "${pageContext.request.contextPath}/loginDetails",
                type: "POST",
                data: {
                    username: username,
                    password: password
                },
                success: function(resp) {
                    console.log("Success: " + resp);
                    window.location.replace("${pageContext.request.contextPath}/home");
                },
                error: function(xhr) {
                    console.log("Error: " + xhr.responseText);
                    // Display error using SweetAlert2 (if integrated)
                    if (typeof Swal !== 'undefined') {
                        Swal.fire({
                            title: 'Error',
                            text: xhr.responseJSON?.message || 'Login failed. Please try again.',
                            icon: 'error'
                        });
                    }
                }
            });
        }
    </script>
</body>
</html>