// 나눔버튼 클릭시 0원으로 값 바뀜
$(document).ready(function () {
    $("#boardcheckbox").change(function () {
        if ($("#boardcheckbox").is(":checked")) {
            $("#inputonchange").val("0");
        }
    });

});

// input 태그 숨기고 label 선택시 파일업로드 창 실행하게 하기.

function getImageFiles(e) {
    const uploadFiles = [];
    const files = e.currentTarget.files;
    const imagePreview = document.querySelector('.image-preview');
    const docFrag = new DocumentFragment();
    console.log(typeof files, files);

    if ([...files].length >= 6) {
        alert('이미지는 최대 5개까지 업로드가 가능합니다.');
        return;
    }

    [...files].forEach(file => {
        if (!file.type.match("image/.*")) {
          alert('이미지 파일만 업로드가 가능합니다.');
          return
        }

    if ([...files].length < 6) {
        uploadFiles.push(file);
        const reader = new FileReader();
        reader.onload = (e) => {
          const preview = createElement(e, file);
          imagePreview.appendChild(preview);
        };
        reader.readAsDataURL(file);
      }
    });

}

function createElement(e, file) {
    const li = document.createElement('li');
    const img = document.createElement('img');
    img.setAttribute('src', e.target.result);
    img.setAttribute('data-file', file.name);
    li.appendChild(img);
    var name = document.getElementById('fileName');
    name.textContent = file.name;


    img.style.width = "700px";
    img.style.height = "300px";
    img.style.objectFit = "contain";

    return li;
    

}



const realUpload = document.querySelector('.real-upload');
const upload = document.querySelector('.upload');

//upload.addEventListener('click', () => realUpload.click());
realUpload.addEventListener('change', getImageFiles);



