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
        .onsale{
            background-color: rgb(241, 196, 15);
        }
        .onsale a{
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
                <div class="profile_status onsale"><a href="./other_profile_onsale.jsp">판매중</a></div>
                <div class="profile_status offsale"><a href="./other_profile_offsale.jsp">판매완료</a></div>
                <div class="profile_status review"><a href="./other_profile_review.jsp">거래후기</a></div>
            </div>
            <div class="home-card-wrap">
                <article class="card-top">
                    <a class="card-link">
                        <div class="card-photo">photo</div>
                        <div class="card-desc">
                            <div class="card-title">ㅇㅇ판매합니다</div>
                            <div class="card-price">20,000원</div>
                            <div class="card-region">서울시 구로구 개봉동</div>
                        </div>
                    </a>
                </article>
                <article class="card-top">
                    <a class="card-link">
                        <div class="card-photo">photo</div>
                        <div class="card-desc">
                            <div class="card-title">ㅇㅇ판매합니다</div>
                            <div class="card-price">20,000원</div>
                            <div class="card-region">서울시 구로구 개봉동</div>
                        </div>
                    </a>
                </article>
                <article class="card-top">
                    <a class="card-link">
                        <div class="card-photo">photo</div>
                        <div class="card-desc">
                            <div class="card-title">ㅇㅇ판매합니다</div>
                            <div class="card-price">20,000원</div>
                            <div class="card-region">서울시 구로구 개봉동</div>
                        </div>
                    </a>
                </article>
                <article class="card-top">
                    <a class="card-link">
                        <div class="card-photo">photo</div>
                        <div class="card-desc">
                            <div class="card-title">ㅇㅇ판매합니다</div>
                            <div class="card-price">20,000원</div>
                            <div class="card-region">서울시 구로구 개봉동</div>
                        </div>
                    </a>
                </article>
                <article class="card-top">
                    <a class="card-link">
                        <div class="card-photo">photo</div>
                        <div class="card-desc">
                            <div class="card-title">ㅇㅇ판매합니다</div>
                            <div class="card-price">20,000원</div>
                            <div class="card-region">서울시 구로구 개봉동</div>
                        </div>
                    </a>
                </article>
                <article class="card-top">
                    <a class="card-link">
                        <div class="card-photo">photo</div>
                        <div class="card-desc">
                            <div class="card-title">ㅇㅇ판매합니다</div>
                            <div class="card-price">20,000원</div>
                            <div class="card-region">서울시 구로구 개봉동</div>
                        </div>
                    </a>
                </article>
            </div>
        </div>
    </div>
<jsp:include page="../base/footer.jsp"/>
</body>
</html>