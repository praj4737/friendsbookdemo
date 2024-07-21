<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="uploadDp.css">
    <script src = "uploadDp.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <style>
      .col-centered {
  float: none;
  margin-right: auto;
  margin-left: auto;
}
    </style>
    <script>
      
    </script>
</head>
<body>
   <jsp:include page="header.jsp" />

    <!--upload post-->
    <!-- Modal -->
  <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Post A Picture </h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
          <form id="postForm" enctype="multipart/form-data">
        <div class="modal-body">
          <input type="file" name = "picFile" id="dpFile"  onchange="previewImage()">

          <div class="img">
            <input  name="caption" type="text" id="pictureCaption" class="form-control" placeholder="Say something about this photo..." style="visibility: hidden;">
            <img id="dpImage" class="img-thumbnail"  src="" alt="..." style="width: 200px;height: 200px;">
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
          <button type="submit" class="btn btn-primary" id="newPost">Post</button>
        </div>
        </form>
      </div>
    </div>
  </div>
    <!--Upload post - end-->


    <!--Post display-->
   

    <div id="post" class="d-flex flex-column align-items-center justify-content-center">
      
        
        <div class="card mt-3" style="width: 30rem;">
          <div class="card-header">
            <a href="#"><img src="usersDp/usrdp12.jpg" alt="User Profile" class="" width="40" height="40" style="float: left;border-radius: 30%;border: 1px solid black;"></a>
            <span class="ms-2">Username</span>
          </div>
          <img src="images/usrpost4.png" class="card-img-top" alt="..." style="width: 30rem;height: 20rem;">
          <div class="card-body">
            <div class = "d-flex flex-row">
              <div class = "">0 Likes</div>
              <div class = " ms-5">0 Comments</div>
             </div>
            <hr>
           <div class = "d-flex flex-row">
                <div class = ""><a href=""><i class = "material-icons">thumb_up</i></a></div>
                <div class = " ms-1">Like</div>
                <div class = " ms-5"><a href=""><i class = "material-icons">comment</i></a></div>
                <div class = " ms-1">comment</div>
               </div>
          </div>
        </div>
       
        <!--Tesing code-->
        <div class="card mt-3" style="width: 30rem;">
          <div class="card-header">
            <a href="#"><img src="usersDp/usrdp12.jpg" alt="User Profile" class="" width="40" height="40" style="float: left;border-radius: 30%;border: 1px solid black;"></a>
            <span class="ms-2">Username</span>
          </div>
          <img src="images/usrpost4.png" class="card-img-top" alt="..." style="width: 30rem;height: 20rem;">
          <div class="card-body">
            <div class = "d-flex flex-row">
              <div class = "">0 Likes</div>
              <div class = " ms-5">0 Comments</div>
             </div>
            <hr>
           <div class = "d-flex flex-row">
                <div class = ""><a href=""><i class = "material-icons">thumb_up</i></a></div>
                <div class = " ms-1">Like</div>
                <div class = " ms-5"><a href=""><i class = "material-icons">comment</i></a></div>
                <div class = " ms-1">comment</div>
               </div>
          </div>
        </div>

        
        <!--Tesing code-->

     
    </div>
  
<script src="HomePage.js"></script>
</body>
</html>