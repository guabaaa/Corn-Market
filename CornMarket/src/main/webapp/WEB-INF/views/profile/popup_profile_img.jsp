<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/profile/popup.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<div class="container"> 
        <div class="popup-wrap" id="popup"> 
          <div class="popup">
            <div class="popup-head">
                <span class="head-title">프로필 사진 변경하기</span>
            </div>
            <div class="popup-body">
              <div class="body-content">
                <div class="body-titlebox">
                  <input type="text" class="img_loader">
                </div>
                <div class="body-contentbox">
                  <input type="button" class="serach_btn" value="불러오기">
                </div>
              </div>
            </div>
            <div class="popup-foot">
              <span class="pop-btn confirm" id="confirm" onclick="">저장</span>
              <span class="pop-btn close" id="close" onclick="self.close()">창 닫기</span>
            </div>
          </div>
         </div>
    </div>
</body>
</html>