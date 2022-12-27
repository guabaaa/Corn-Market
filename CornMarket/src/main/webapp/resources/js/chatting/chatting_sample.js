// 웹소켓 연결
var webSocket;
function connect() {
  webSocket = new WebSocket('ws://localhost:8090/market/chat');

  webSocket.onopen = onOpen;
  webSocket.onmessage = onMessage;
  webSocket.onclose = onClose;
}
// 웹소켓 연결 끊기
function disconnect() {
  webSocket.close();
}
// 메시지 전송
function sendMsg() {
  send('send_msg');
  ajaxChatContent(); //DB에 저장
  $('#message').val(''); //입력창 초기화
}
// 웹소켓에 데이터 전송
function send(type) {
  let room = $('#room_id').val();
  let id = $('#user_id').val();
  var msg = $('#message').val(); //메시지 입력 input
  let chattingContent = {
    type: type, // 'enter':웹소켓 연결시, 'send_msg':메시지 전송시, 'out':웹소켓 끊어질시
    room_id: room,
    sender_id: id,
    chat_content: msg,
  };
  webSocket.send(JSON.stringify(chattingContent)); //웹소켓 서버로 JSON 전송
}

// 웹소켓 서버에 연결되었을 때 호출되는 이벤트
function onOpen(evt) {
  send('enter');
  alert('연결되었습니다');
}
// 웹소켓 서버에서 메시지를 받았을 때 호출되는 이벤트
function onMessage(evt) {
  let id = $('#user_id').val();
  var data = JSON.parse(evt.data); //JSON -> 객체
  if (data.sender_id == id) {
    //본인 메시지
    appendSendMessage(data.chat_content);
  } else {
    //타인 메시지
    appendRecvMessage(data.chat_content);
  }
}
// 웹소켓 서버와 연결이 끊어졌을 때 호출되는 이벤트
function onClose(evt) {
  send('out');
  alert('연결을 끊었습니다');
}

/*   HTML 추가 메소드   */
// 본인 메시지 채팅창에 추가
function appendSendMessage(msg) {
  let time = showTime();
  $('#chatMessageArea').append(
    '<div class="send" > <sapn class="time">' + time + '</sapn> <span class="msg">' + msg + '</span> </div>'
  );
  scrollDown();
}
// 타인 메시지 채팅창에 추가
function appendRecvMessage(msg) {
  let time = showTime();
  $('#chatMessageArea').append(
    '<div class="recv"> <sapn class="msg">' + msg + '</sapn> <span class="time">' + time + '</span> </div>'
  );
  scrollDown();
}
//현재시간 표시
function showTime() {
  let today = new Date();
  let hours = ('0' + today.getHours()).slice(-2);
  let minutes = ('0' + today.getMinutes()).slice(-2);
  let time = hours + ':' + minutes;
  return time;
}
//현재날짜 표시
function showDate() {
  let today = new Date();
  let day = today.getFullYear() + '년 ' + (today.getMonth() + 1) + '월 ' + today.getDate() + '일';
  return day;
}
// 스크롤 맨밑으로
function scrollDown() {
  var chatAreaHeight = $('#chatArea').height(); //채팅창 틀
  var maxScroll = $('#chatMessageArea').height() - chatAreaHeight;
  $('#chatArea').scrollTop(maxScroll); //숫자가 높을수록 스크롤 제일 아래
}

/*   이벤트 관련 메소드   */

// 메시지 전송 - 입력창 Enter키
function enterKey() {
  $('#message').keypress(function (event) {
    var keycode = event.keyCode;
    if (keycode == '13') sendMsg(); //메시지 전송
    event.stopPropagation(); // 상위로 이벤트 전파 막음
  });
}
// 메시지 전송 - 전송버튼 클릭
function clickSendBtn() {
  $('#sendBtn').click(function () {
    sendMsg(); //메시지 전송
  });
}
// 나가기버튼 클릭 (테스트용)
function clickOutBtn() {
  $('#exitBtn').click(function () {
    disconnect(); //웹소켓 연결 끊기
  });
}

//페이지 로드 시
$(document).ready(() => {
  connect(); //페이지 로드시 채팅방 접속
  enterKey();
  clickSendBtn();
  clickOutBtn();
  scrollDown();
});

//ajax - 보내는 메시지 DB에 전송
function ajaxChatContent() {
  alert('DB test');
  let url = $('#chat_content_url').val();
  let room = $('#room_id').val();
  let id = $('#user_id').val();
  var msg = $('#message').val(); //메시지 입력 input
  let chattingContent = {
    room_id: room,
    sender_id: id,
    chat_content: msg,
  };
  $.ajax({
    type: 'POST',
    url: url + room,
    headers: { 'content-type': 'application/json' },
    data: JSON.stringify(chattingContent),
    success: function () {
      alert('채팅 내용 전송');
    },
    error: function () {
      alert('error');
    },
  });
}
