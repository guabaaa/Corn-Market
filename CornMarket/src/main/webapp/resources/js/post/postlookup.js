const showValue = (target) => {
  const text = target.options[target.selectedIndex].text;

  document.querySelector('#sortway').innerHTML = `${text}`;
};

window.addEventListener('load', function () {
  // data
  let select = {
    최신글: ['선택없음'],
    카테고리: [
      ['', 'B1102', 'A1101', 'C1103', 'D1104', 'E1105', 'F1106'],
      ['선택하세요', '전자기기', '가구,인테리어', '의류', '뷰티,미용', '취미,게임,음반', '반려동물용품'],
    ],
    지역: [
      '강남구',
      '강동구',
      '강서구',
      '강북구',
      '관악구',
      '광진구',
      '구로구',
      '금천구',
      '노원구',
      '동대문구',
      '도봉구',
      '동작구',
      '마포구',
      '서대문구',
      '성동구',
      '성북구',
      '서초구',
      '송파구',
      '영등포구',
      '용산구',
      '양천구',
      '은평구',
      '종로구',
      '중구',
      '중랑구',
    ],
  };

  select.최신글.forEach(function (item) {
    $('#sortchoice2').append(`<option> ${item}</option>`);
  });
  $('#sortchoice1').on('change', function () {
    let key = this.value;

    $('#sortchoice2').empty();

    if (key == '최신글') {
      select.최신글.forEach(function (item) {
        $('#middle').append(`<option> ${item}</option>`);
      });
    } else if (key == '카테고리') {
      for (let i = 0; i < select.카테고리[0].length; i++) {
        $('#sortchoice2').append(`<option value="${select.카테고리[0][i]}"> ${select.카테고리[1][i]}</option>`);
      }
    } else if (key == '지역') {
      select.지역.forEach(function (item) {
        $('#sortchoice2').append(`<option value="${item}"> ${item}</option>`);
      });
    }
  });
});
