<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Corn-Market 로그인</title>
<link rel="stylesheet" href="${path}/resources/css/login/login.css">
<script src="${path}/resources/js/login/login.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>
function a(){
	 
	
	window.location.href='/market/signup';
}
</script>

</head>
<body>
<jsp:include page="../base/header.jsp"/>
<jsp:include page="../base/nav.jsp"/>
<form name="frm" action="/market/login" method="POST">
	<div class="h2_st">
        <h2>로그인</h2>
    </div>
    <div class="login_wrap">
        <div class="login_first">
            <div class="login_main">아이디</div>
            <input type="text" id="id" name="user_id">
        </div>
        <div class="login_first">
            <div class="login_main">비밀번호</div>
            <input type="password" id="pw" name="user_pw">
        </div>
        <div class="login_second">
            <input type="checkbox" name="rememberMe">로그인 유지
            <a href="<c:url value='/account/id' />">아이디/비밀번호 찾기</a>
        </div>
        <div class="login_third">
            <button type="button" id="loginbtn">로그인</button>
            <button type="button" onclick="a();">회원가입</button>
        </div>
        <div class="login_fourth">
            <a href=""><div class="simple_login1"></div></a>
            <a href=""><div class="simple_login2"></div></a>
            <a href=""><div class="simple_login3"></div></a>
        </div>
    </div>
</form>
<jsp:include page="../base/footer.jsp"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
    	let loginUrl = "<c:url value='/member/login'/>";
    	let index2Url = "<c:url value='/main/after_login'/>";
    </script>
</body>
</html>