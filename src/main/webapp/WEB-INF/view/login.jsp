<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/commonStyle.css">
	
    <title>Login</title>
</head>

	<body class="reg-background">
	    <div class="container d-flex justify-content-center align-items-center" style="height: 100vh;">
	        <div class="card login-card">
	            <div class="card-body">
	                <h5 class="login-title">Login</h5>
	                <!-- <form action="${pageContext.request.contextPath}/login" method="post"> -->
	                	<!-- Username -->
	                	<div class="mb-3">
	                       <!-- <label for="username" class="form-label" style="font-size: 14px;">Username</label>
	                        <input type="text" class="form-control form-control-sm" id="username" name="username"> -->
	                        <div class="form-group">
							  <input type="text" id="username" placeholder="Username" required>
							  <label for="name">Username</label>
							</div>
	                    </div>
	                    
	                    <!-- Password -->
	                    <div class="mb-3">
	                       <!-- <label for="password" class="form-label" style="font-size: 14px;">Password</label>
	                        <input type="password" class="form-control form-control-sm" id="password" name="password"> -->
	                         <div class="form-group" style="position: relative;">
								  <input type="password" id="password" placeholder="Password" required>
								  <label for="name">Password</label>
								  <i class="fas fa-eye" id="eyeIcon" style="cursor: pointer;"></i>							  
							 </div>
	                    </div>
	                    
	                    <!-- <div class="mb-3">
	                        <label for="password" class="form-label">Password</label>
	                        <input type="password" class="form-control form-control-sm" id="password" name="password" required>
	                    </div> -->
	                    
	                    <div class="form-label mt-3 " style="font-size: 12px; text-align: right;" >
			            	<a href="${pageContext.request.contextPath}/forgotPassword">Forgot Password</a>
			            </div>
	                    <div class="d-grid gap-2">
	                        <button type="submit" class="custom-btn btn-primary" onclick="submitLoginDetails()">Login</button>
	                    </div>
	               <!-- </form> -->
	                 <div class="form-label mt-3 " style="font-size: 12px; text-align: right;" >
		            	<a href="${pageContext.request.contextPath}/addEmployee">New user? Register</a>
		            </div>
	            </div>
	           
	        </div>
	    </div>
	    
	    
	   
	    <!-- Optional JavaScript; choose one of the two! -->
	    <!-- Option 1: Bootstrap Bundle with Popper -->
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	    
	    <script type="text/javascript">
		    const passwordField = document.getElementById('password');
		    const eyeIcon = document.getElementById('eyeIcon');
	
		    eyeIcon.addEventListener('click', () => {
		      const isPassword = passwordField.type === 'password';
		      passwordField.type = isPassword ? 'text' : 'password';
	
		      // Toggle both eye and eye-slash icons
		      eyeIcon.classList.toggle('fa-eye');
		      eyeIcon.classList.toggle('fa-eye-slash');
		    });
		    
		    function submitLoginDetails(){
		    	
		    	let username = $('#username').val() || '';
		    	let password = $('#password').val() || '';
		    	
		    	$.ajax({
		    		url: "${pageContext.request.contextPath}/loginDetails",
		    		type: "POST",
		    		data:{
		    			username: username,
		    			password: password
		    		},
		    		success: function(resp){
		    			console.log("Success: "+resp);
		    			window.location.replace("${pageContext.request.contextPath}/home");
		    		},
		    		error: function(resp){
		    			console.log("Error: "+resp);
		    		}
		    	});
		    }
	    </script>
	    
	
	</body>

</html>