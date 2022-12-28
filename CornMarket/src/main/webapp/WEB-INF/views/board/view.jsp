<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 작성</title>
<title>Insert title here</title>
</head>
<body>

<div id="nav">
 <%@ include file="../include/nav.jsp" %> 
</div>
<!-- 여기서 주의해야할 부분은, 입력 엘리먼트인 <input> 과 <textarea>의 이름(name) 속성의 값이 BoardVO와 동일해야한다는것 입니다. -->
<form method="post">


<label>번호 </label>
${view.post_id}<br/>

<label>이미지</label>
${view.post_img}<br/>

<label></label>
${view.title}<br />

<label>가격</label>
${view.category_id}<br />

<label>내용</label><br />
${view.content}<br />

</form>

</body>
</html>