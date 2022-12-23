
function mailBtnClick() {
    $('#mailBtn').click(() => {
        const memberEmail = $('#memberEmail').val();
        console.log('이메일 주소 : ' + email);
        const codeNum = $('#codeNum');

        $.ajax({
            type: 'GET',
            url: '<c:url value="/account/mail-check?email=" />' + email,
            success: function (data) {
                console.log(data);
                codeNum.attr('disabled', false);
                code = data;
                alert('인증번호가 전송되었습니다.');
            }
        })
    })
}

function codenumshow() {
    $('#code-show-input').show();
}
function searchdisplayhp() {
    if ($('.search-type-display-hp').css('display') == 'none') {
        $('.search-type-display-hp').show();
    } else {
        $('.search-type-display-hp').hide();
    }
}
function searchdisplayemail() {
    if ($('.search-type-display-email').css('display') == 'none') {
        $('.search-type-display-email').show();
    } else {
        $('.search-type-display-email').hide();
    }
}

// timer
var time = 600;
var min = "";
var sec = "";

var x = setInterval(function () {
    min = parseInt(time / 60);
    sec = time % 60;

    document.getElementById("code-timer").innerHTML = min + "분" + sec + "초";
    time--;

    if (time < 0) {
        clearInterval(x);
        document.getElementById("code-timer").innerHTML = "시간초과";
    }
}, 1000);



//errormessage

function idpopup() {
    let name = document.getElementById("memberNm1").value
    let hp = document.getElementById("memberHp").value
    let id = document.getElementById("conInput").value
    if( name ===""){
        document.getElementById("nameerror").innerHTML = "이름이 올바르지 않습니다."
        check = false
    }else{
        document.getElementById("nameerror").innerHTML = ""
    }
    
    if(hp ===""){
        document.getElementById("hperror").innerHTML = "휴대폰 번호가 올바르지 않습니다."
        check=false
    }else{
        document.getElementById("hperror").innerHTML = ""
    }

    if(id ===""){
        document.getElementById("iderror").innerHTML = "아이디가 올바르지 않습니다."
        check=false
    }else{
        document.getElementById("iderror").innerHTML = ""
    }
}