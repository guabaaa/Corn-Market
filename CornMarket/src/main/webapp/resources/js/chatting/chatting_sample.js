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
// 웹소켓 메시지 서버에 전송
function send() {
  var msg = $('#message').val(); //메시지 입력 input
  webSocket.send(msg); //서버로 전송
  $('#message').val(''); //입력창 초기화
  appendSendMessage(msg); //채팅창에 본인 메시지 추가
}

// 웹소켓 서버에 연결되었을 때 호출되는 이벤트
function onOpen(evt) {
  alert('연결되었습니다');
  console.log('웹소켓 서버에 연결되었을 때 호출되는 이벤트: ' + evt);
}
// 웹소켓 서버에서 메시지를 받았을 때 호출되는 이벤트
function onMessage(evt) {
  console.log('웹소켓 서버에서 메시지를 받았을 때 호출되는 이벤트: ' + evt);
  var data = evt.data;
  appendRecvMessage(data);
}
// 웹소켓 서버와 연결이 끊어졌을 때 호출되는 이벤트
function onClose(evt) {
  alert('연결을 끊었습니다');
  console.log('웹소켓 서버와 연결이 끊어졌을 때 호출되는 이벤트: ' + evt);
}

/*   HTML 추가 메소드   */
// 본인 메시지 채팅창에 추가
function appendSendMessage(msg) {
  $('#chatMessageArea').append("<div class='send' > " + msg + '</div>');
  scrollDown();
}
// 타인 메시지 채팅창에 추가
function appendRecvMessage(msg) {
  $('#chatMessageArea').append("<div class='recv'>" + msg + '</div>');
  scrollDown();
}
// 스크롤 맨밑으로
function scrollDown() {
  var chatAreaHeight = $('#chatArea').height(); //채팅창 틀
  var maxScroll = $('#chatMessageArea').height() - chatAreaHeight;
  $('#chatArea').scrollTop(maxScroll); //숫자가 높을수록 스크롤 제일 아래
}

/*   이벤트 관련 메소드   */
// 입장버튼 클릭 (채팅방 입장)
function enterChattingRoom() {
  $('#enterBtn').click(function () {
    connect(); //웹소켓 연결
  });
}
// 메시지 전송 - 입력창 Enter키
function enterKey() {
  $('#message').keypress(function (event) {
    var keycode = event.keyCode;
    if (keycode == '13') send(); //메시지 전송
    event.stopPropagation(); // 상위로 이벤트 전파 막음
  });
}
// 메시지 전송 - 전송버튼 클릭
function clickSendBtn() {
  $('#sendBtn').click(function () {
    send(); //메시지 전송
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
  enterChattingRoom();
  enterKey();
  clickSendBtn();
  clickOutBtn();
});
