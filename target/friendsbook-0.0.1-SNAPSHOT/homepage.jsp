<%@ page import="com.beans.User" %>


<%
    User user = (User) session.getAttribute("user");
    if(user == null){
        response.sendRedirect("index.jsp");
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--Bootstrap's CDN-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    
    <!--icons CDN-->
    
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <!--link to css for this page-->
    
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="HomePage.css">
    
</head>
<body>



<nav class="navbar navbar-expand-sm bg-dark navbar-dark" style="color:white">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">
          <img src="usersDp/" alt="friendsbook" style="width:40px;" class="rounded-pill">
        </a>
        <span id="username" class="ms-2"></span>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="collapsibleNavbar" >
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link ms-5" href="#" data-bs-toggle="modal" data-bs-target="#exampleModal">New Post</a>
        </li>
        <li class="nav-item">
          <a class="nav-link ms-5" href="#">Add Friends</a>
        </li>
        <li class="nav-item">
          <a class="nav-link ms-5" href="#">Search</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle ms-5" href="#" role="button" data-bs-toggle="dropdown"><img class="profile-img-display" src="images/PostImage.png" alt=""></a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#exampleModal">Logout</a></li>
            <li><a class="dropdown-item" href="#">Profile</a></li>
            <li><a class="dropdown-item" href="#">Setting</a></li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>

       
    <div id="postcontainer" class="container align-items-center justify-content-center " style="width: 40rem;">
    <!--This is Post-->

    <div id="postcard" class = "card" style="width: 100%; margin-top: 100px;">
        <div class="d-flex flex-row">
            <div><a href=""><img class="dp img-thumbnail"  src="images/PostImage.png" alt="..."></a></div>
            <div class="ms-2 mt-2"><a href="">Username</a></div>
        </div>
        <div class = "PostCaption">
            <div class = "p ms-2" id="postCaption">A beautiful scenery</div>
        </div>
        <img class ="card-img-top img-thumbnail" id="postImage" src="" alt="picture">
        <div class = "card-body">
           <div class = "d-flex flex-row">
            <div><a href=""><i class="material-icons">thumb_up</i></a></div>
            <div id ="likes" class = "p ms-1">17K</div>
            <div id = "comments" class = "p ms-4">1.7K comments</div>
            <div id = "shares" class = "p ms-4">2.9K shares </div>
           </div><hr>
           <div class = "d-flex flex-row">
            <div class = "mt-2"><a href=""><i class = "material-icons">thumb_up</i></a></div>
            <div class = "mt-2 ms-1">Like</div>
            <div class = "mt-2 ms-4"><a href=""><i class = "material-icons">comment</i></a></div>
            <div class = "mt-2 ms-1">comment</div>
            <div class = "mt-2 ms-4"><a href=""><i class="material-icons">share</i></a></div>
            <div class = "mt-2 ms-1">Share</div>
           </div>
        </div>
    </div>
    </div>

    <!--Modal for Post...-->
   <!-- Button trigger modal -->

  
  <!-- Modal -->
  <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Post A Picture </h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
          <form action="postupload" enctype="multipart/form-data" method="post">
        <div class="modal-body">
          <input type="file" name = "picFile" id="dpFile"  onchange="previewImage()">

          <div class="img">
            <input  name="caption" type="text" id="pictureCaption" class="form-control" placeholder="Say something about this photo..." style="visibility: hidden;">
            <img id="dpImage" class="img-thumbnail"  src="" alt="..." style="width: 200px;height: 200px;">
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
          <button type="submit" class="btn btn-primary">Post</button>
        </div>
        </form>
      </div>
    </div>
  </div>
  <script src="HomePage.js"></script>
</body> 


</html>