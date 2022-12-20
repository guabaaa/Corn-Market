<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page language="java" contentType="text/html;
charset=UTF-8" pageEncoding="UTF-8"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <link href="${path}/resources/css/profile/profile.css" rel="stylesheet" />
    <style>
      .review {
        background-color: rgb(241, 196, 15);
      }
      .review a {
        color: white;
      }
    </style>
  </head>
  <body>
    <div class="profile_wrap">
      <div class="profile_first">
        <div class="profile_img">
          <img src="" />
          <input
            type="button"
            class="profile_update_btn"
            value="프로필 수정"
            onclick="location.href='<c:url value="/profile/update" />'"
          />
        </div>
        <div class="profile_contents">
          <div class="profile_nickname">${profile.nickname}</div>
          <div class="degree">
            <div class="manner_degree">매너온도</div>
            <div class="profile_degree">${profile.temperature}℃</div>
          </div>
          <ul>
            <li>${profile.town_name} 인증</li>
            <li>${profile.join_date[0]}년 ${profile.join_date[1]}월 ${profile.join_date[2]}일 가입인증</li>
          </ul>
        </div>
      </div>
      <div class="profile_second">
        <div class="profile_nav">
          <div class="profile_status onsale"><a href="<c:url value="/profile" />">판매중</a></div>
          <div class="profile_status offsale"><a href="<c:url value="/profile/offsale" />">판매완료</a></div>
          <div class="profile_status review"><a href="<c:url value="/profile/review" />">거래후기</a></div>
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
  </body>
</html>
