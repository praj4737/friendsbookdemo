var firstTime = true

function createElement(){

    const originalElement = document.querySelector("#postcard");
    const cloneElement = originalElement.cloneNode(true);
    originalElement.after(cloneElement);

}
     
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
    createElement();

}
});
});

async function sendInfo(){
    var name = document.getElementById("name").value;
    // preparing object
    const data = {
        personName : name    
    };

    var xhr = new XMLHttpRequest();
    console.log("reached here")
    xhr.open("POST","http://localhost:8080/Ajax/test",true)
    xhr.setRequestHeader('Content-Type','application/json ; charset = UTF-8')
    xhr.onreadystatechange = function(){
        if(xhr.readyState === 4 && xhr.status === 200){
            console.log("hello welcome")
            document.getElementById("greet").innerHTML = xhr.responseText;
            
        }
    };
    xhr.send(JSON.stringify(data));

}