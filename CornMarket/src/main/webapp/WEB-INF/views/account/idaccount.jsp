<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Corn-Market</title>
    <link href="../search-id-pw/searchidpw.css" rel="stylesheet">
    <c:set var="path" value="${pageContext.request.contextPath}"/>
    <link rel="stylesheet" href="${path}/resources/css/account/account.css"/>
    
</head>

<body>
   
	<form method="post" action="">
	    <div class="search-idpw-title">
	        <h2>아이디/비밀번호 찾기</h2>
	    </div>
	    <div class="search-wrap">
	        <div class="search-tab">
	            <ul class="search-tab-ul">
	                <li class="search-current">
	                    <div class="search-status-id"><a href="../search-id-pw/searchid.html">아이디 찾기</a></div>
	                </li>
	                <li class="search-current">
	                    <div class="search-status-pw"><a href="../search-id-pw/searchpw.html">비밀번호 찾기</a></div>
	                </li>
	            </ul>
	        </div>
	        <div class="id-search-wrap">
	            <div class="id-search-notice">
	                <span>아이디를 찾을 방법을 선택해주세요.</span>
	            </div>
	            <div class="search-type">
	                <ul>
	                    <li class="type-list-current">
	                        <div class="search-title">
	                            <button type="button" id="search-display" onclick="searchdisplayhp()" class="arrow-dropdown-hp">등록된 휴대폰번호로 찾기</button>
	                        </div>
	                        <div class="search-type-display-hp">
	                            <div class="inputEnter" style="display: block;">
	                                <div class="inputBox">
	                                    <div class="styleInput">
	                                        <input id="memberNm1" name="memberNm" type="text" class="input1"
	                                            placeholder="이름">
	                                        <span id="nameerror" class="delBtn"></span>
	                                    </div>
	                                    <div class="styleInput">
	                                        <input id="memberHp" name="memberHp" type="text" class="input1"
	                                            inputmode="numeric" placeholder="휴대폰번호 (-까지 입력해주세요)">
	                                        <span id="conClear" class="delBtn"></span>
	                                        <p id="hperror" class="error"></p>
	                                    </div>
	                                </div>
	                                <div class="btnArea">
	                                    <button type="submit" onclick="idpopup()" class="btnYellow" id="hpbtnYellow">확인</button>
	                                </div>
	                            </div>
	                        </div>
	                    </li>
	                    <li class="type-list-current">
	                        <div class="search-title">
	                            <button type="button" id="search-display" onclick="searchdisplayemail()" class="arrow-dropdown-email">등록된 이메일로
	                                찾기</button>
	                        </div>
	                        <div class="search-type-display-email">
	                            <div class="inputEnter" style="display: block;">
	                                <form action="<c:url value='/account/id/mail'/" method="POST" name="frm2">
	                                    <div class="inputBox">
	                                        <div class="styleInput">
	                                            <input id="conInput" name="sc.memberIdTmp" value type="text" class="input1"
	                                                placeholder="아이디">
	                                            <span id="iderror" class="delBtn"></span>
	                                        </div>
	                                        <div class="styleInput">
	                                            <input id="memberNm2" name="memberNm" type="text" class="input1"
	                                                placeholder="이름">
	                                            <span id="nameerror" class="delBtn" ></span>
	                                        </div>
	                                        <div class="emailInput-id">
	                                            <div class="styleInput-id">
	                                                <input name="memberEmail" id="memberEmail" type="text" class="inputE-id"
	                                                    placeholder="이메일">
	            
	                                            </div>
	                                            <span class="emaillinep-id">@</span>
	                                            <div class="userSelect-id">
	                                                <select name="memberEmail2" id="memberEmail2"
	                                                    onchange="checkMemEmail()">
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
	                                            <p id="emailerror" class="error"></p>
	                                        </div>
	                                        <div class="btnArea">
	                                            <button type="submit" onclick="idpopup()" class="btnYellow">확인</button>
	                                        </div>
	                                    </div>
	                                </form>
	                            </div>
	                        </div>
	                    </li>
	
	                </ul>
	            </div>
	        </div>
	    </div>
    </form>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="${path}/resources/js/account/account.js"></script>
    

</body>

</html>