<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/chatting/chat_list.css" />

</head>
<body>
	<div class="popup-wrap">
		<div class="chatlist_wrap">
			<h2>CHATTING LIST</h2>
			<ul>
				<li>
					<img class="chat_profile"></img>
					<div class="chat_content_wrap" onclick="">
						<div class="chat_info">
							<div class="chat_nickname">닉네임</div>
							<div class="chat_town">마포구</div>
							<div class="chat_date">2022년 12월 12일</div>
						</div>
						<input type="hidden" id="chat_room_id" value="">
						<div class="chat_contents">안녕하세요!</div>
					</div>
					<div class="chat_delete" onclick=""></div>
				</li>
			</ul>
		</div>
	</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</body>
</html>