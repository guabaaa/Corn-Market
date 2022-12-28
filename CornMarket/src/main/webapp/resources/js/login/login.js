function login(){
	let id = $("#user_id").val();
	let pw = $("#user_pw").val();
	
	if(id == ""){
		alert("아이디를 입력해주세요");
		user_id.focus();
		return false;
	}else if(pw == ""){
		alert("비밀번호를 입력해주세요");
		user_pw.focus();
		return false;
	}else{
		frm.submit();
	}
}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          