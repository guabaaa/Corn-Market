function save(){
	var haveto1 = $("#haveto1").is(":checked");
	var haveto2 = $("#haveto2").is(":checked");
	var haveto3 = $("#haveto3").is(":checked");
	
	let name = $("#member_name").val();
	let id = $("#member_id").val();
	let nm = $("#member_nm").val();
	let pw = $("#member_pw").val();
	let pwd = $("#member_pw_db").val();
	let email_f = $("#member_email_f").val();
	let email_s = $("#member_email_s").val();
	let phone = $("#member_ph").val();

	if(haveto1, haveto2, haveto3 == false){
		alert("필수약관에 동의해주세요");
		$("#haveto1").focus();
	} else if(name == ""){
		alert("이름을 입력하세요");
		$("#member_name").focus();
	} else if(id == ""){
		alert("아이디를 입력하세요");
		$("#member_id").focus();
	} else if(nm == ""){
		alert("닉네임을 입력하세요");
		$("#member_nm").focus();
	} else if(pw == ""){
		alert("비밀번호를 입력하세요");
		$("#member_pw").focus();
	} else if(pwd == ""){
		alert("비밀번호 확인 란을 입력하세요");
		$("#member_pw_db").focus();
	} else if(email_f == ""){
		alert("이메일을 입력하세요");
		$("#member_email_f").focus();
	} else if(email_s == ""){
		alert("이메일을 입력하세요");
		$("#member_email_s").focus();
	} else if(phone == ""){
		alert("전화번호를 입력하세요");
		$("#member_ph").focus();
	} else{
		alert("회원가입 성공");
	}
	
}

function mailcheck(){
	i = document.frm.mail.selectedIndex;
	var mailaddr = document.frm.mail.options[i].value;
	document.frm.mid.value = mailaddr;
}

let name = document.querySelector("#name");
let joinbtn = document.querySelector("#joinbtn");
let failmessage = document.querySelector(".fail_message")

joinbtn.disabled = true;

name.onkeyup = function(){
	if(name.value ==""){
		failmessage.classList.add("hide");
	}
}

/*id유효성체크
function id_dbcheck(){
	let id = $("#member_id").val();
	$.ajax({
    type: 'POST',
    url: ,
    headers: { 'content-type': 'application/json' }, 
    data: JSON.stringify(),
    success: function (data) {
      console.log(data);
      if (data == 0) {
        $('.error').show();
        document.getElementById("id_error").innerHTML = "중복된 아이디입니다."
        check=false;
      } else if (data == 1) {
      	$('.error').hide();
        alert("사용가능한 아이디입니다.");
     }
    },
    error: function (data) {
    },
  }); //ajax
}
*/

//비밀번호 중복확인
function pw_dbcheck(){
	let pw = $("#member_pw").val();
	let pwd = $("#member_pw_db").val();
	
	if(pw != '' && pwd != '') {
        if(pw == pwd) {
            document.getElementById("pw_error").innerHTML="비밀번호가 일치합니다.";
            document.getElementById("pw_error").style.color="blue";
        }
        else {
            document.getElementById("pw_error").innerHTML="비밀번호가 일치하지 않습니다.";
            document.getElementById("pw_error").style.color="red";
        }
    }
}