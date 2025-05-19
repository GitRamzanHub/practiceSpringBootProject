<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Forgot Password</title>
		
		<!-- Bootstrap CSS -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/commonStyle.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/customAlert.css">
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/forgotPassword.js"></script>
		
		
	</head>

	<body class="reg-background">
			<div class="container d-flex justify-content-center align-items-center" style="height: 100vh;">
				<div class="card login-card position-relative">
					<div>
					    <div id="statusMessage" style="font-size: 14px; text-align: center; color: green; min-height: 20px;">
				            
				        </div>
					
				        <!-- Close icon -->
				        <span onclick="window.location.href='login'" style="position: absolute;top: 8px;right: 12px;
				            font-size: 20px;cursor: pointer;color: #999;">
				            ×
				        </span>
					</div>
			        
					<div class="card-body">
		                <h5 class="login-title" style="font-family: 'Segoe UI', sans-serif;">Forgot Password</h5>
		                <p style="font-size: 12px; color: #666666db;">
			                We will send One Time Password (OTP) on your registered email address to reset your password.
			            </p>
		                <div class="mb-3">
						    <div class="form-group">
						        <input type="text" id="email" name="email" placeholder="Email" required>
						        <label for="email">Email</label>
						    </div>
						</div>
						
						<!-- Password Reset Block -->
						<%-- <div id="resetPasswordBlock" hidden="hidden">
						    <!-- New Password -->
						    <div class="mb-3">
						        <div class="form-group">
						            <input type="text" id="newPassword" name="newPassword" placeholder="New Password" required>
						            <label for="newPassword">New Password</label>
						        </div>
						    </div>
						    <!-- Confirmed Password -->
						    <div class="mb-3">
						        <div class="form-group">
						            <input type="text" id="confirmedPassword" name="confirmedPassword" placeholder="Confirmed Password" required>
						            <label for="confirmedPassword">Confirmed Password</label>
						        </div>
						    </div>					
						</div> --%>
						
						<div class="text-center">
						    <button id="submitBtn" type="button" class="custom-btn btn-primary" onclick="sendOTP()">Submit</button>
						    <button id="changePasswordBtn" type="button" class="custom-btn btn-primary" onclick="forgotPassword()" hidden="hidden">Submit</button>
						</div>
		                
		            </div>
				</div>
			</div>
			
			<!-- Custom Alert Box -->
		    <div id="customAlert" class="custom-alert hidden">
		    	<div class="alert-content">
		    		<span class="close-btn" onclick="closeAlert()">&times;</span>
		    		<h3 id="alertTitle">Title</h3>
		    		<p id="alertMessage" style="color: black;">This is a custom alert Message!<p>
		    		<div class="alert-button">
		    			<button onclick="closeAlert()" class="ok-btn">OK</button>
		    		</div>
		    	</div>
		    </div>
	</body>
</html>
