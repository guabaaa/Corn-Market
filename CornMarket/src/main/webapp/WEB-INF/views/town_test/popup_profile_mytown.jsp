<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <style>
      .popup-wrap {
        background-color: rgba(0, 0, 0, 0.3);
        justify-content: center;
        align-items: center;
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        padding: 15px;
      }

      .popup {
        width: 1000px;
        max-width: 600px;
        border-radius: 10px;
        overflow: hidden;
        background-color: rgb(241, 196, 15);
        font-size: 17px;
        font-weight: bold;
        box-shadow: 5px 10px 10px 1px rgba(0, 0, 0, 0.3);
      }

      .popup-head {
        width: 100%;
        height: 50px;
        display: flex;
        align-items: center;
        justify-content: center;
      }

      .popup-body {
        background-color: #ffffff;
      }
      .body-content {
        padding: 20px;
      }
      .body-titlebox {
        text-align: center;
        width: 500px;
        height: 350px;
        background-color: red;
        margin: 10px auto;
      }
      .body-contentbox {
        width: 360px;
        height: 100px;
        margin: 10px auto;
        margin-top: 30px;
      }

      .popup-foot {
        width: 100%;
        height: 50px;
        display: flex;
      }

      .pop-btn {
        display: inline-flex;
        width: 50%;
        height: 100%;
        justify-content: center;
        align-items: center;
        float: left;
        color: rgb(255, 255, 255);
        cursor: pointer;
      }
      .pop-btn.confirm {
        border-right: 1px solid black;
      }

      .search_btn {
        width: 100px;
        height: 40px;
        border-radius: 4px;
        border-color: rgb(241, 196, 15);
        background-color: rgb(241, 196, 15);
        color: rgb(255, 255, 255);
        font-weight: bold;
        display: block;
        margin: 20px auto;
      }

      .body_contentbox h3 {
        text-align: center;
      }

      .town_info {
        display: none;
      }
      .town_info .town{
        color: rgb(61, 0, 202);
      }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <script>
      //동네찾기 버튼
      function loadEvent() {
        $('#search_btn').click(clickEvent);
      }
      function clickEvent() {
        //alert('dd');
        $('#town_info').show();
      }

      $('document').ready(loadEvent);
    </script>
  </head>
  <body>
    <div class="container">
      <div class="popup-wrap" id="popup">
        <div class="popup">
          <div class="popup-head">
            <span class="head-title">동네인증하기</span>
          </div>
          <div class="popup-body">
            <div class="body-content">
              <div class="body-titlebox"></div>
              <div class="body-contentbox">
                <h3 class="town_info" id="town_info">현재위치가 <span class="town">마포구 서교동</span class="town">에 있습니다.</h3>
                <input type="button" class="search_btn" id="search_btn" value="동네찾기" />
              </div>
            </div>
          </div>
          <div class="popup-foot">
            <span class="pop-btn confirm" id="confirm" onclick="">인증완료</span>
            <span class="pop-btn close" id="close" onclick="self.close()">창 닫기</span>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
