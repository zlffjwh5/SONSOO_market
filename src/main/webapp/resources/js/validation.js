function CheckAddMember() {
   var id = document.getElementById("id");
   var password = document.getElementById("password");
   var password_confirm = document.getElementById("password_confirm");
   var name = document.getElementById("name");
   var phone = document.getElementById("phone");
   var postcode = document.getElementById("postcode");
   var address = document.getElementById("address");
   var detailAddress = document.getElementById("detailAddress");
   var ccc = document.getElementById("ccc");

   // 아이디체크
   if (!check(/^[A-za-z]{5,15}$/, id,
         "[아이디]\n영문 대문자 또는 소문자로 시작하는 아이디, 길이는 5~15자")) {
      return false;
   }

   // 비밀번호 체크
   if (password.value.length < 4 || password.value.length > 12) {
      alert("[비밀번호]\n최소 4자에서 최대 12자까지 입력하세요");
      password.select();
      password.focus();
      return false;
   }

   // 비밀번호 확인
   if (password.value != password_confirm.value) {
      alert("[비밀번호]\비밀번호가 다릅니다.");
      password_confirm.select();
      password_confirm.focus();
      return false;
   }

   // 성명 체크
   if (name.value == null) {
      alert("[성명]\n성명을 입력하세요.");
      name.select();
      name.focus();
      return false;
   }

   // 전화번호체크
   if (phone.length == 0) {
      alert("[전화번호]\n 전화번호를 입력하세요");
      phone.focus();
      return false;
   }

   // 우편번호체크
   if (postcode == null) {
      alert("[우편번호]\n우편번호를 입력하세요.")
      postcode.select();
      postcode.focus();
      return false;
   }

   // 상세주소체크
   if (detailAddress == null) {
      alert("[상세주소]\n상세주소를 입력하세요.")
      detailAddress.select();
      detailAddress.focus();
      return false;
   }
   
   if(password.value!=password_confirm.value){
   	alert("비밀번호가 일치하지않습니다");
   	return false;
   }
   
   if(ccc.value != "success"){
   	alert("아이디 중복체크를 해주세요 :D");
   	return false;
   }

   function check(regExp, e, msg) {
      if (regExp.test(e.value)) {
         return true;
      }
      alert(msg);
      e.select();
      e.focus();
      return false;
   }
   
   
   document.join.submit();
}