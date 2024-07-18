
function previewImage() {
    // Get the selected image file
    const imageFile = document.getElementById('dpFile').files[0];
    console.log(imageFile.name);

    // Check if a file is selected
    if (imageFile) {

        // Validate image type (optional)
        const allowedTypes = ['image/jpeg', 'image/png', 'image/gif'];
        if (!allowedTypes.includes(imageFile.type)) {
            alert('Please select a valid image file (JPEG, PNG, or GIF)');
            return;
        }

        // Create a FileReader object
        const reader = new FileReader();

        // Handle image load event
        reader.onload = function (e) {
            const imagePreview = document.getElementById('dpImage');
            imagePreview.src = e.target.result;
            document.getElementById("pictureCaption").style.visibility= "visible";
            // Enable the upload button (optional)
            document.querySelector('button').disabled = false;
        };

        // Read the image as a data URL
        reader.readAsDataURL(imageFile);
        
    }
}

function convertFormToJSON(form) {
    const array = $(form).serializeArray();
    const json = {};
    $.each(array, function() {
        json[this.name] = this.value || ""; // Assign field name as key and value as value
    });
    console.log(json);
    return json;
}
function isFormField(form){
    const array = $(form).serializeArray();
    var isValid=true;
    $.each(array, function() {
            if(!this.value.trim().length >0){
                isValid=false;

            }
        });
        return isValid;
}

      $(document).ready(function (){
       
          $("#postForm").submit(function (event){
              event.preventDefault();
              $.ajax({
                  type: 'POST',
                  url: "postupload",
                  data:new FormData(this),
                  processData: false,
                  contentType: false,
                  success: function (data) {
                      var response=$.parseJSON(data)
                      console.log(response);
                      if(!(response.status === '200')){
                          showErrorAlert(response.error);
                      }else if(response.status === '200'){
                          alert("post uploaded successfully.")
                      }
                  },
                  error: function (data) {
                      alert(data);
                      console.log(data);
                      alert("error");
                  }
              });
          });
      });


      $(window).scroll(function() {
    var windowHeight = $(window).height();
    var documentHeight = $(document).height();
    var scrollPosition = $(window).scrollTop();

    if (scrollPosition + windowHeight >= documentHeight) {
        // Display your message or perform any other action
        console.log("You've reached the end of the page!");
        $("#post").append('<div class="col-lg-6 text-white col-centered d-block p-2" >'
          +'<div class="card">'
            +'<div class="card-header">'
              +'<img src="usersDp/usrdp12.jpg" alt="User Profile" class="rounded-circle" width="40" height="40" style="float: left;">'
              +' <span class="ms-2">PRaj</span>'
              +' </div>'
              +' <div class="card-body">'
                +'  <h5 class="card-title">sdfghe treatment</h5>'
                +' <p class="card-text">'
                  +' <img src="images/PostImage.png" class="img-fluid" alt="..." style="max-width: 400px; max-height: 300px;">'

                  +'</p>'
                  +'<div class = "d-flex flex-row">'
                    +' <div class = "mt-2"><a href=""><i class = "material-icons">thumb_up</i></a></div>'
                    +'<div class = "mt-2 ms-1">Like</div>'
                    +'<div class = "mt-2 ms-4"><a href=""><i class = "material-icons">comment</i></a></div>'
                    +'<div class = "mt-2 ms-1">comment</div>'
                    +'<div class = "mt-2 ms-4"><a href=""><i class="material-icons">share</i></a></div>'
                    +'<div class = "mt-2 ms-1">Share</div>'
                    +'</div>'
                    +' </div>'
                    +'</div>'
                    +' </div>');

    }
});




