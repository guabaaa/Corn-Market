<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/profile/other_profile.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
        .review{
            background-color: rgb(241, 196, 15);
        }
        .review a{
            color:white;
        }
</style>
</head>
<body>
<jsp:include page="../base/header.jsp"/>
<jsp:include page="../base/nav.jsp"/>
	<div class="profile_wrap">
        <div class="profile_first">
            <div class="profile_img">
                <img>
            </div>
            <div class="profile_contents">
                <div class="profile_nickname">나아님</div>
                <ul class="degree">
	                    <li class="manner_degree">
	                    	<div class=flexf>
	                    		매너온도
	                        	<div class="profile_degree">36.5℃</div>
	                    	</div>
	                    </li>
	                    <li class="manner_degree1">
	                    		마포구 인증
	                    </li>
	                    <li class="manner_degree1">
	                        2019년 11월 15일 인증
	                    </li>
	            </ul>
            </div>
        </div>
        <div class="profile_second">
            <div class="profile_nav">
                <div class="profile_status onsale"><a href="<c:url value='/profile/user' />">판매중</a></div>
                <div class="profile_status offsale"><a href="<c:url value='/profile/user/offsale' />">판매완료</a></div>
                <div class="profile_status review"><a href="<c:url value='/profile/user/review' />">거래후기</a></div>
            </div>
            <div class="profile_review_wrap">
                <div class="review_part">
                    <div class="review_nickname">꿍디누나</div>
                    <div class="real_review">제가 있는 곳 까지 와주셨어요!</div>
                </div>
                <div class="review_part">
                    <div class="review_nickname">영종도핵주먹</div>
                    <div class="real_review">싼 가격에 주셨어요!</div>
                </div>
                <div class="review_part">
                    <div class="review_nickname">꽁아짱</div>
                    <div class="real_review">대답이 빨라요!</div>
                </div>
                <div class="review_part">
                    <div class="review_nickname">타타훔</div>
                    <div class="real_review">시간약속을 잘 지켜요!</div>
                </div>
                <div class="review_part">
                    <div class="review_nickname">다리달달</div>
                    <div class="real_review">제가 있는 곳 까지 와주셨어요!</div>
                </div>
                <div class="review_part">
                    <div class="review_nickname">아꾸룽</div>
                    <div class="real_review">감사합니다! 잘 쓸게요~</div>
                </div>
            </div>
        </div>
    </div>
<jsp:include page="../base/footer.jsp"/>
</body>
</html>