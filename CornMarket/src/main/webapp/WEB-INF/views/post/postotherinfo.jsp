<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Corn-Market</title>
    <c:set var="path" value="${pageContext.request.contextPath}"/>
    <link rel="stylesheet" href="${path}/resources/css/post/postinfo.css"/>

</head>

<body>

    <div class="board-wrap">
        <div class="board-img-wrap">
            <img class="sell-img" src="${path}${view.post_img}">
        </div>

        <div class="board-title-line">
            <div class="board-title-wrap">
                <h2 class="board-title">제목</h2>
                <div class="info-title">${post.title }</div>
            </div>
            <div class="board-cate-wrap">
                <h2 class="board-cate">카테고리</h2>
                <div class="info-cate">카테고리데이터</div>
            </div>
            <div class="board-sellingprice-wrap">
                <h2 class="board-sellingprice">판매가격</h2>
                <div class="info-sellingprice">${post.price }</div>
                <p class="info-won">원</p>
            </div>
        </div>
        <div class="board-contents-wrap">
            <div class="info-contents">${post.content }</div>
        </div>
        <div class="board-chat-btn-wrap">
            <input class="board-chat-btn" type="button" value="채팅하기" onclick="chattingSub()" id="chattingsub_btn">
        </div>
    </div>

</body>

</html>