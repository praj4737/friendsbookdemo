
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>make friends</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    
    <!--icons CDN-->
    
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
   
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <link rel="stylesheet" href="makefriends.css">
</head>
<body>

<jsp:include page="header.jsp" />
<h2>Friends Requests</h2><hr>
<div class="container mt-5 overflow-auto " style="width:100%; max-height:23rem;">

<div class="row justify-content-center" id="friend-requets">

  <div class="col-sm-2 ms-2 mt-2" style="width: 15rem;">
    <div class = "card " style="width: 15rem;">
      <img class = "card-img-top" src="images/PostImage.png" alt="...">
      <div class="card-body">
        <h5 class="card-title">Name</h5>
        <p class="card-text">Friends</p>
        <button class = "btn btn-primary">Confirm</button>
        <button class="btn btn-secondary">Delete</button>
      </div>
   </div>
  </div>

  
<!--akhfcidhfew-->

 </div>
</div>
<!--div ending-->


<!--People you may know-->
 <h2>People You may know</h2><hr>
<div class="container mt-5 overflow-auto" style="width:100%; max-height:23rem;">

  <!--
  
  -->
<div class="row justify-content-center" id="friends">

    <div class="col-sm-2 ms-2 mt-2" style="width: 15rem;">
    <div class = "card " style="width: 15rem;">
      <img class = "card-img-top" src="images/PostImage.png" alt="...">
      <div class="card-body">
        <h5 class="card-title">Name</h5>
        <p class="card-text">Friends</p>
        <button class = "btn btn-primary">Add friend</button>
        <button class="btn btn-secondary">Remove</button>
      </div>
   </div>
  </div>
  
</div>

</div>



<!--people you may know ends...-->
    
      <script src="makefriends.js"></script>
</body>
</html>