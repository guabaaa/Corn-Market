<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/chat/chat_list.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<form name="frm">
	<div class="chatlist_wrap">
		<h2>CHATTING LIST</h2>
		<ul>
			<li>
				<div class="chat_profile"></div>
				<div class="chat_nickname">${profile.nickname}</div>
				<div class="chat_contents">안녕하세요!</div>
				<div class="chat_delete" onclick=""></div>
			</li>
		</ul>
	</div>
</form>
</body>
</html>