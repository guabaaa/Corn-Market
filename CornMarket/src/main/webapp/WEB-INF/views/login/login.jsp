<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/login/login.css">
<script src="${path}/resources/js/login/login.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<jsp:include page="../base/header.jsp"/>
<jsp:include page="../base/nav.jsp"/>
<form action="location.href='index.jsp'" onsubmit="return login()">
	<div class="h2_st">
        <h2>로그인</h2>
    </div>
    <div class="login_wrap">
        <div class="login_first">
            <div class="login_main">아이디</div>
            <input type="text" id="id">
        </div>
        <div class="login_first">
            <div class="login_main">비밀번호</div>
            <input type="password" id="pw">
        </div>
        <div class="login_second">
            <input type="checkbox">아이디 저장
            <a href="">아이디/비밀번호 찾기</a>
        </div>
        <div class="login_third">
            <button>로그인</button>
            <button onclick="location.href='../signup/signUp.jsp'">회원가입</button>
        </div>
        <div class="login_fourth">
            <a href=""><div class="simple_login1"></div></a>
            <a href=""><div class="simple_login2"></div></a>
            <a href=""><div class="simple_login3"></div></a>
        </div>
    </div>
</form>
<jsp:include page="../base/footer.jsp"/>
</body>
</html>