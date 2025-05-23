<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Forgot Password</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <!-- OpenSans Font -->
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;700&display=swap" rel="stylesheet">
    <!-- Custom CSS -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/login.css">
    
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Custom JS -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/forgotPassword.js"></script>
</head>

<body>

	<%@ include file="alertBox.jsp" %>
	
    <div class="container-fluid h-100">
        <div class="row h-100">
            <!-- Left Side: Login Card -->
            <div class="col-md-4 d-flex justify-content-center align-items-center login-left">
                
                <div class="card-body" style="padding: 0px 30px 0px 30px;">
                	<div id="statusMessage" style="font-size: 14px; text-align: center; color: green; min-height: 20px;"> </div>
                    <h5 class="login-title">Forgot Password</h5>
                    <p style="font-size: 12px; color: #666666db;">
                        We will send One Time Password (OTP) on your registered email address to reset your password.
                    </p>
                    <div class="mb-3">
                        <div class="form-group">
                            <input type="text" id="email" name="email" placeholder="Email" required>
                            <label for="email">Email</label>
                        </div>
                    </div>
                    
                    <div class="d-grid gap-2">
                        <button id="submitBtn" type="button" style="font-weight: bold; font-size: 20px;" class="custom-btn btn-gradiant-primary" onclick="sendOTP()">Submit</button>
                        <button id="changePasswordBtn" type="button" style="font-weight: bold; font-size: 20px;" class="custom-btn btn-gradiant-primary" onclick="forgotPassword()" hidden="hidden">Submit</button>
                    </div>
                    
                    <div class="mt-3" id="cancle-btn" style="color: #666666db;cursor: pointer;
					    text-align: right;font-size: 13px;">
					    <a style="text-decoration: none;" href="${pageContext.request.contextPath}/login">Cancel</a>
					</div>
                </div>
            </div>
            
            <!-- Right Side: Background Image with Footer -->
            <div class="col-md-8 login-right d-none d-md-block">
                
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>