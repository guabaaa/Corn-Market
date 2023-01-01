// data
function categoryChange(e) {
  const text = e.options[e.selectedIndex].text;
  $("#sortway").html(text + "로 조회하기");
  var category = [
    "가구,인테리어",
    "전자기기",
    "의류",
    "뷰티,미용",
    "취미,게임,음반",
    "반려동물용품",
  ];
  var town = [
    "종로구",
    "중구",
    "용산구",
    "성동구",
    "광진구",
    "동대문구",
    "중랑구",
    "성북구",
    "강북구",
    "도봉구",
    "노원구",
    "은평구",
    "서대문구",
    "마포구",
    "양천구",
    "강서구",
    "구로구",
    "금천구",
    "영등포구",
    "동작구",
    "관악구",
    "서초구",
    "강남구",
    "송파구",
    "강동구",
  ];

  var target = document.getElementById("sortchoice2");

  if (e.value == "category") var d = category;
  else if (e.value == "town") var d = town;

  target.options.length = 0;

  for (x in d) {
    var opt = document.createElement("option");
    opt.innerHTML = d[x];
    target.appendChild(opt);
  }

  var category = [
    { A1101: "가구,인테리어" },
    { B1102: "전자기기" },
    { C1103: "의류" },
    { D1104: "뷰티,미용" },
    { E1105: "취미,게임,음반" },
    { F1106: "반려동물용품" },
  ];
  var town = [
    { 11010: "종로구" },
    { 11020: "중구" },
    { 11030: "용산구" },
    { 11040: "성동구" },
    { 11050: "광진구" },
    { 11060: "동대문구" },
    { 11070: "중랑구" },
    { 11080: "성북구" },
    { 11090: "강북구" },
    { 11100: "도봉구" },
    { 11110: "노원구" },
    { 11120: "은평구" },
    { 11130: "서대문구" },
    { 11140: "마포구" },
    { 11150: "양천구" },
    { 11160: "강서구" },
    { 11170: "구로구" },
    { 11180: "금천구" },
    { 11190: "영등포구" },
    { 11200: "동작구" },
    { 11210: "관악구" },
    { 11220: "서초구" },
    { 11230: "강남구" },
    { 11240: "송파구" },
    { 11250: "강동구" },
  ];

  for (let i = 0; i < category.length; i++) {
    for (a in category[i]) {
      //console.log(a + category[i][a]);
      var opt = document.createElement("option");
      opt.value = a;
      opt.innerHTML = category[i][a];
    }
  }

  for (let i = 0; i < town.length; i++) {
    for (a in town[i]) {
      //console.log(a + town[i][a]);
      var opt = document.createElement("option");
      opt.value = a;
      opt.innerHTML = town[i];
    }
  }

  let select1 = $("#sortchoice1 option:selected").val();
  let postUrl = $("#post_url").val();
  if (select1 == "recent") {
    window.location.href = postUrl;
  }
}

function categoryList() {
  let select1 = $("#sortchoice1 option:selected").val();
  let select2 = $("#sortchoice2 option:selected").val();
  let postUrl = $("#post_url").val();
  let pathUrl = $("#path_url").val();
  console.log(select1);
  if ((select1 = "category")) {
    console.log(select2);
    $.ajax({
      type: "GET",
      url: postUrl + "/category/" + select2, //카테고리id url로 전송
      dataType: "json",
      success: function (data) {
        //alert('카테고리id 전송 성공');
        let list = data;
        console.log(list[0]);
        $("#recent_list").hide(); //기존 리스트 숨기기
        $("#category_list").empty(); //카테고리 목록 초기화
        list.forEach((post) => {
          var categoryContent =
            '<article class="board-card-top">' +
            '<a class="board-card-link" href="' +
            postUrl +
            "/" +
            post.post_id +
            '">' +
            '<img class="board-card-photo" src="' +
            pathUrl +
            post.post_img +
            '" />' +
            '<div class="board-card-desc">' +
            '<div class="board-card-title">' +
            post.title +
            "</div>" +
            '<div class="board-card-price">' +
            post.price +
            "</div>" +
            '<div class="board-card-region">서울시 ' +
            post.town_name +
            "</div>" +
            "</div> </a> </article>";
          $("#category_list").append(categoryContent); //판매글 하나씩 추가
        });
        $("#category_list").show();
      },
      error: function () {
        alert("error");
      },
    });
  }
}

function showValue() {
  categoryList(); //카테고리별 데이터 가져오기 ajax
}
