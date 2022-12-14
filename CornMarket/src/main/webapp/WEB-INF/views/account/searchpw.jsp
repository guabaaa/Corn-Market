<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>아이디/비밀번호 찾기</title>
    <link rel="stylesheet" href="${path}/resources/css/searchidpw.css" />
  </head>
  <body>
    <div class="search-idpw-title">
      <h2>아이디/비밀번호 찾기</h2>
    </div>
    <div class="search-wrap">
      <div class="search-tab">
        <ul class="search-tab-ul">
          <li class="search-current">
            <div class="search-status-id"><a href="<c:url value="/account/id" />">아이디 찾기</a></div>
          </li>
          <li class="search-current">
            <div class="search-status-pw"><a href="<c:url value="/account/pw" />">비밀번호 찾기</a></div>
          </li>
        </ul>
      </div>
      <div class="id-search-wrap">
        <div class="id-search-notice">
          <span
            >비밀번호를 찾을 방법을 선택해주세요.
            <br />
            본인확인 후 비밀번호를 다시 설정할 수 있습니다.
          </span>
        </div>
        <div class="search-type">
          <ul>
            <li class="type-list-current">
              <div class="search-title">
                <button type="button">등록된 휴대폰번호로 찾기</button>
              </div>
              <div class="inputEnter" style="display: block">
                <div class="inputBox">
                  <div class="styleInput">
                    <input id="conInput" name="sc.memberIdTmp" value type="text" class="input1" placeholder="아이디" />
                    <span id="conClear" class="delBtn" style="display: none"></span>
                  </div>
                  <div class="styleInput">
                    <input id="memberNm1" name="memberNm" type="text" class="input1" placeholder="이름" />
                    <span id="conClear" class="delBtn" style="display: none"></span>
                  </div>
                  <div class="styleInput">
                    <input
                      id="memberHp"
                      name="memberHp"
                      type="text"
                      class="input1"
                      inputmode="numeric"
                      placeholder="휴대폰번호 (-없이 입력)"
                    />
                    <span id="conClear" class="delBtn" style="display: none"></span>
                    <p class="error" style="display: none"></p>
                  </div>
                </div>
                <div class="btnArea">
                  <button type="submit" onclick="" class="btnYellow">확인</button>
                </div>
              </div>
            </li>
            <li class="type-list-current">
              <div class="search-title">
                <button type="button">등록된 이메일로 찾기</button>
              </div>
              <div class="inputEnter" style="display: block">
                <div class="inputBox">
                  <div class="styleInput">
                    <input id="conInput" name="sc.memberIdTmp" value type="text" class="input1" placeholder="아이디" />
                    <span id="conClear" class="delBtn" style="display: none"></span>
                  </div>
                  <div class="styleInput">
                    <input id="memberNm2" name="memberNm" type="text" class="input1" placeholder="이름" />
                    <span id="conClear" class="delBtn" style="display: none"></span>
                  </div>
                  <div class="emailInput">
                    <div class="styleInput">
                      <input name="memberEmail" id="memberEmail" type="text" class="inputE" placeholder="이메일" />
                      <span id="conClear" class="delBtn" style="display: none"></span>
                    </div>
                    <div class="userSelect">
                      <select name="memberEmail2" id="memberEmail2" onchange="checkMemEmail()">
                        <option value="etc">직접입력</option>
                        <option value="gmail.com">gmail.com</option>
                        <option value="hanmail.net">hanmail.net</option>
                        <option value="hotmail.com">hotmail.com</option>
                        <option value="nate.com">nate.com</option>
                        <option value="naver.com">naver.com</option>
                        <option value="yahoo.co.kr">yahoo.co.kr</option>
                        <option value="yahoo.com">yahoo.com</option>
                      </select>
                    </div>
                    <p class="error" style="display: none"></p>
                  </div>
                  <div class="btnArea">
                    <button type="submit" onclick="" class="btnYellow">확인</button>
                  </div>
                </div>
              </div>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </body>
</html>
