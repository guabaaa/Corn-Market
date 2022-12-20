<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드 테스트</title>
</head>
<body>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<h3>파일 한개</h3>
<form action="<c:url value='/profile/test1'/>" method="post" enctype="multipart/form-data" name="frm" id="frm">
	파일 선택 : <input type="file" id="file" name="file" accept="image/*">
	<input type="submit" id="submit1" value="저장" class="btn">
</form>

<br>

<h3>파일 여러개</h3>
<form action="<c:url value='/profile/test2'/>" method="post" enctype="multipart/form-data" name="frm" id="frm">
	파일 선택 : <input type="file" id="files" name="files" multiple="multiple" accept="image/*">
	<input type="submit" id="submit2" value="저장" class="btn">
</form>

<img alt="" src="${path}/resources/images/profile/profile_120221219225753.png">

</body>
</html>