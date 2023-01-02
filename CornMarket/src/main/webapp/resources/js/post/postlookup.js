// data
function categoryChange(e) {
  const text = e.options[e.selectedIndex].text;
  $('#sortway').html(text + '로 조회하기');

  let select1 = $('#sortchoice1 option:selected').val();
  let postUrl = $('#post_url').val();
  if (select1 == 'recent') {
    window.location.href = postUrl;
  }
  var target = document.getElementById('sortchoice2');

  target.options.length = 0;

  var category = [
    { '': '선택하세요' },
    { A1101: '가구,인테리어' },
    { B1102: '전자기기' },
    { C1103: '의류' },
    { D1104: '뷰티,미용' },
    { E1105: '취미,게임,음반' },
    { F1106: '반려동물용품' },
  ];
  var town = [
  	{ '': '선택하세요' },
    { 11010: '종로구' },
    { 11020: '중구' },
    { 11030: '용산구' },
    { 11040: '성동구' },
    { 11050: '광진구' },
    { 11060: '동대문구' },
    { 11070: '중랑구' },
    { 11080: '성북구' },
    { 11090: '강북구' },
    { 11100: '도봉구' },
    { 11110: '노원구' },
    { 11120: '은평구' },
    { 11130: '서대문구' },
    { 11140: '마포구' },
    { 11150: '양천구' },
    { 11160: '강서구' },
    { 11170: '구로구' },
    { 11180: '금천구' },
    { 11190: '영등포구' },
    { 11200: '동작구' },
    { 11210: '관악구' },
    { 11220: '서초구' },
    { 11230: '강남구' },
    { 11240: '송파구' },
    { 11250: '강동구' },
  ];

  if (e.value == 'category') var d = category;
  else if (e.value == 'town') var d = town;
  console.log('선택 개수:' + d.length);

  /*
  for (x in d) {
    var opt = document.createElement('option');
    opt.innerHTML = d[x];
    opt.value = x;
    target.appendChild(opt);
  }
  */

  for (let i = 0; i < d.length; i++) {
    for (a in d[i]) {
      //console.log(a + category[i][a]);
      var opt = document.createElement('option');
      opt.value = a;
      //console.log(opt.value);
      opt.innerHTML = d[i][a];
      target.appendChild(opt);
    }
  }
  /*
  for (let i = 0; i < d.length; i++) {
    for (a in d[i]) {
      //console.log(a + town[i][a]);
      var opt = document.createElement('option');
      opt.value = a;
      opt.innerHTML = d[i];
      target.appendChild(opt);
    }
  }
  */
}

function categoryList() {
  let select1 = $('#sortchoice1 option:selected').val();
  let select2 = $('#sortchoice2 option:selected').val();
  let postUrl = $('#post_url').val();
  let pathUrl = $('#path_url').val();
  console.log(select1);
  if ((select1 = 'category')) {
    console.log(select2);
    $.ajax({
      type: 'GET',
      url: postUrl + '/category/' + select2, //카테고리id url로 전송
      dataType: 'json',
      success: function (data) {
        //alert('카테고리id 전송 성공');
        let list = data;
        console.log(list[0]);
        $('#recent_list').hide(); //기존 리스트 숨기기
    	$('#town_list').hide();
        $('#category_list').empty(); //카테고리 목록 초기화
        list.forEach((post) => {
          var categoryContent =
            '<article class="board-card-top">' +
            '<a class="board-card-link" href="' +
            postUrl +
            '/' +
            post.post_id +
            '">' +
            '<img class="board-card-photo" src="' +
            pathUrl +
            post.post_img +
            '" />' +
            '<div class="board-card-desc">' +
            '<div class="board-card-title">' +
            post.title +
            '</div>' +
            '<div class="board-card-price">' +
            post.price +
            '</div>' +
            '<div class="board-card-region">서울시 ' +
            post.town_name +
            '</div>' +
            '</div> </a> </article>';
          $('#category_list').append(categoryContent); //판매글 하나씩 추가
        });
        $('#category_list').show();
      },
      error: function () {
        alert('올바르게 선택해주세요.');
      },
    });
  }
}

function townList() {
  let select1 = $('#sortchoice1 option:selected').val();
  let select2 = $('#sortchoice2 option:selected').val();
  let postUrl = $('#post_url').val();
  let pathUrl = $('#path_url').val();
  console.log(select1);
  if ((select1 = 'town')) {
    console.log(select2);
    $.ajax({
      type: 'GET',
      url: postUrl + '/town/' + select2, //townid url로 전송
      dataType: 'json',
      success: function (data) {
        //alert('카테고리id 전송 성공');
        let list = data;
        console.log(list[0]);
        $('#recent_list').hide(); //기존 리스트 숨기기
    	$('#category_list').hide();
        $('#town_list').empty(); //카테고리 목록 초기화
        list.forEach((post) => {
          var townContent =
            '<article class="board-card-top">' +
            '<a class="board-card-link" href="' +
            postUrl +
            '/' +
            post.post_id +
            '">' +
            '<img class="board-card-photo" src="' +
            pathUrl +
            post.post_img +
            '" />' +
            '<div class="board-card-desc">' +
            '<div class="board-card-title">' +
            post.title +
            '</div>' +
            '<div class="board-card-price">' +
            post.price +
            '</div>' +
            '<div class="board-card-region">서울시 ' +
            post.town_name +
            '</div>' +
            '</div> </a> </article>';
          $('#town_list').append(townContent); //판매글 하나씩 추가
        });
        $('#town_list').show();
      },
      error: function () {
        alert('올바르게 선택해주세요.');
      },
    });
  }
}

function showValue() {
  categoryList(); //카테고리별 데이터 가져오기 ajax
  townList();	  //지역별 데이터 가져오기 ajax
}

/*
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
  */
