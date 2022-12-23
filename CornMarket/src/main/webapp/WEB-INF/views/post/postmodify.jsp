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
    <link rel="stylesheet" href="${path}/resources/css/post/postregister.css"/>
</head>

<body>

    <div class="board-wrap">
        <div class="board-modify-wrap">
            <select>
                <option value="ing">거래중</option>
                <option value="fin">거래완료</option>
            </select>
        </div>
        <div class="board-img-wrap">
            <div class="sell-img">img</div>
            <input class="selling-img-btn" type="button" value="사진등록">
        </div>
        <div class="board-title-line">
            <div class="board-title-wrap">
                <h2 class="board-title">제목</h2>
                <input class="board-title-input" type="text" placeholder="제목을 입력해주세요">
            </div>
            <div class="board-cate-wrap">
                <h2 class="board-cate">카테고리</h2>
                <select class="board-cate-select">
                    <option value="select">선택</option>
                    <option value="전자기기">전자기기</option>
                    <option value="가구,인테리어">가구,인테리어</option>
                    <option value="의류">의류</option>
                    <option value="beaty">뷰티,미용</option>
                    <option value="hobbygamemusic">취미,게임,음반</option>
                    <option value="반려동물용품">반려동물용품</option>
                    <option value="etc">기타</option>
                </select>
            </div>
            <div class="board-sellingprice-wrap">
                <h2 class="board-sellingprice">판매가격</h2>
                <input class="board-sellingprice-input" type="text" placeholder="가격을 입력해주세요" id="inputonchange"
                    name="inputonchange">
                <p class="board-sellingprice-won">원</p>
                <p class="board-check">나눔</p>
                <input type="checkbox" class="board-checkbox" id="boardcheckbox" name="boardcheckbox" value="1" />
            </div>
        </div>
        <div class="board-contents-wrap">
            <textarea placeholder="내용을 입력해주세요"></textarea>
        </div>
        <div class="board-btn-wrap">
            <input class="board-btn" type="button" value="등록">
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="${path}/resources/js/post/postregister.js"></script>

</body>

</html>