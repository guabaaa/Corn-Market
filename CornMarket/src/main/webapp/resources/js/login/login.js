function login(){

	let id = $('#user_id').val();
    let pw = $('#user_pw').val();

    if (id == '') {
      alert('아이디를 입력해주세요');
      $('#user_id').focus();
      return false;
    } else if (pw == '') {
      alert('비밀번호를 입력해주세요');
      $('#user_pw').focus();
      return false;
    } else {
      right_login();
      frm.submit();
    }
}

function right_login(){
	
	let id = $("#id").val();
	let pw = $("#pw").val();
	let member = {
	    	user_id: id,
	    	user_pw: pw,
	    };
	   
	$.ajax({
    type: 'POST',
    url: '/market/login',
    headers: { 'content-type': 'application/json' }, 
    data: JSON.stringify(member),
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
  }); 
  
}

