<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
     <c:set var="path" value="${pageContext.request.contextPath}"/>
    <link rel="stylesheet" href="${path}/resources/css/post/postlookup.css">
</head>

<body>
    
    <!-- 상품 리스트 -->
    <section class="board-lookup-wrap">
        <div>
            <h1 class="board-lookup-title" id="onchange" name="onchange">사기</h1>
            <div class="board-select-wrap">
                <p class="sort-way" id="sortway" name="sortway">최신글로 조회하기</p>
                <select class="sort-way-select1" id="sortchoice1" name="sortchoice1">
                    <option value="최신글">최신글</option>
                    <option value="카테고리">카테고리별</option>
                    <option value="지역">지역별</option>
                </select>
                <select class="sort-way-select2" name="sortchoice2" id="sortchoice2" onchange="showValue(this)">
                </select>
            </div>
        </div>
        
        <div class="board-card-wrap">
            <article class="board-card-top">
                <a class="board-card-link" href="<c:url value='/post/postotherinfo'/>" >
                    <div class="board-card-photo">${ }</div>
                    <div class="board-card-desc">
                        <div class="board-card-title"></div>
                        <div class="board-card-price"></div>
                        <div class="board-card-region"></div>
                    </div>
                </a>
            </article>

            <article class="board-card-top">
                <a class="board-card-link">
                    <div class="board-card-photo">photo</div>
                    <div class="board-card-desc">
                        <div class="board-card-title">ㅇㅇ판매합니다</div>
                        <div class="board-card-price">20,000원</div>
                        <div class="board-card-region">서울시 구로구 개봉동</div>
                    </div>
                </a>
            </article>

            <article class="board-card-top">
                <a class="board-card-link">
                    <div class="board-card-photo">photo</div>
                    <div class="board-card-desc">
                        <div class="board-card-title">ㅇㅇ판매합니다</div>
                        <div class="board-card-price">20,000원</div>
                        <div class="board-card-region">서울시 구로구 개봉동</div>
                    </div>
                </a>
            </article>

            <article class="board-card-top">
                <a class="board-card-link">
                    <div class="board-card-photo">photo</div>
                    <div class="board-card-desc">
                        <div class="board-card-title">ㅇㅇ판매합니다</div>
                        <div class="board-card-price">20,000원</div>
                        <div class="board-card-region">서울시 구로구 개봉동</div>
                    </div>
                </a>
            </article>

            <article class="board-card-top">
                <a class="board-card-link">
                    <div class="board-card-photo">photo</div>
                    <div class="board-card-desc">
                        <div class="board-card-title">ㅇㅇ판매합니다</div>
                        <div class="board-card-price">20,000원</div>
                        <div class="board-card-region">서울시 구로구 개봉동</div>
                    </div>
                </a>
            </article>

            <article class="board-card-top">
                <a class="board-card-link">
                    <div class="board-card-photo">photo</div>
                    <div class="board-card-desc">
                        <div class="board-card-title">ㅇㅇ판매합니다</div>
                        <div class="board-card-price">20,000원</div>
                        <div class="board-card-region">서울시 구로구 개봉동</div>
                    </div>
                </a>
            </article>

            <article class="board-card-top">
                <a class="board-card-link">
                    <div class="board-card-photo">photo</div>
                    <div class="board-card-desc">
                        <div class="board-card-title">ㅇㅇ판매합니다</div>
                        <div class="board-card-price">20,000원</div>
                        <div class="board-card-region">서울시 구로구 개봉동</div>
                    </div>
                </a>
            </article>

            <article class="board-card-top">
                <a class="board-card-link">
                    <div class="board-card-photo">photo</div>
                    <div class="board-card-desc">
                        <div class="board-card-title">ㅇㅇ판매합니다</div>
                        <div class="board-card-price">20,000원</div>
                        <div class="board-card-region">서울시 구로구 개봉동</div>
                    </div>
                </a>
            </article>

            <article class="board-card-top">
                <a class="board-card-link">
                    <div class="board-card-photo">photo</div>
                    <div class="board-card-desc">
                        <div class="board-card-title">ㅇㅇ판매합니다</div>
                        <div class="board-card-price">20,000원</div>
                        <div class="board-card-region">서울시 구로구 개봉동</div>
                    </div>
                </a>
            </article>

            <article class="board-card-top">
                <a class="board-card-link">
                    <div class="board-card-photo">photo</div>
                    <div class="board-card-desc">
                        <div class="board-card-title">ㅇㅇ판매합니다</div>
                        <div class="board-card-price">20,000원</div>
                        <div class="board-card-region">서울시 구로구 개봉동</div>
                    </div>
                </a>
            </article>

            <article class="board-card-top">
                <a class="board-card-link">
                    <div class="board-card-photo">photo</div>
                    <div class="board-card-desc">
                        <div class="board-card-title">ㅇㅇ판매합니다</div>
                        <div class="board-card-price">20,000원</div>
                        <div class="board-card-region">서울시 구로구 개봉동</div>
                    </div>
                </a>
            </article>

            <article class="board-card-top">
                <a class="board-card-link">
                    <div class="board-card-photo">photo</div>
                    <div class="board-card-desc">
                        <div class="board-card-title">ㅇㅇ판매합니다</div>
                        <div class="board-card-price">20,000원</div>
                        <div class="board-card-region">서울시 구로구 개봉동</div>
                    </div>
                </a>
            </article>

            <article class="board-card-top">
                <a class="board-card-link">
                    <div class="board-card-photo">photo</div>
                    <div class="board-card-desc">
                        <div class="board-card-title">ㅇㅇ판매합니다</div>
                        <div class="board-card-price">20,000원</div>
                        <div class="board-card-region">서울시 구로구 개봉동</div>
                    </div>
                </a>
            </article>

            <article class="board-card-top">
                <a class="board-card-link">
                    <div class="board-card-photo">photo</div>
                    <div class="board-card-desc">
                        <div class="board-card-title">ㅇㅇ판매합니다</div>
                        <div class="board-card-price">20,000원</div>
                        <div class="board-card-region">서울시 구로구 개봉동</div>
                    </div>
                </a>
            </article>

            <article class="board-card-top">
                <a class="board-card-link">
                    <div class="board-card-photo">photo</div>
                    <div class="board-card-desc">
                        <div class="board-card-title">ㅇㅇ판매합니다</div>
                        <div class="board-card-price">20,000원</div>
                        <div class="board-card-region">서울시 구로구 개봉동</div>
                    </div>
                </a>
            </article>

            <article class="board-card-top">
                <a class="board-card-link">
                    <div class="board-card-photo">photo</div>
                    <div class="board-card-desc">
                        <div class="board-card-title">ㅇㅇ판매합니다</div>
                        <div class="board-card-price">20,000원</div>
                        <div class="board-card-region">서울시 구로구 개봉동</div>
                    </div>
                </a>
            </article>

            <article class="board-card-top">
                <a class="board-card-link">
                    <div class="board-card-photo">photo</div>
                    <div class="board-card-desc">
                        <div class="board-card-title">ㅇㅇ판매합니다</div>
                        <div class="board-card-price">20,000원</div>
                        <div class="board-card-region">서울시 구로구 개봉동</div>
                    </div>
                </a>
            </article>

            <article class="board-card-top">
                <a class="board-card-link">
                    <div class="board-card-photo">photo</div>
                    <div class="board-card-desc">
                        <div class="board-card-title">ㅇㅇ판매합니다</div>
                        <div class="board-card-price">20,000원</div>
                        <div class="board-card-region">서울시 구로구 개봉동</div>
                    </div>
                </a>
            </article>

            <article class="board-card-top">
                <a class="board-card-link">
                    <div class="board-card-photo">photo</div>
                    <div class="board-card-desc">
                        <div class="board-card-title">ㅇㅇ판매합니다</div>
                        <div class="board-card-price">20,000원</div>
                        <div class="board-card-region">서울시 구로구 개봉동</div>
                    </div>
                </a>
            </article>

            <article class="board-card-top">
                <a class="board-card-link">
                    <div class="board-card-photo">photo</div>
                    <div class="board-card-desc">
                        <div class="board-card-title">ㅇㅇ판매합니다</div>
                        <div class="board-card-price">20,000원</div>
                        <div class="board-card-region">서울시 구로구 개봉동</div>
                    </div>
                </a>
            </article>
        </div>
        <div class="board-pagination-wrap clearfix">
            <ul class="board-pagination float--right" id="pages"></ul>
        </div>

    </section>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <script src="${path}/resources/js/post/postlookup.js"></script>

</body>

</html>