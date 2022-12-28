//닉네임 받아오기
let nickname = opener.document.getElementById('nickname').value;
$('#rv_nickname').text(nickname);
let room_id = opener.document.getElementById('room_id').value;
$('#room_id').val(room_id);

//폼 유효성 체크
function checkForm() {
  frm.submit();
  closePopup();
}
//완료후 창닫기
function closePopup() {
  let url = $('#chatUrl').val();
  window.opener.location.href = url + room_id; //부모창 이동 url
  self.close();
}
