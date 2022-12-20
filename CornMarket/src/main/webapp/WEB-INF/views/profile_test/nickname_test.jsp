<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@ page language="java" contentType="text/html;
charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>파일 업로드 테스트</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript">
      $(document).ready(ajax);
      function ajax() {
        $('#btn1').click(function () {
          let nickname = $('#nm').val();
          console.log(nickname);
          $.ajax({
            type: 'GET', //중복확인
            url: '<c:url value="/profile/update/check?nickname=" />' + nickname,
            success: function (num) {
              console.log(num);
              //alert('ddd');
              if (num == 0) alert('닉네임을 사용하실 수 있습니다.');
              else if (num == 1) {
                alert('이미 존재하는 닉네임 입니다.');
                $('#nm').val('');
              }
            },
            error: function () {
              alert('error');
            }, // 에러가 발생했을 때, 호출될 함수
          }); // $.ajax()
        });
      }
    </script>
  </head>
  <body>
    <c:set var="path" value="${pageContext.request.contextPath}" />

    <form action="<c:url value='/profile/update/nickname'/>" method="post" name="frm" id="frm">
      닉네임 : <input type="text" id="nm" name="nickname" />
      <input type="button" id="btn1" value="중복확인" class="btn" />
      <br />
      <input type="submit" id="btn2" value="저장" class="btn" />
    </form>
  </body>
</html>
