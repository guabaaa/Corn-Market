<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/main/header.css"/>
</head>
<body>
<header>

        <div class="header_logo">
            <a href="<c:url value='/main' />"><div class="header_img"></div></a>
        </div>
        <div class="header_search">
            <input type="text" placeholder="물품이나 동네를 찾아보세요">
	<c:if test="${sessionScope.id==null}">
            <button onclick="location.href='${path}/login'">로그인</button>
	</c:if>
    <c:if test="${sessionScope.id!=null}">
            <p class="main_nickname">${sessionScope.id}</p>
            <button onclick="location.href='<c:url value="/profile"/>'">프로필보기</button>
     </c:if>
        </div>
</header>
</body>
</html>