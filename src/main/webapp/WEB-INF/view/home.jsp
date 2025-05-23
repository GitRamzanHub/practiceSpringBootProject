<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/navbar.css">
    
    <style>
        /* keep 230 px space for sidebar page */
        .main-content {
            margin-left: 230px; /* Width of the sidebar */
            padding: 20px;
        }
    </style>
</head>
	<body>
	    <!-- Include the navigation bar -->
	    <%@ include file="navbar.jsp" %>  
	
	    <!-- Main content -->
	    <div class="main-content">
		    <h1 class="mb-4">Welcome to the Dashboard</h1>
		    
		    <div class="bodyTableContent table-responsive">
		        <table id="myEmpTable" class="table table-bordered table-striped table-hover align-middle">
		            <thead class="table-dark text-center">
		                <tr style="font-size: 13px;">
		                    <th>Sr.No</th>
		                    <th>Username</th>
		                    <th>Department</th>
		                    <th>Position</th>
		                    <th>Status</th>
		                    <th>Action</th>
		                </tr>
		            </thead>
		            <tbody id="myEmpTableBody">
		                <c:forEach items="${empList}" var="emp" varStatus="index">
		                    <tr style="cursor: pointer; font-size: 13px;">
		                        <td class="text-center">${index.index + 1}</td>
		                        <td>${emp.username}</td>
		                        <td>${emp.dept}</td>
		                        <td>${emp.position}</td>
		                        <td>${emp.status}</td>
		                        <td class="text-center">
		                            <!-- action buttons with icons -->
		                            <a href="/editEmployee/${emp.empId}" class="text-primary mx-2" title="Edit">
		                            	<i class="fas fa-edit" style="cursor: pointer;"></i>
		                            </a>
		                            
		                            <a href="/deleteEmployee/${emp.empId}" class="text-primary mx-2" title="Delete">
		                            	<i class="fas fa-trash-alt" style="color: red; cursor: pointer;"></i>
		                            </a>
		                        </td>
		                    </tr>
		                </c:forEach>
		            </tbody>
		        </table>
		    </div>
		</div>
	    
	</body>
</html>