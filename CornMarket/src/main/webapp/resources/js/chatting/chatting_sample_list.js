//채팅방 생성 버튼 form submit
// 채팅방이 없는 경우 생성 후 이동
// 채팅방이 있으면 바로 이동
function createNewChatRoom() {
  $('#new_room_btn').click(() => {
    checkChatRoom();
  });
}
createNewChatRoom();

//판매글id와 구매자id(세션)로 채팅방 확인
function checkChatRoom() {
  let url = $('#chat_url').val();
  let post_id = $('#post_id').val();
  $.ajax({
    type: 'POST',
    url: url + 'check',
    data: post_id,
    success: function (data) {
      //조회 결과 없으면 0 있으면 방id 반환
      console.log(data);
      let check = data;
      if (check == 0) {
        alert('check 0');
        //채팅방 생성
        //chat_room_frm.submit();
      } else if (check != 0) {
        alert('check 0아님');
        //존재하는 채팅방으로 이동
        //location.href = url + check;
      }
    },
    error: function (data) {
      alert('error');
    },
  });
}
