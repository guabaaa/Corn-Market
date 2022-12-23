<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/profile/profile.css"/>
<script src="${path}/resources/js/town/town.js"></script>
<script src="${path}/resources/js/profile/update_myinfo.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
        .offsale{
            background-color: rgb(241, 196, 15);
        }
        .offsale a{
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
                <img src="${path}${profile.profile_img}" >
                <input type="button" class="profile_update_btn" value="프로필 수정" onclick="update_myinfo()">
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
	                    <li class="manner_degree">
	                    	<div class=flexf>
	                    		${profile.town_name} 인증
	                        	<input type="button" class="profile_update_btn1" value="동네인증" onclick="mytown()">
	                    	</div>
	                    </li>
	                    <li class="manner_degree1">
	                        ${profile.join_date[0]}년 ${profile.join_date[1]}월 ${profile.join_date[2]}일 가입
	                    </li>
	                 </ul>
            </div>
            <div class="chat_area">
            	<input type="button" value="채팅방" class="chatting">
            </div>
        </div>
        <div class="profile_second">
           <div class="profile_nav">
                <div class="profile_status onsale"><a href="<c:url value='/profile' />">판매중</a></div>
                <div class="profile_status offsale"><a href="<c:url value='/profile/offsale' />">판매완료</a></div>
                <div class="profile_status review"><a href="<c:url value='/profile/review' />">거래후기</a></div>
            </div>
            <div class="home-card-wrap">

				<c:forEach var="sale" items="${profile.saleList}">
					          <article class="card-top">
					            <a class="card-link">
					              <div class="card-photo" style="background-image: url('${path}${sale.post_img}');background-size:cover;background-position:center;"></div>
					              <div class="card-desc">
					                <div class="card-title">${sale.title}</div>
					                <div class="card-price">${sale.price}원</div>
					                <div class="card-region">서울시 ${sale.town_name}</div>
					              </div>
					            </a>
					          </article>
				</c:forEach>

            </div>
        </div>
    </div>
<jsp:include page="../base/footer.jsp"/>
</body>
</html>