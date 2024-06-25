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
  <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.css" rel="stylesheet" />
  <script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.js"></script>
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
                 <div class="relative me-4">
                                <img src="usersDp/<%= user.getDp()%>" class="w-10 h-10 rounded-full" src="/docs/images/people/profile-picture-5.jpg" alt="profile image">
                                <span class="top-0 start-7 absolute w-3.5 h-3.5 bg-green-500 border-2 border-white dark:border-gray-800 rounded-full"></span>
                            </div>

    
                <!-- User Name -->
                <span class="ms-2"><% out.print(user.getUserName()); %></span>
    

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
