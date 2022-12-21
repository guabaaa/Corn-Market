function login(){
	let id = $("#id").val();
	let pw = $("#pw").val();
	
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
}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          