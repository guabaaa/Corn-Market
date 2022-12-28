<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Corn-Market 프로필</title>
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
<jsp:include page="../base/header_nickname.jsp"/>
<jsp:include page="../base/nav.jsp"/>
	<div class="profile_wrap">
        <div class="profile_first">
            <div class="profile_img">
                <img src="${path}${profile.profile_img}" >
            </div>
            <div class="profile_contents">
                <div class="profile_nickname">${profile.nickname}</div>
                <ul class="degree">
	                    <li class="manner_degree">
	                    	<div class=flexf>
	                    		매너온도
	                        	<div class="profile_degree">${profile.temperature}℃</div>
	                    	</div>
	                    </li>
	                    <li class="manner_degree1">
	                    		${profile.town_name} 인증
	                    </li>
	                    <li class="manner_degree1">
	                        ${profile.join_date[0]}년 ${profile.join_date[1]}월 ${profile.join_date[2]}일 가입
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

				<c:forEach var="rv" items="${profile.reviewList}">
				          <div class="review_part">
				            <div class="review_nickname">${rv.nickname}</div>
				            <div class="real_review">${rv.review}</div>
				          </div>
				</c:forEach>

            </div>
        </div>
    </div>
<jsp:include page="../base/footer.jsp"/>
</body>
</html>