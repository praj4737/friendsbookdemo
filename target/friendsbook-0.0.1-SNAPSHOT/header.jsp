<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@page import="com.beans.User"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap 5 Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <%
	
    	User user=(User)session.getAttribute("user");
		if(user==null){
			session.invalidate();
			response.sendRedirect("index.jsp");
		}
		String dp=user.getDp();
	
	%>
    <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #2596be;">
        
        <div class="container-fluid">
            <!-- User Profile (on the left side) -->
            <div class="d-flex align-items-center">
                <!-- User Profile Picture -->
                <img alt="User Profile" class="rounded-circle" width="40" height="40" src="usersDp/<%= user.getDp()%>" />
    
                <!-- User Name -->
                <span class="ms-2"><% out.print(user.getUserName()); %></span>
    
                <!-- Online Status Icon (you can use an icon library like Font Awesome) -->
                <span class="flex w-3 h-3 me-3 bg-gray-900 rounded-full dark:bg-gray-700"></span>
            </div>
            <!-- Logo (on the right side) -->
            <div class="d-flex justify-content-center" style="margin-left: 3%;">
                <a class="navbar-brand" href="#">Your Logo</a>
            </div>
            
    
            
    
            <!-- Collapsible Menu -->
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="#">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">About</a>
                    </li>
                    <!-- Add more menu items as needed -->
                </ul>
            </div>
        </div>
    </nav>
</body>
</html>
