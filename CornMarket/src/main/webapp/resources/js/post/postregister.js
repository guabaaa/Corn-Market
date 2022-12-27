$(document).ready(function () {
    $("#boardcheckbox").change(function () {
        if ($("#boardcheckbox").is(":checked")) {
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

    newImage.style.width = "700px";
    newImage.style.height = "300px";
    //newImage.style.visibility = "hidden";
    newImage.style.objectFit = "contain";


    var container = document.getElementById('image-show');
    container.appendChild(newImage);
};





let imgNames=[];

        let next=0;
        let prev=0;

        // 사진 넘어가는 버튼
        function nextImg(){
            let gallery = document.querySelector(".image-show");       // 이미지태그
            gallery.src=imgNames[next];
            next++;
            next = next % imgNames.length;
            gallery.style.backgroundImage="url('"+imgNames[next] + "')";
            gallery.style.backgroundPosition="center";
            gallery.style.backgroundSize="cover";
        }

        // 이전 사진으로 돌리는 버튼
        function prevImg(){
            let gallery = document.querySelector(".image-show");
            gallery.src=imgNames[prev];
            prev = prev % imgNames.length;
            prev--;
            if( prev <0){
                prev =  imgNames.length-1;
            }
            gallery.style.backgroundImage="url('"+imgNames[prev] + "')";
            gallery.style.backgroundPosition="center";
            gallery.style.backgroundSize="cover";
        }