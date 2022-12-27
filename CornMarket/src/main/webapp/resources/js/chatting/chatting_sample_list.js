//채팅방 생성 버튼 form submit
// 채팅방이 없는 경우 생성 후 이동
// 채팅방이 있으면 바로 이동
function createNewChatRoom() {
  $('#new_room_btn').click(() => {});
}

//판매글id와 구매자id(세션)로 채팅방 확인
function checkChatRoom() {
  let url = $('#chat_url').val();
  let post_id = $('#post_id').val();
  $.ajax({
    type: 'POST',
    url: url + 'check',
    data: post_id,
    success: function (data) {
      //room_count 0이면 채팅방 없음, 1이면 채팅방 있음
      alert('check');
      let check = data;
      if (check.room_count == 0) {
        //채팅방 생성
        chat_room_frm.submit();
      } else if (check.room_count > 0) {
        //존재하는 채팅방으로 이동
        location.href = url + check.room_id;
      }
    },
    error: function (data) {
      alert('error');
    },
  });
}
