<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Add New User</title>

	<!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <!-- OpenSans Font -->
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;700&display=swap" rel="stylesheet">
    <!-- Custom CSS -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/login.css">
    <!-- SweetAlert2 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.0/dist/sweetalert2.min.css" rel="stylesheet">
    
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- SweetAlert2 JS -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.0/dist/sweetalert2.all.min.js"></script>
</head>
	<body>
		<%@ include file="alertBox.jsp" %>
		<div class="container-fluid h-100">
			<div class="row h-100">
				<!-- Left Side: Login Card -->
				<div class="col-md-4 d-flex justify-content-center align-items-center login-left">
					<c:if test="${not empty message}">
						<div class="card-title text-danger" id="cardTitleMsg">
							${message}</div>
					</c:if>
					<div class="card-body" style="padding: 0px 30px 0px 30px;">
						<div class="row align-items-center icon-title">
							<div class="col-sm-2" id="icon-container"
								style="justify-content: center; overflow: hidden;">
								<img
									src="${pageContext.request.contextPath}/static/images/employee.png"
									style="object-fit: contain; width: 50px; height: 50px;"
									alt="employee-icon">
							</div>
							<div class="col-sm-10" id="icon-text"
								style="font-size: 35px; color: #0072ffdb;">Employee Data</div>
						</div>
						<h5 class="login-title">Sign Up</h5>
						<form action="${pageContext.request.contextPath}/signup"
							method="post">
							
							<!-- employeeId hidden field -->
							<input type="hidden" id="empId" value="${employee.empId != null ? employee.empId : ''}">
							
							<!-- Username -->
							<div class="form-group" style="position: relative;">
								<input type="text" id="username" name="username" value="${employee.username != null ? employee.username : ''}"
									placeholder="Username" required> <label for="username">Username</label>
								<i class="fa fa-envelope" id="maiIcon"></i>
							</div>
	
							<!-- Password -->
							<div class="form-group" style="position: relative;">
								<input type="password" id="password" name="password" value="${employee.password != null ? employee.password : ''}"
									placeholder="Password" required> <label for="password">Password</label>
								<i class="fas fa-eye" id="eyeIcon" style="cursor: pointer;"></i>
							</div>
							
							<!-- Position -->
							<div class="mb-3">
		                    	 <div class="form-group">
								  <input type="text" id="position" placeholder="Position" value="${employee.position != null ? employee.position : ''}">
								  <label for="name">Position</label>
								</div>
		                    </div>
		                    
		                    <!-- Department -->
		                    <div class="mb-3">
		                    	 <div class="form-group">
								  <input type="text" id="dept" placeholder="Department" value="${employee.dept != null ? employee.dept : ''}">
								  <label for="name">Department</label>
								</div>
		                    </div>
		                    
		                    <!-- Number -->
		                    <div class="mb-3">
		                    	 <div class="form-group">
								  <input type="text" id="number" placeholder="Department" value="${employee.dept != null ? employee.dept : ''}">
								  <label for="name">Contact Number</label>
								</div>
		                    </div>
		                    
		                   	<div class="d-grid gap-2">
		                        <button type="submit" class="custom-btn btn-gradiant-primary" style="font-weight: bold; font-size: 20px;"
		                        	onclick="addNewUser(event)"> ${isEdit ? 'Update' : 'Sign-Up'}
		                        </button>
		                    </div>
							
						</form>
						
						<c:if test="${!false}">
						    <div class="form-label mt-5" style="font-size: 15px; text-align: center;color: #585757b0;">
						        Have an account?  <a style="text-decoration: none;" href="${pageContext.request.contextPath}/login">Sign-In</a>
						    </div>
						</c:if>
						
						<%-- <div class="col-md-4">
						  <img src="${pageContext.request.contextPath}/static/images/bottom3.png" alt="Footer Image" class="footer-image">
						</div> --%>
					</div>
				</div>
				
				<!-- Right Side: Background Image -->
            	<div class="col-md-8 login-right d-none d-md-block"></div>
			</div>
		</div>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	    <script type="text/javascript">
	    	
	    function addNewUser(e){
	    	
	    	e.preventDefault();
	    	let userId = $('#empId').val() || '';
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
		        	empId: userId,
		        	username: userName,
		        	password: password,
		        	position: position,
		        	dept: dept,
		        	status: '1',
		        	role: userRole
		        }),
		        success: function(resp) {
		            // console.log("User added: ", resp.empId);
		            
		            if(resp.empId != null && userId === '') {
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
		            } else if(userId != '' && resp.empId != null){
		                setAlert("Employee Updated!", 'Success');
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

<!-- todo adding hiding forgot pass text & add new user text hiding -->