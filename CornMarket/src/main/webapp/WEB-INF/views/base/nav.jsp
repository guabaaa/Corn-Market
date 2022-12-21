<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/main/index.css"/>
</head>
<body>
	<nav>
        <div class="nav_wrap">
            <ul class="nav_first">
                <li class="nav_main"><a href="">사기</a>
                    <ul class="nav_second">
                        <li><a href="">전자기기</a></li>
                        <li><a href="">가구/홈 데코</a></li>
                        <li><a href="">반려동물용품</a></li>
                        <li><a href="">취미/게임/음반</a></li>
                        <li><a href="">의류</a></li>
                        <li><a href="">뷰티/미용</a></li>
                    </ul>
                </li>
                <li class="nav_main"><a href="">팔기</a>
                    <ul class="nav_second">
                        <li><a href="">판매등록</a></li>
                        <li><a href="./profile_onsale.jsp">판매내역조회</a></li>
                    </ul>
                </li>
                <li class="nav_main"><a href="">나눔</a></li>
            </ul>
        </div>
    </nav>
</body>
</html>