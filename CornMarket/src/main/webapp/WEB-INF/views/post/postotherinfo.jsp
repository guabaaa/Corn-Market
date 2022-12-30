<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Corn-Market 상세조회</title>
    <c:set var="path" value="${pageContext.request.contextPath}"/>
    <link rel="stylesheet" href="${path}/resources/css/post/postinfo.css"/>

</head>

<body>
<c:if test="${sessionScope.id!=null}"><jsp:include page="../base/header_nickname.jsp" /></c:if>
<c:if test="${sessionScope.id==null}"><jsp:include page="../base/header.jsp" /></c:if>
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
        <form action="<c:url value='/chatting/list'/>" id="frm" method="post" name="chat_room_frm">
        <div class="board-chat-btn-wrap">
            <input class="board-chat-btn" type="button" value="채팅하기" id="chattingsub_btn">
		    <input type="hidden" value="${view.post_id}" id="post_id" name="post_id" />
        </div>
        </form>
    </div>
    
    <input type="hidden" value="<c:url value='/chatting/list/' />" id="chat_url" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="${path}/resources/js/chatting/chatting_create.js"></script>

<jsp:include page="../base/footer.jsp" />
</body>

</html>