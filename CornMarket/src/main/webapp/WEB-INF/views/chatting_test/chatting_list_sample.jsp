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
    <form action="<c:url value='/chatting/list'/>" id="frm" method="post" name="chat_room_frm">
      <c:forEach var="room" items="${list}" varStatus="st">
        <a href='<c:url value="/chatting/list/${room.room_id}" />'>채팅방 - ${room.other_nickname}</a> <br />
      </c:forEach>
      <input type="hidden" value="100061" id="post_id" name="post_id" />
      <input type="button" value="채팅방 생성" id="new_room_btn" /> <br />
    </form>

    <input type="hidden" value="<c:url value='/chatting/list/' />" id="chat_url" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="${path}/resources/js/chatting/chatting_sample_list.js"></script>
  </body>
</html>
