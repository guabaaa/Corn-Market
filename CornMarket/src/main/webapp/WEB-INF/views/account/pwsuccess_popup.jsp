<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>pw-success-popup</title>
    <script></script>
    <link href="../search-id-pw/popup.css" rel="stylesheet">
</head>
<body>
    <div class="container"> 
        <div class="popup-wrap" id="popup"> 
          <div class="popup">
            <div class="popup-head">
                <span class="head-title">비밀번호 찾기</span>
            </div>
            <div class="popup-body">
              <div class="body-content">
                <div class="body-titlebox">
                  <p class="email-success-message">귀하의 비밀번호는</p>
                  <span class="email-code-num" id="emailcodeNum">'data'</span>
                  <p class="email-success-message">입니다.</p>
                </div>
              </div>
            </div>
            <div class="popup-foot">
              <span class="pop-btn close" id="close" onclick="">닫기</span>
            </div>
          </div>
         </div>
    </div>
</body>
</html>