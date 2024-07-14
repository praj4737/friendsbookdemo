document.body.onload = setUser;
function setUser(){
    console.log("hy");
    var usrData = getUserData();
    var user = JsonToObjectConverter(usrData);

    var username = user.name;

    this.document.getElementById("username").innerHTML = username;
}


async function getUserData(){
    var usrData;
    var xhr = new XMLHttpRequest();
    xhr.open("POST","http://localhost:8080/friendsbook/login",true);
    xhr.setRequestHeader('Content-Type','application/json ; charset = UTF-8');
    xhr.onreadystatechange = function(){
        if(xhr.readyState === 4 && xhr.status === 200){
             usrData = xhr.responseText;
             console.log(usrData);

        }
    };
    xhr.send();

    return usrData;
}

function JsonToObjectConverter(data)
{
    var obj = JSON.parse(data);

    return obj;

}

function previewImage() {
    // Get the selected image file
    const imageFile = document.getElementById('dpFile').files[0];

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

var firstTime = true

function createElement(){

    const originalElement = document.querySelector("#postcard");
    const cloneElement = originalElement.cloneNode(true);
    originalElement.after(cloneElement);

}
     

function setPost(data){
    console.log("reached on setPost");
    console.log("fine till here");
    // setPost(data);
     var s = JSON.parse(data);
     var postCaption = document.getElementById("postCaption");
     var postImage = document.getElementById("postImage");
     var likes = document.getElementById("likes");
     var comments = document.getElementById("comments");
     var shares = document.getElementById("shares");
 
     postCaption.innerHTML = s.caption;
     postImage.src = "images/PostImage.png";
     console.log(s.image);
     likes.innerHTML = s.likes;
     comments.innerHTML = s.comments;
     shares.innerHTML = s.shares;
   
}

// Usage:




