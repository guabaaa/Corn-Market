<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--  날짜 수정  -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물목록</title>
</head>
<body>

<div id="nav">
 <%@ include file="../include/nav.jsp" %>
</div>

<table>
 <thead>
  <tr>
   <th>번호</th>
   <th>제목</th>
   <th>가격</th>
   <th>작성일</th>
   <th>작성자</th>
   <th>조회수</th>
  </tr>
 </thead>
 
 <tbody>
 
 <c:forEach items="${list}" var="list">
 <tr>
 <!-- 게시판에서는 고유번호로 각 게시물을 구분하므로,
 이렇게하면 링크 태그의 주소(href)는 /board/view?bno=[고유번호]가 되기 때문에, 주소의 파라미터값 컨트롤러에 전달할 수 있습니다. -->
  <td>
    <a href="/board/view?post_no=${list.post_no}">${list.title}</a>
</td>
  <td>${list.title}</td>
  <td>
  <fmt:formatDate value="${list.regDate}" pattern="yyyy-MM-dd" />
  </td>
  <td>동네정보</td>
 </tr>
 
</c:forEach>
  
 </tbody>

</table>

</body>
</html>