function save(){
	var haveto1 = $("#haveto1").is(":checked");
	var haveto2 = $("#haveto2").is(":checked");
	var haveto3 = $("#haveto3").is(":checked");

	if(haveto1, haveto2, haveto3 == false){
		alert("필수약관에 동의해주세요");
		$("#haveto1").focus();
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