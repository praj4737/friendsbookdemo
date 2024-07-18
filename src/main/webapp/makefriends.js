$(document).ready(function() {
  // Your code here
  $(window).scroll(function() {
    var windowHeight = $(window).height();
    var documentHeight = $(document).height();
    var scrollTop = $(window).scrollTop();
  
   /* $.ajax({
      type: 'POST',
      url: "addfriends",
      success: function (data) {
        console.log(data);
        data.forEach(item => {
          if (elementCount < 5) {

            $("#friends").append('<div class="col-sm-2 ms-2 mt-2" style="width: 15rem;">'+
              ' <div class = "card " style="width: 15rem;">'+
               '<img class = "card-img-top" src="images/PostImage.png" alt="...">'+
               '<div class="card-body">'+
                   '<h5 class="card-title">Name</h5>'+
                   '<p class="card-text">Friends</p>'+
                   '<button class = "btn btn-primary">Add friend</button>'+
                   '<button class="btn btn-secondary">Remove</button>'+
                   '</div>'+
                   '</div>'+
                   '</div>');

            elementCount++;
          }
        });
      },
      error: function (data) {
          alert(data);
          console.log(data);
          alert("error");
      }
  });*/


  });
});



