<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@ page language="java" contentType="text/html;
charset=UTF-8" pageEncoding="UTF-8"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <link href="${path}/resources/css/profile/profile.css" rel="stylesheet" />
    <style>
      .onsale {
        background-color: rgb(241, 196, 15);
      }
      .onsale a {
        color: white;
      }
    </style>
  </head>
  <body>
    <div class="profile_wrap">
      <div class="profile_first">
        <div class="profile_img">
          <img />
          <input
            type="button"
            class="profile_update_btn"
            value="프로필 수정"
            onclick="location.href='./profile_update.html'"
          />
        </div>
        <div class="profile_contents">
          <div class="profile_nickname">김영현</div>
          <div class="degree">
            <div class="manner_degree">매너온도</div>
            <div class="profile_degree">36.5℃</div>
          </div>
          <ul>
            <li>마포구 인증</li>
            <li>2019년 11월 4일 가입인증</li>
          </ul>
        </div>
      </div>
      <div class="profile_second">
        <div class="profile_nav">
          <div class="profile_status onsale"><a href="<c:url value="/profile" />">판매중</a></div>
          <div class="profile_status offsale"><a href="<c:url value="/profile/offsale" />">판매완료</a></div>
          <div class="profile_status review"><a href="<c:url value="/profile/review" />">거래후기</a></div>
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
  </body>
</html>
