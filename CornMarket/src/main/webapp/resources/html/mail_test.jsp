<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@ page language="java" contentType="text/html;
charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>메일 인증</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
      function mailBtnClick() {
        $('#mailBtn').click(() => {
          const email = $('#mail').val(); // 이메일 주소값
          console.log('이메일 주소 : ' + email);
          const num = $('#num');
          // ajaxMailSend(email);
          $.ajax({
            type: 'GET',
            url: '<c:url value="/account/mail-check?email=" />' + email,
            success: function (data) {
              console.log(data);
              num.attr('disabled', false);
              code = data;
              alert('인증번호가 전송되었습니다.');
            },
          }); //ajax
        }); //click
      }
      // function ajaxMailSend(email) {
      // }
      $(document).ready(mailBtnClick);
    </script>
  </head>
  <body>
    <input type="text" name="email" placeholder="이메일 입력" id="mail" />
    <button id="mailBtn">인증번호 요청</button>
    <input type="text" name="mail_num" placeholder="인증번호 입력" id="num" disabled="disabled" />
    <button>확인</button>
  </body>
</html>
