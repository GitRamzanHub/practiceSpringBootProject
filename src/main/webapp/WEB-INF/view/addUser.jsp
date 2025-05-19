<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Add New User</title>
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/commonStyle.css">
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<!-- SweetAlert2 CSS -->
	<link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.0/dist/sweetalert2.min.css" rel="stylesheet">
	<!-- SweetAlert2 JS -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.0/dist/sweetalert2.all.min.js"></script>
	

</head>
	<body class="reg-background">
		<div class="container d-flex justify-content-center align-items-center">
	        <div class="card login-card" style="height: 80%; width: 50%;">
	            <div class="card-body">
	                <h5 class="login-title">Register</h5>
	                <form id="registerForm">
	                    <div class="mb-3">
	                       <!-- <label for="username" class="form-label" style="font-size: 14px;">Username</label>
	                        <input type="text" class="form-control form-control-sm" id="username" name="username"> -->
	                        <div class="form-group">
							  <input type="text" id="username" placeholder="Username">
							  <label for="name">Username</label>
							</div>
	                        
	                    </div>
	                    <div class="mb-3">
	                       <!-- <label for="password" class="form-label" style="font-size: 14px;">Password</label>
	                        <input type="password" class="form-control form-control-sm" id="password" name="password"> -->
	                         <div class="form-group">
							  <input type="password" id="password" placeholder="Password">
							  <label for="name">Password</label>
							</div>
	                    </div>
	                         
	                    <div class="mb-3">
	                    	 <div class="form-group">
							  <input type="text" id="position" placeholder="Position">
							  <label for="name">Position</label>
							</div>
	                        <!-- <label for="password" class="form-label" style="font-size: 14px;">Email</label>
	                        <input type="email" class="form-control form-control-sm" id="email" name="password" > -->
	                    </div>
	                    
	                    <div class="mb-3">
	                    	 <div class="form-group">
							  <input type="text" id="dept" placeholder="Department">
							  <label for="name">Department</label>
							</div>
	                    </div>
	                    
	                    <!-- selecting role for user -->
	                    <div class="mb-3">
	                    	<div class="form-group">
							  <select id="userRole" class="form-select form-select-sm" style="border: 1px solid #4facfe;">
							    <option value="" disabled selected hidden></option>
							    <option value="A">Admin</option>
							    <option value="U">User</option>
							  </select>
							  <label for="userRole">User Type</label>
							</div>
	                    </div>
	                    
	                    <div class="form-label mt-3 " style="font-size: 12px; text-align: right;" >
			            	<a href="${pageContext.request.contextPath}/#">Forgot Password</a>
			            </div>
	                    <div class="d-grid gap-2">
	                        <button type="submit" class="btn btn-login btn-sm" onclick="addNewUser(event)">Register</button>
	                    </div>
	                </form>
	                 <div class="form-label mt-3 " style="font-size: 12px; text-align: right;" >
		            	<a href="${pageContext.request.contextPath}/login">Already Register? Login</a>
		            </div>
	            </div>
	           
	        </div>
	    </div>
	    
	    <script type="text/javascript">
	    	
	    function addNewUser(e){
	    	
	    	e.preventDefault();
	    	
    		let userName = $('#username').val() || '';
    		let password = $('#password').val() || '';
    		let position = $('#position').val() || '';
    		let dept = $('#dept').val() || '';
    		let userRole = $('#userRole').val() || '';
    		
    		if(userName ===''){
    			setAlert("Please entery username!", 'Warning');
    			return;
    		}
    		if(password === ''){
    			setAlert("Please entery the password!", 'Warning');
    			return;
    		}
    		if(position === ''){
    			setAlert("Please enter the Employee Position!", 'Warning');
    			return;
    		}
    		if(dept === ''){
    			setAlert("Please enter the department!", 'Warning');
    			return;
    		}
    		
    		if(userRole === ''){
    			setAlert("Please select the employee role!", 'Warning');
    			return;
    		}
    		
    		console.log("Calling add user ajax call to save the user")
    		
    		 $.ajax({
		        url: '${pageContext.request.contextPath}/addEmployee', 
		        method: 'POST',
		        contentType: 'application/json',
		        dataType: 'json',
		        headers:{
		        	'Accept': 'application/json'
		        },
		        data: JSON.stringify({
		        	username: userName,
		        	password: password,
		        	position: position,
		        	dept: dept,
		        	status: '1',
		        	role: userRole
		        }),
		        success: function(resp) {
		            console.log("User added: ", resp.empId);
		            
		            if(resp.empId != null) {
		            	let message = "Employee Added!"
		                Swal.fire({
		                	title: '<span style="color: ' + color + ';">' + type + '</span>',
		    				html: message,
		    				confirmButtonText: "OK",
		                    customClass: {
		                        confirmButton: 'swalCustomBtn'
		                    }
		                }).then((result) => {
		                    if (result.isConfirmed) {
		                        // Redirect to login page
		                        window.location.href = '${pageContext.request.contextPath}/login'; // adjust path as needed
		                    }
		                });
		            } else {
		                setAlert("Error While Registering the Employee, Try Again", 'Error');
		            }
		        },

		        error: function(error) {
		            try {
		                const errorResponse = error.responseJSON;
		                console.error('Error: ', errorResponse.message);
		                //alert('Error: ' + errorResponse.message);
		                setAlert('Error: ' + errorResponse.message, 'Error');
		            } catch (e) {
		                console.error('Error: ', error.responseText);
		                // alert('An unexpected error occurred');
		                setAlert('An unexpected error occurred', 'Error');
		            }
		        }
		    });
    	}
	    	
	    function setAlert(message, type){
	    	let color = type === 'Error' ? 'red' :
	              type === 'Success' ? 'green' :
	              type === 'Warning' ? '#ffb100' : 'black';
	
			Swal.fire({
				title: '<span style="color: ' + color + ';">' + type + '</span>',
				html: message,
				showConfirmButton: true,
				customClass: {
					confirmButton: 'swalCustomBtn',
				}
			});	
			
			return;
	    }
	    
	    </script>
	    
	</body>
</html>