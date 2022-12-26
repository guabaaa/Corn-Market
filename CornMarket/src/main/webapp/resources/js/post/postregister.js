$(document).ready(function(){
    $("#boardcheckbox").change(function(){         
            if($("#boardcheckbox").is(":checked")){ 
               $("#inputonchange").val("0"); 
            }
        });
    
    
    });
    
function loadFile(input) {
    var file = input.files[0];

    var name = document.getElementById('fileName');
    name.textContent = file.name;

    var newImage = document.createElement("img");
    newImage.setAttribute("class", 'img');

    newImage.src = URL.createObjectURL(file);

    newImage.style.width = "70%";
    newImage.style.height = "70%";
    newImage.style.visibility = "hidden";   //버튼을 누르기 전까지는 이미지를 숨긴다
    newImage.style.objectFit = "contain";

    var container = document.getElementById('image-show');
    container.appendChild(newImage);
};

var submit = document.getElementById('submitButton');
submit.onclick = showImage;    

function showImage() {
    var newImage = document.getElementById('image-show').lastElementChild;

    
    newImage.style.visibility = "visible";


    document.getElementById('image-upload').style.visibility = 'hidden';

    document.getElementById('fileName').textContent = null; 
}