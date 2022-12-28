<%@ page contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <title>채팅</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript">
      var webSocket;

      function connect() {
        webSocket = new WebSocket('ws://localhost:8090/market/chat');

        webSocket.onopen = onOpen;
        webSocket.onmessage = onMessage;
        webSocket.onclose = onClose;
      }

      function disconnect() {
        webSocket.close();
      }

      //연결
      function onOpen(evt) {
        //  appendMessage("연결되었습니다.");
        alert('연결되었습니다');
      }

      //메시지 전송
      //메시지를 소켓서버로 보냄
      function send() {
        var nickname = $('#nickname').val();
        var msg = $('#message').val();
        webSocket.send(nickname + ':' + msg); //서버로 전송
        $('#message').val(''); //입력창 초기화
        appendSendMessage(msg); //채팅창에 자신이 쓴 메시지 추가
      }
      //보내는 메시지 채팅창에 추가
      function appendSendMessage(msg) {
        $('#chatMessageArea').append("<div class='send' > " + msg + '</div>');
        scrollDown();
      }

      //메시지 받기
      //서버에서 메시지를 받았을 때
      function onMessage(evt) {
        var data = evt.data;
        appendRecvMessage(data);
        //if (data.substring(0, 4) == 'msg:') {
        //appendRecvMessage(data.substring(4));
        //}
      }
      //받는 메시지 채팅창에 추가
      function appendRecvMessage(msg) {
        $('#chatMessageArea').append("<div class='recv'>" + msg + '</div>');
        scrollDown();
      }

      //스크롤 맨밑으로
      function scrollDown() {
        var chatAreaHeight = $('#chatArea').height();
        var maxScroll = $('#chatMessageArea').height() - chatAreaHeight;
        $('#chatArea').scrollTop(maxScroll); //숫자가 높을수록 스크롤 제일 아래
      }

      //연결 끊어짐
      function onClose(evt) {
        // appendMessage("연결을 끊었습니다.");
        alert('연결을 끊었습니다');
      }

      $(document).ready(function () {
        $('#message').keypress(function (event) {
          var keycode = event.keyCode;
          if (keycode == '13') {
            //엔터 입력
            send();
          }
          event.stopPropagation(); // 상위로 이벤트 전파 막음
        });

        $('#sendBtn').click(function () {
          //전송버튼 클릭
          send(); //메시지 전송
        });
        $('#enterBtn').click(function () {
          //입장버튼 클릭
          connect(); //소켓 연결
        });
        $('#exitBtn').click(function () {
          //나가기버튼 클릭
          disconnect(); //소켓 연결 끊기
        });
      });
    </script>
    <style>
      #chatArea {
        width: 200px;
        height: 100px;
        overflow-y: auto;
        border: 1px solid black;
      }

      .send {
        border: 1px solid green;
        text-align: right;
        padding: 10px;
      }

      .recv {
        border: 1px solid yellow;
        color: blue;
        text-align: left;
        padding: 10px;
      }
    </style>
  </head>
  <body>
    이름:<input type="text" id="nickname" />
    <input type="button" id="enterBtn" value="입장" />
    <input type="button" id="exitBtn" value="나가기" />

    <h1>대화 영역</h1>
    <div id="chatArea"><div id="chatMessageArea"></div></div>
    <br />
    <input type="text" id="message" />
    <input type="button" id="sendBtn" value="전송" />
  </body>
</html>
