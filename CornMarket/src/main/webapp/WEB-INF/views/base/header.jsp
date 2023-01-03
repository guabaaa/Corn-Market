<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/main/header.css" />
</head>
<body>
	<header class="header-wrap">
		<nav class="nav-wrap">
			<img class="nav-menu" id="menubtn"
				src="${path }/resources/images/header/menubtn.png" width="40px"
				height="40px" filter: invert(75%) sepia(54%) saturate(2306%)hue-rotate(2deg)brightness(110%)contrast(89%); >
			<input type="hidden" id="headerjs" value="${path }">
			<div class="nav-sidemenu" id="sidemenu">
				<li><a class="nav-active" href="">전체 카테고리</a></li>
				<li><a href="">전자기기</a></li>
				<li><a href="">가구,인테리어</a></li>
				<li><a href="">의류</a></li>
				<li><a href="">뷰티,미용</a></li>
				<li><a href="">취미,게임,음반</a></li>
				<li><a href="">반려동물용품</a></li>
			</div>
		</nav>
		<a class="header-img-wrap" href="<c:url value='/main' />"><img
			src="${path }/resources/images/header/logo.png" width="250px" height="120px"></a>
		<div class="header-search-wrap">
			<input class="searchbar" type="search" placeholder="물품이나 동네를 검색해보세요." />
			<img src="${path }/resources/images/header/searchbtn.png"
				width="40px" height="40px" />
		</div>
		<div class="header-icon-wrap">
			<div class="loginsignup-wrap">
				<c:if test="${sessionScope.id==null}">
					<!-- 로그인 안했을때 -->
					<a class="header-signup" onclick="location.href='${path}/signup'">SIGNUP</a>
					<p class="loginsignup-text">|</p>
					<a class="header-login" onclick="location.href='${path}/login'">LOGIN</a>
				</c:if>

				<c:if test="${sessionScope.id!=null}">
					<!-- 로그인 했을때 -->
					<a class="header-logout">LOGOUT</a>
				</c:if>
			</div>
			<div class="sellprochat-wrap">
				<a class="header-selling"> <img
					src="${path }/resources/images/header/sellingbtn.png" width="25px"
					height="25px" />
					<p class="header-selling-text">판매하기</p>
				</a>
				<p class="sellprochat-text">|</p>
				<a class="header-profile"
					onclick="location.href='<c:url value="/profile"/>'"> <img
					src="${path }/resources/images/header/profilebtn.png" width="25px"
					height="25px" />
					<p class="header-profile-text">내 정보</p>
				</a>
				<p class="sellprochat-text">|</p>
				<a class="header-chatting"> <img
					src="${path }/resources/images/header/chattingbtn.png" width="25px"
					height="25px" />
					<p class="header-chatting-text">채팅하기</p>
				</a>
			</div>
		</div>
	</header>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="${path}/resources/js/main/header.js"></script>

</body>
</html>