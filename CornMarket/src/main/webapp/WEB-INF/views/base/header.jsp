<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/main/index.css"/>
</head>
<body>
<header>
        <div class="header_logo">
            <a href="../main/index.jsp"><div class="header_img"></div></a>
        </div>
        <div class="header_search">
            <input type="text" placeholder="물품이나 동네를 찾아보세요">
            <button onclick="location.href='../login/login.jsp'">로그인</button>
        </div>
</header>
</body>
</html>