<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@ page language="java" contentType="text/html;
charset=UTF-8" pageEncoding="UTF-8"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <link href="${path}/resources/css/profile/profile_update.css" rel="stylesheet" />
    <script>
      function change_img() {
        window.open('popup.html', 'popup01', 'width=450, height=300');
      }
    </script>
  </head>
  <body>
    <div class="update_wrap">
      <div class="update_first">
        <img />
        <input type="button" value="변경" onclick="change_img()" />
      </div>
      <div class="update_second">
        <div class="up_main">
          <div class="up_title">닉네임</div>
          <input type="text" placeholder="김영현" class="update_nickname" />
          <input type="button" value="중복확인" class="double_check" />
        </div>
        <div class="map_zone">
          <div class="update_map">
            <div class="up_title">동네인증</div>
            <div class="map"></div>
          </div>
          <div class="map_search">
            <input type="text" class="update_nickname" />
            <input type="button" value="현재위치로 찾기" class="search_location" />
          </div>
        </div>
        <div class="up_main">
          <div class="up_title">이메일</div>
          <div class="profile_phone">fourkimm@naver.com</div>
        </div>
        <div class="up_main">
          <div class="up_title">휴대폰번호</div>
          <div class="profile_phone">010-9695-9692</div>
        </div>
        <div class="update_third">
          <input type="button" value="저장" />
        </div>
      </div>
    </div>
  </body>
</html>
