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
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="${path}/resources/js/login/login.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>
	function a() {
		window.location.href = '/market/signup';
	}
</script>

<script>

<!-- 카카오 스크립트-->
Kakao.init('3617a988a010320e26dd65909b80af5d'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그인
function kakaoLogin() {
    Kakao.Auth.login({
    scope : 'profile_nickname, account_email'
      success: function (authObj) {
    	  //console.log(autObj)
        	Kakao.API.request({
          	url: '/v2/user/me',
         	 success: res => {
          	
         		  const id = res. authObj.id;
         		  const nickname = res.profile_ninkname;
         		  const email = res.kakao_account.email;
          
        	
        	
    })
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

					<!-- 카카오 로그인 -->
					<a class="p-2" href="https://kauth.kakao.com/oauth/authorize?client_id=d2d3eda3457799ca1d69cf37f8cbfaf8&redirect_uri=http://localhost:8188/market/kakaoLogin&response_type=code">
				     <img src="/resources/style/kakao_login_medium_narrow.png" style="height:60px">
				
					</a>

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
