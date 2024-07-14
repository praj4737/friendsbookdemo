window.addEventListener('load',function(){
    loadFriends();
for (var i=0;i<10;i++){
    createElement();
}

});

async function loadFriends(){
    var xhr = new XMLHttpRequest();
    xhr.open("POST","http://localhost:8080/friendsbook/loadfriends",true);
    xhr.setRequestHeader('Content-Type','application/json ; charset = UTF-8')
    console.log("reacgeed here v1")
    xhr.onreadystatechange = function(){
        if (xhr.readyState === 4 && xhr.status === 200){
            var data = xhr.responseText;
            console.log("reached here2")
            console.log(data);
        }
    };
    xhr.send();
}


function createElement(){

    const originalElement = document.querySelector("#friendsRequestElement");
    const cloneElement = originalElement.cloneNode(true);
    originalElement.after(cloneElement);

}

    