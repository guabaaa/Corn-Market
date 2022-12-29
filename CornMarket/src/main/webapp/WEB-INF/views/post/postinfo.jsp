<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Corn-Market 내 게시글 상세보기</title>
    <c:set var="path" value="${pageContext.request.contextPath}"/>
    <link rel="stylesheet" href="${path}/resources/css/post/postinfo.css"/>
    

</head>

<body>
<jsp:include page="../base/header_nickname.jsp" />
<jsp:include page="../base/nav.jsp" />
    <div class="board-wrap">
        <div class="board-img-wrap">
            <div class="sell-img"></div>
        </div>

        <div class="board-title-line">
            <div class="board-title-wrap">
                <h2 class="board-title">제목</h2>
                <div class="info-title">제목데이터</div>
            </div>
            <div class="board-cate-wrap">
                <h2 class="board-cate">카테고리</h2>
                <div class="info-cate">카테고리데이터</div>
            </div>
            <div class="board-sellingprice-wrap">
                <h2 class="board-sellingprice">판매가격</h2>
                <div class="info-sellingprice" value="">판매가격데이터</div>
                <p class="info-won">원</p>
            </div>
        </div>
        <div class="board-contents-wrap">
            <div class="info-contents">내용데이터</div>
        </div>
        <div class="board-btn-wrap">
            <input class="board-btn" type="button" value="수정">
            <input class="board-btn" type="button" value="삭제">
        </div>
    </div>

<jsp:include page="../base/footer.jsp" />
</body>

</html>