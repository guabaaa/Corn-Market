<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <style>
      .popup-wrap {
        background-color: rgba(0, 0, 0, 0.3);
        justify-content: center;
        align-items: center;
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        padding: 15px;
      }

      .popup {
        width: 1000px;
        max-width: 600px;
        border-radius: 10px;
        overflow: hidden;
        background-color: rgb(241, 196, 15);
        font-size: 17px;
        font-weight: bold;
        box-shadow: 5px 10px 10px 1px rgba(0, 0, 0, 0.3);
      }

      .popup-head {
        width: 100%;
        height: 50px;
        display: flex;
        align-items: center;
        justify-content: center;
      }

      .popup-body {
        background-color: #ffffff;
      }
      .body-content {
        padding: 20px;
        position:relative;
      }
      .body-titlebox {
        text-align: center;
        width: 500px;
        height: 350px;
        background-color: red;
        margin: 10px auto;
      }
      .body-contentbox {
        width: 500px;
        height: 100px;
        margin: 10px auto;
        margin-top: 30px;
      }

      .popup-foot {
        width: 100%;
        height: 50px;
        display: flex;
      }

      .pop-btn {
        display: inline-flex;
        width: 50%;
        height: 100%;
        justify-content: center;
        align-items: center;
        float: left;
        color: rgb(255, 255, 255);
        cursor: pointer;
      }
      .pop-btn.confirm {
        border-right: 1px solid black;
      }

      .search_btn {
        width: 100px;
        height: 40px;
        border-radius: 4px;
        border-color: rgb(241, 196, 15);
        background-color: rgb(241, 196, 15);
        color: rgb(255, 255, 255);
        font-weight: bold;
        display: block;
        margin: 20px auto;
      }

      .body_contentbox h3 {
        text-align: center;
      }

      .town_location {
        display: none;
        text-align: center;
      }
      .town_location .town_info{
        color: rgb(61, 0, 202);
      }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
  </head>
  <body>
    <div class="container">
      <div class="popup-wrap" id="popup">
        <div class="popup">
          <div class="popup-head">
            <span class="head-title">동네인증하기</span>
          </div>
          <div class="popup-body">
            <div class="body-content">
              <div class="body-titlebox" id="map" style="position:relative;overflow:hidden;"></div>
              <div class="body-contentbox">
                <h3 class="town_location" id="town_location">현재위치는 <span class="town_info" id="town_info"></span class="town">에 있습니다.</h3>
                <input type="button" class="search_btn" id="search_btn" value="동네인증" />
              </div>
            </div>
          </div>
          <div class="popup-foot">
            <span class="pop-btn confirm" id="confirm" onclick="">인증완료</span>
            <span class="pop-btn close" id="close" onclick="self.close()">창 닫기</span>
          </div>
        </div>
      </div>
    </div>
    <div id="data_div" style="display: none;"></div>

    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=93ce7269a8f7fe1402b282d3008199ed&libraries=services"
    ></script>
    <script>
      //동네찾기 버튼
      function loadEvent() {
        $('#search_btn').click(clickEvent);
      }
      function clickEvent() {
        //alert('dd');
        geoFindMe();
        $('#town_location').show();
      }

      $('document').ready(loadEvent);

      //Geolocation API
      function geoFindMe() {
        if (!navigator.geolocation) {
          alert('사용중인 브라우저에서는 위치 정보를 이용할 수 없습니다.');
        } else {
          navigator.geolocation.getCurrentPosition((position) => {
            const latitude = position.coords.latitude;
            const longitude = position.coords.longitude;
            $('#data_div').html('<li data-latitude=' + latitude +' data-longitude=' + longitude + '>');
            var mapContainer = document.getElementById('map'), // 지도를 표시할 div
              mapOption = {
                //center: new kakao.maps.LatLng(latitude, longitude), // 지도의 중심좌표
                center: new kakao.maps.LatLng(37.55309928363025, 126.91986870947545),
                level: 3, // 지도의 확대 레벨
              };

            // 지도를 생성합니다
            var map = new kakao.maps.Map(mapContainer, mapOption);

            // 주소-좌표 변환 객체를 생성합니다
            var geocoder = new kakao.maps.services.Geocoder();

            var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
              infowindow = new kakao.maps.InfoWindow({ zindex: 1 }); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

            // 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
            searchAddrFromCoords(map.getCenter(), displayCenterInfo);

            // 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
            kakao.maps.event.addListener(map, 'click', function (mouseEvent) {
              searchDetailAddrFromCoords(mouseEvent.latLng, function (result, status) {
                if (status === kakao.maps.services.Status.OK) {
                  var detailAddr = !!result[0].road_address
                    ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>'
                    : '';
                  detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';

                  var content =
                    '<div class="bAddr">' + '<span class="title">법정동 주소정보</span>' + detailAddr + '</div>';

                  // 마커를 클릭한 위치에 표시합니다
                  marker.setPosition(mouseEvent.latLng);
                  marker.setMap(map);

                  // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
                  infowindow.setContent(content);
                  infowindow.open(map, marker);
                }
              });
            });

            // 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
            kakao.maps.event.addListener(map, 'idle', function () {
              searchAddrFromCoords(map.getCenter(), displayCenterInfo);
            });

            function searchAddrFromCoords(coords, callback) {
              // 좌표로 행정동 주소 정보를 요청합니다
              geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);
            }

            function searchDetailAddrFromCoords(coords, callback) {
              // 좌표로 법정동 상세 주소 정보를 요청합니다
              geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
            }

            // 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
            function displayCenterInfo(result, status) {
              if (status === kakao.maps.services.Status.OK) {
                var infoDiv = document.getElementById('town_info');

                for (var i = 0; i < result.length; i++) {
                  // 행정동의 region_type 값은 'H' 이므로
                  if (result[i].region_type === 'H') {
                    infoDiv.innerHTML = result[i].address_name;
                    break;
                  }
                }
              }
            }
          });
        }
      }
		
      geoFindMe();
      
      
      
      //데이터 전송
      $('#confirm').click(clickPost);
      function clickPost() {
        alert('dd');
        ajax();
      }

      function ajax() {
        const product = document.querySelector('li');
        let town_name = $('#town_info').text();
        let latitude = product.dataset.latitude;
        let longitude = product.dataset.longitude;
        let town = {
          town_name: town_name,
          latitude: latitude,
          longitude: longitude
        }
        console.log(town);
        console.log(town_name);
        console.log(latitude);
        console.log(longitude);
        $.ajax({
          type: 'POST',
          url: '<c:url value="/town" />',
          headers: { 'content-type': 'application/json' },
          data: JSON.stringify(town),
          success: function () {
            console.log('데이터 전송 성공');
          },
          error: function () {
            console.log('오류 발생');
          },
        });
      }
      
    </script>
  </body>
</html>
