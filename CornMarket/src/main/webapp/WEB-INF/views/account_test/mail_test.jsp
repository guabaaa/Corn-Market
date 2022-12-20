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
          alert('인증번호를 전송중입니다.');
          const email = $('#mail').val(); // 이메일 주소값
          console.log('이메일 주소 : ' + email);
          // ajaxMailSend(email);
          $.ajax({
            type: 'GET',
            url: '<c:url value="/account/pw/mail?email=" />' + email,
            success: function () {
              const num = $('#num');
              num.attr('disabled', false); //인증번호 입력창 활성화
              alert('인증번호가 전송되었습니다.');
            },
            error: function () {
              alert('오류 발생');
            },
          }); //ajax
        }); //click
      }

      function numBtnClick() {
        $('#numBtn').click(() => {
          alert('dddd');
          const mail_code = $('#num').val(); // 인증코드 값
          console.log('인증 코드 : ' + mail_code);

          $.ajax({
            type: 'GET',
            url: '<c:url value="/account/pw/mail/code?mail_code=" />' + mail_code,
            success: function (data) {
              console.log(data);
              if (data == 1) {
                alert('인증번호가 확인되었습니다.');
              } else if (data == 0) {
                alert('인증번호를 다시 확인해주세요.');
              }
            },
            error: function (data) {
              alert('오류 발생');
            },
          }); //ajax
        }); //click
      }

      function loadEvent() {
        mailBtnClick();
        numBtnClick();
      }

      $(document).ready(loadEvent);
    </script>
  </head>
  <body>
    <input type="text" name="email" placeholder="이메일 입력" id="mail" />
    <button id="mailBtn">인증번호 요청</button>
    <input type="text" name="mail_code" placeholder="인증번호 입력" id="num" disabled="disabled" />
    <button id="numBtn">확인</button>
  </body>
</html>
