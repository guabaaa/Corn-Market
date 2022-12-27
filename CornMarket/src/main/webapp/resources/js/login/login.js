function login(){
	let id = $("#id").val();
	let pw = $("#pw").val();
	let idPw = {
    user_id: id,
    user_pw: pw,
  };
	
	if(id == ""){
		alert("아이디를 입력해주세요");
		$("#id").focus();
		return false;
	}else if(pw == ""){
		alert("비밀번호를 입력해주세요");
		$("#pw").focus();
		return false;
	}else{
		return true;
	}
	
	$.ajax({
    type: 'POST',
    url: loginUrl,
    headers: { 'content-type': 'application/json' }, 
    data: JSON.stringify(idPw),
    success: function (data) {
      console.log(data);
      if (data == 1) {
        location.href="index2Url";
      } else if (data == 0) {
		alert("아이디와 비밀번호를 확인하세요");
		location.href="loginUrl";
        check=false
     }
    },
    error: function (data) {
    },
  }); //ajax
}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          