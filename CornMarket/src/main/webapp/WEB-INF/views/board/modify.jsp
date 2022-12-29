<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 수정</title>
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../base/header_nickname.jsp" />
<jsp:include page="../base/nav.jsp" />

<form method="post" action="/market/modify">

<label>제목</label>
<input type="text" name="title" /><br />

<label>가격</label>
<input type="text" name="price" /><br />

<label>내용</label>
<textarea cols="50" rows="5" name="content"></textarea><br />

<div>

<button type="submit">완료</button> 

</form>

<jsp:include page="../base/footer.jsp" />
</body>
</html>