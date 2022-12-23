//프로필 수정 팝업
function update_myinfo() {
  //window.open("popup_profile_update.jsp", "popup01", "width=680, height=700");

  //팝업창 화면 가운데로 띄우기
  let popupWidth = 680;
  let popupHeight = 700;
  let popupX = Math.ceil((window.screen.width - popupWidth) / 2);
  let popupY = Math.ceil((window.screen.height - popupHeight) / 2);

  window.open(
    '/market/profile/update',
    'popup01',
    'width=' + popupWidth + ',height=' + popupHeight + ',left=' + popupX + ', top=' + popupY
  );
}
//프로필 이미지 수정 팝업
function change_img() {
  //window.open("popup_profile_img.jsp", "popup02", "width=450, height=300");

  //팝업창 화면 가운데로 띄우기
  let popupWidth = 450;
  let popupHeight = 300;
  let popupX = Math.ceil((window.screen.width - popupWidth) / 2);
  let popupY = Math.ceil((window.screen.height - popupHeight) / 2);

  window.open(
    '/market/profile/update/image',
    'popup02',
    'width=' + popupWidth + ',height=' + popupHeight + ',left=' + popupX + ', top=' + popupY
  );
}
