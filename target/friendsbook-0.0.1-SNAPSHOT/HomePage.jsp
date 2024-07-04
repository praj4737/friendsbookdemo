<%@ page import="com.beans.User" %>
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
    <link rel="stylesheet" href="HomePage.css">
    <title>Document</title>
    
    <script>
       
        function previewImage() {
            const fileInput = document.getElementById('profileImage');
            const preview = document.getElementById('preview');
            if (fileInput.files && fileInput.files[0]) {
                preview.src = URL.createObjectURL(fileInput.files[0]);
            } else {
                preview.src = ''; // Clear preview if no file selected
            }
        }
    </script>

</head>
<body>
<%
    User user = (User) session.getAttribute("user");
    if(user.equals(null)){
        response.sendRedirect("index.jsp");
    }
%>
    <div id = "header" class = "container-fluid" style = "border: 1px none black;">
        <div class = "container">
          <div class = "d-flex flex-row">
            <div class=""><a href=""><i class="material-icons">facebook</i></a></div>
            <div class="">riendsBook</div>
            
            <div class="ms-5"><input class="" id="searchBox" type="search" placeholder="search"></div>
            
           

          </div>
        </div>
        <div class="row mt-3">
            <div class = "col col-lg-2 col-md-2 "><a href=""><i class = "material-icons">home</i></a></div>
            <div class = "col col-lg-2 col-md-2 "><a href=""><i class = "material-icons">group</i></a></div>
            <div class = "col col-lg-2 col-md-2 "><a href=""><i class = "material-icons">smart_display</i></a></div>
            <div class = "col col-lg-2 col-md-2 "><a href=""><i class = "material-icons">storefront</i></a></div>
            <div class = "col col-lg-2 col-md-2 "><a href=""><i class = "material-icons">notifications</i></a></div>
            <div class="col"> <a href=""><i class = "material-icons">menu</i></a></div>
          </div>
    </div><hr>
    <div class = "container-fluid" style = "border: 1px none black;">
        <div class = "row align-items-center"> 
            <div class = "col col-lg-4 col-md-4"><a href=""><img class="dp img-thumbnail"  src="images/PostImage.png" alt="..."></a></div>
            <div class = "col col-lg-4 col-md-4"><input id="writeSometing" class ="" type="text" placeholder="write something here..."></div>
            <div class = "col col-lg-4 col-md-4"><button class="uploadImage" type="button" data-bs-toggle="modal" data-bs-target="#exampleModal">
                <i class = "material-icons">image</i>
              </button></div>
        </div>
    </div>
    <!--This is Post-->
    <div class = "card mt-3" style="width: 100%;">
        <div class="d-flex flex-row">
            <div><a href=""><img class="dp img-thumbnail"  src="images/PostImage.png" alt="..."></a></div>
            <div class="ms-2 mt-2"><a href=""><%= user.getUserName()%></a></div>
        </div>
        <div class = "PostCaption">
            <div class = "p ms-2">A beautiful scenery</div>
        </div>
        <img class ="card-img-top img-thumbnail" src="images/wallpaper-bliss-landscape-windows-xp-stock-4k-nature-nhvtxpop808oaye4.jpg" alt="picture">
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