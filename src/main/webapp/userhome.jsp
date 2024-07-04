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
        $(document).ready(function(){
          $("#newPost").click(function(){
            $.post("url ",
                {
                  name: "Donald Duck",
                  city: "Duckburg"
                },
                function(data,status){
                  alert("Data: " + data + "\nStatus: " + status);
                });
          });

        });
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
          <button type="button" class="btn btn-primary" id="newPost">Post</button>
        </div>
        </form>
      </div>
    </div>
  </div>
    <!--Upload post - end-->


    <!--Post display-->
   <div class="container-fluid mt-3">
    
    <div class="container-fluid">
      <div class="col">
        <!--Post 1 start-->
        <div class="col-lg-6 text-white col-centered d-block p-2" >
          <div class="card">
            <div class="card-header">
              <img src="usersDp/usrdp12.jpg" alt="User Profile" class="rounded-circle" width="40" height="40" style="float: left;">
              <span class="ms-2">PRaj</span>
            </div>
            <div class="card-body">
              <h5 class="card-title">sdfghe treatment</h5>
              <p class="card-text">
                <img src="images/PostImage.png" class="img-fluid" alt="..." style="max-width: 400px; max-height: 300px;">
                
              </p>
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
        <!--Post 1 end-->
        
        
        
      </div>
    </div>
  </div>

</body>
</html>