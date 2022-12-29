<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/main/header_nickname.css"/>
</head>
<body>
<header>
        <div class="header_logo">
            <a href="<c:url value='/main/after_login' />"><div class="header_img"></div></a>
        </div>
        <div class="header_search">
            <input type="text" placeholder="물품이나 동네를 찾아보세요">
            <p class="main_nickname">${sessionScope.id}</p>
            <button class="btn1" onclick="location.href='<c:url value="/profile"/>'">프로필</button>
            <button class="btn2" onclick="location.href='<c:url value="/logout"/>'">로그아웃</button>
        </div>
</header>
</body>
</html>