
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

    

      $(document).ready(function(){
        var offset =0;
        var loading = false;
        $(window).on('scroll', function() {
            var windowHeight = $(window).height();
            var documentHeight = $(document).height();
            var scrollPosition = $(window).scrollTop();
    
            if (scrollPosition + windowHeight >= documentHeight - 100) { 
               
                if (loading) return;
                loading = true;

                $.ajax({

                    type: 'POST',
                    url: "fetchpost",
                    data: {offset: offset},
                    success: function (data) {
                       var response = JSON.parse(data);
                       var items = JSON.parse(response.data);
                       console.log(items);
                        if(items.length>0){
                           items.forEach(item => {
                    
              
                        $("#post").append('<div class="card mt-3" style="width: 30rem;">'+
                            '<div class="card-header">'+
                              '<a href="#"><img src="" alt="User Profile" class="" width="40" height="40" style="float: left;border-radius: 30%;border: 1px solid black;"></a>'+
                              '<span class="ms-2">'+item.username+'</span>'+
                            '</div>'+
                            '<img src="'+item.image+'" class="card-img-top" alt="..." style="width: 30rem;height: 20rem;">'+
                            '<div class="card-body">'+
                              '<div class = "d-flex flex-row">'+
                                '<div class = "">'+item.likes+' Likes</div>'+
                                '<div class = " ms-5">'+item.comments+' comments</div>'+
                               '</div>'+
                              '<hr>'+
                             '<div class = "d-flex flex-row">'+
                                  '<div class = ""><a href=""><i class = "material-icons">thumb_up</i></a></div>'+
                                 ' <div class = " ms-1">Like</div>'+
                                  '<div class = " ms-5"><a href=""><i class = "material-icons">comment</i></a></div>'+
                                  '<div class = " ms-1">comment</div>'+
                                 '</div>'+
                            '</div>'+
                          '</div>');
              
                       
                       
                      });
                      offset+=10;
                      loading = false;
                    }else{
                        $(window).off('scroll');
                    }
                    },
                    error: function (data) {
                        alert(data);
                        console.log(data);
                        loading = false;
                    }
                });
            
            }
        });
        
      });




