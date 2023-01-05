<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Corn-Market 로그인</title>
<link rel="stylesheet" href="${path}/resources/css/login/login.css" />

<script src="${path}/resources/js/login/login.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>
	function a() {
		window.location.href = '/market/signup';
	}
</script>
</head>
<body>
	<jsp:include page="../base/header.jsp" />
	<section>
		<form name="frm" action="/market/login" method="POST">
			<div class="h2_st">
				<h2>로그인</h2>
			</div>
			<div class="login_wrap">
				<div class="login_first">
					<div class="login_main">아이디</div>
					<input type="text" id="user_id" name="user_id" />
				</div>
				<div class="login_first">
					<div class="login_main">비밀번호</div>
					<input type="password" id="user_pw" name="user_pw" />
				</div>
				<div class="login_second">
					<input class="login_checkbox" type="checkbox" />아이디 저장 <a
						href="<c:url value='/account/id' />">아이디/비밀번호 찾기</a>
				</div>
				<div class="login_third">
					<button type="button" id="loginbtn" onclick="login()">로그인</button>
					<button type="button" onclick="location.href='${path}/signup'">회원가입</button>
				</div>
				<div class="login_fourth">
					<a class="naver-wrap" href="">
					  <img src="${path}/resources/images/style/naver_login_btn.png" class="simple_login2 login-btn">
					  <span>네이버 로그인</span>
					</a> 
					<a class="kakao-wrap" href=""><img src="${path}/resources/images/style/kakao_login_btn.png" class="simple_login1 login-btn"></a>
					<a class="google-wrap" href="">
					  <img src="${path}/resources/images/style/google_login_btn.png" class="simple_login3 login-btn">
					  <span>구글 로그인</span>
					</a> 
					  <div class="google-box">
					  </div>
				</div>
			</div>
		</form>
	</section>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="${path}/resources/js/login/login.js"></script>
	<script type="text/javascript">
		let loginUrl = "<c:url value='/member/login'/>";
		let index2Url = "<c:url value='/main/index2'/>";
	</script>
	<jsp:include page="../base/footer.jsp" />
</body>
</html>
