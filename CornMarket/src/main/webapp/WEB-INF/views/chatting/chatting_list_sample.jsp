<%@ page contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <title>채팅 테스트</title>
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

	<a href='<c:url value="/chatting?room=1" />'>채팅방1</a> <br>
	<a href='<c:url value="/chatting?room=2" />'>채팅방2</a> <br>
	<a href='<c:url value="/chatting?room=3" />'>채팅방3</a> <br>
	<br>
	<input type="button" value="채팅방 생성" id="new_room_btn"> <br>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="${path}/resources/js/chatting/chatting_sample_list.js"></script>
  </body>
</html>
