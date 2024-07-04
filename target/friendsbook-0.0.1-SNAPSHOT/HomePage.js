
function isScrolledToBottom() {
    const scrollPosition = window.scrollY;
    const windowHeight = window.innerHeight;
    const documentHeight = document.body.scrollHeight;
  
    return (scrollPosition + windowHeight) >= document.body.scrollHeight;
  }
  
  // Usage:
  $(document).ready(() => {
    // Similar logic as option 1 here
    const isAtBottom = isScrolledToBottom();
    if (isAtBottom) {
      console.log("You've reached the bottom of the page on load!");
      // Trigger action for initial content at bottom
    }
  
    $(window).scroll(() => {
      const isAtBottom = isScrolledToBottom();
      if (isAtBottom) {
        console.log("You've scrolled to the bottom of the page!");
        // Trigger action for newly loaded content
      }
    });
  });

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

