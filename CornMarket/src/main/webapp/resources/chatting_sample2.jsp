<%@ page contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <title>채팅 테스트</title>
    <style>
      #chatArea {
        width: 400px;
        height: 500px;
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
    <h3>채팅방</h3>
    <input type="button" id="exitBtn" value="나가기" />

    <h1>대화 영역</h1>
    <div id="chatArea">
      <div id="chatMessageArea">

      </div>
    </div>
    <br />
    <input type="text" id="message" />
    <input type="button" id="sendBtn" value="전송" />

    <input type="hidden" value="2" id="room_id" />
    <input type="hidden" value="<c:url value='/chatting/list/' />" id="chat_content_url" />
    <input type="hidden" value="fourkimm" id="user_id" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="${path}/resources/js/chatting/chatting_sample.js"></script>
  </body>
</html>