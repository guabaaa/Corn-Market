<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>채팅 - g누나</title>
    <link rel="stylesheet" href="${path}/resources/css/chatting/popup_chat.css" />
  </head>
  <body>
    <div class="container">
      <div class="popup-wrap" id="popup">
        <div class="popup">
          <div class="popup-head">
            <span class="head-title">CHATTING ROOM</span>
          </div>
          <div class="popup-body">
            <div class="body-content">
              <div class="body-titlebox">
                <div class="titlebox1">
                  <img class="chat_profile" src="${path}/resources/images/profile/profile_img_default.png"  onclick="window.opener.location.href='${path}/profile'"/>
                  <p>g누나</p>
                  <input type="button" class="chatlist_btn" value="채팅목록" onclick="location.href='<c:url value="/chatting/list"/>'"/>
                </div>
                <div class="titlebox2" onclick=" window.opener.location.href='<c:url value="/post/100249"/>'">
                  <img class="chat_object" src="${path}/resources/images/post/post_img_09.jpeg"></img>
                  <div class="titlebox2-2">
                    <p>한율 토너 나눔해요</p>
                    <p>0원</p>
                  </div>
                </div>
              </div>
              <div id="chatArea">
                <div class="body-contentbox" id="chatMessageArea">
                
                </div>
              </div>
            </div>
          </div>
          <div class="popup-foot">
          <c:set var="sellid" value="gggg"></c:set>
          <c:set var="id" value="gggg"></c:set>
          <c:if test="${sellid == id}">
            <input type="button" value="거래완료" class="deal_end" id="deal_end" />
          </c:if>
            <input type="text" class="chatting" id="message" />
            <input type="button" value="입력" class="chat_send" id="sendBtn" name="send" />
          </div>
        </div>
      </div>
    </div>

	  <input type="hidden" value="gggg" id="seller_id" />
	  <input type="hidden" value="CH" id="nickname" />
	  <input type="hidden" value="100249" id="post_id" />
	  <input type="hidden" value="1ee1d151-e2ab-4b97-ae25-8a885167a91a" id="room_id" />
    <input type="hidden" value="<c:url value='/review/post-end'/>" id="dealEndUrl" />
    <input type="hidden" value="<c:url value='/review'/>" id="reviewUrl" />
    <input type="hidden" value="<c:url value='/chatting/list/' />" id="chat_content_url" />
    <input type="hidden" value="gggg" id="user_id" />
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="${path}/resources/chatting_test.js"></script>
  </body>
</html>
