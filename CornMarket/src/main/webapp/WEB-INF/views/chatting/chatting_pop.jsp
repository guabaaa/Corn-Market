<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <link rel="stylesheet" href="${path}/resources/css/chatting/popup_chat.css" />
  </head>
  <body>
    <div class="container">
      <div class="popup-wrap" id="popup">
        <div class="popup">
          <div class="popup-head">
            <span class="head-title">CHATTING ROOM</span>
          </div>
          <form name="frm" id="frm">
            <div class="popup-body">
              <div class="body-content">
                <div class="body-titlebox">
                  <div class="titlebox1">
                    <img class="chat_profile" />
                    <p>꿍디누나</p>
                    <input type="button" class="chatlist_btn" value="채팅목록" />
                  </div>
                  <div class="titlebox2" onclick="">
                    <div class="chat_object"></div>
                    <div class="titlebox2-2">
                      <p>아이폰 팝니다</p>
                      <p>300,000원</p>
                    </div>
                  </div>
                </div>
                <div class="body-contentbox">
                  <div class="chat_date">2022년12월27일</div>
                  <div class="other_profile">
                    <img class="other_img" />
                    <div class="other_say">안녕하세요</div>
                    <div class="other_time">14:12</div>
                  </div>
                  <div class="my_profile">
                    <div class="my_time">14:30</div>
                    <div class="my_say">네 하이염</div>
                  </div>
                  <div class="other_profile">
                    <img class="other_img" />
                    <div class="other_say">구매하고싶어서요~</div>
                    <div class="other_time">14:32</div>
                  </div>
                  <div class="my_profile">
                    <div class="my_time">14:35</div>
                    <div class="my_say">네에 직거래해요</div>
                  </div>
                  <div class="my_profile">
                    <div class="my_time">14:37</div>
                    <div class="my_say">거래를 완료했습니다.</div>
                  </div>
                  <div class="chat_date">2022년12월27일</div>
                  <div class="other_profile">
                    <img class="other_img" />
                    <div class="other_say">안녕하세요</div>
                    <div class="other_time">14:12</div>
                  </div>
                  <div class="my_profile">
                    <div class="my_time">14:30</div>
                    <div class="my_say">네 하이염</div>
                  </div>
                  <div class="other_profile">
                    <img class="other_img" />
                    <div class="other_say">구매하고싶어서요~</div>
                    <div class="other_time">14:32</div>
                  </div>
                  <div class="my_profile">
                    <div class="my_time">14:35</div>
                    <div class="my_say">네에 직거래해요</div>
                  </div>
                  <div class="my_profile">
                    <div class="my_time">14:37</div>
                    <div class="my_say">거래를 완료했습니다.</div>
                  </div>
                  <div class="chat_date">2022년12월27일</div>
                  <div class="other_profile">
                    <img class="other_img" />
                    <div class="other_say">안녕하세요</div>
                    <div class="other_time">14:12</div>
                  </div>
                  <div class="my_profile">
                    <div class="my_time">14:30</div>
                    <div class="my_say">네 하이염</div>
                  </div>
                  <div class="other_profile">
                    <img class="other_img" />
                    <div class="other_say">구매하고싶어서요~</div>
                    <div class="other_time">14:32</div>
                  </div>
                  <div class="my_profile">
                    <div class="my_time">14:35</div>
                    <div class="my_say">네에 직거래해요</div>
                  </div>
                  <div class="my_profile">
                    <div class="my_time">14:37</div>
                    <div class="my_say">거래를 완료했습니다.</div>
                  </div>
                  <div class="chat_date">2022년12월27일</div>
                  <div class="other_profile">
                    <img class="other_img" />
                    <div class="other_say">안녕하세요</div>
                    <div class="other_time">14:12</div>
                  </div>
                  <div class="my_profile">
                    <div class="my_time">14:30</div>
                    <div class="my_say">네 하이염</div>
                  </div>
                  <div class="other_profile">
                    <img class="other_img" />
                    <div class="other_say">구매하고싶어서요~</div>
                    <div class="other_time">14:32</div>
                  </div>
                  <div class="my_profile">
                    <div class="my_time">14:35</div>
                    <div class="my_say">네에 직거래해요</div>
                  </div>
                  <div class="my_profile">
                    <div class="my_time">14:37</div>
                    <div class="my_say">거래를 완료했습니다.</div>
                  </div>
                  <div class="other_profile">
                    <img class="other_img" />
                    <div class="other_say">
                      판매자가 거래를 완료했습니다<br />
                      거래후기를 남겨주세요<br />
                      <input type="button" value="거래후기 작성하러 가기" class="goto_review" />
                    </div>
                    <div class="other_time">14:32</div>
                  </div>
                </div>
              </div>
            </div>
            <div class="popup-foot">
              <input type="button" value="거래완료" class="deal_end" />
              <input type="text" class="chatting" />
              <input type="button" value="입력" class="chat_send" />
            </div>
          </form>
        </div>
      </div>
    </div>

    <script src="${path}/resources/js/"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  </body>
</html>
