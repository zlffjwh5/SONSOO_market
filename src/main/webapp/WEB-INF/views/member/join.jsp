<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head><title>Modist - Free Bootstrap 4 Template by Colorlib</title><meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link href="https://fonts.googleapis.com/css?family=Lato:100,300,400,700,900" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300,400,700" rel="stylesheet">

<link rel="stylesheet" href="/resources/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/animate.css">

<link rel="stylesheet" href="/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="/resources/css/owl.theme.default.min.css">
<link rel="stylesheet" href="/resources/css/magnific-popup.css">

<link rel="stylesheet" href="/resources/css/aos.css">

<link rel="stylesheet" href="/resources/css/ionicons.min.css">

<link rel="stylesheet" href="/resources/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="/resources/css/jquery.timepicker.css">


<link rel="stylesheet" href="/resources/css/flaticon.css">
<link rel="stylesheet" href="/resources/css/icomoon.css">
<link rel="stylesheet" href="/resources/css/style.css">

<script src="/resources/js/validation.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
   $(document).ready(function(){
      $('#dupCheck').click(function(){
         // alert('X');
        $.ajax({
            type:'GET',//요청메소드 방식
            url:'idcheckAjax?id='+$('#id').val(),
            dataType:"text",//요청한 결과 값의 타입
            success:function(data){//콜백함수
              alert($.trim(data));
               
               if($.trim(data)=="exists"){//이미 존재하면 fail값(사용할 수 없는 아이디입니다)
                  $('#result').removeClass();//동적으로 class제거
                  $('#result').addClass("badge badge-danger");
                  $('#result').html('이미 사용중인 id입니다.');
                  $('#id').val(' ');
                  $('#id').focus();
                  $('#id').attr(false); 
               }else{//사용가능하면 success값
                  $('#result').removeClass();//동적으로 class제거
                  $('#result').addClass("badge badge-success");
                  $('#result').html('사용가능한 id입니다.');
                  $('#password').focus();
                  $('#ccc').val("success");
                  $('#idChecked').val('true');
               } 
            }
         });
      });
   });
</script>
<!-- <script>
function checkForm(){
   var checked = document.getElementById('idChecked').value; // 스크립트용
   var checked=$('#idChecked').val(); // 제이쿼리 용
   if(checked=='false'){
      alert('아이디 체크를 해주세요');
      return false;
   }
}
</script> -->
</head>
<body>

	<jsp:include page="/WEB-INF/views/includes/menu.jsp" />

	<!-- END nav -->
	
	<div class="hero-wrap hero-bread" style="background-image: url('/resources/images/bg_6.jpg');">
		<div class="container">
			<div class="row no-gutters slider-text align-items-center justify-content-center">
			<div class="col-md-9 ftco-animate text-center">
				<h1 class="mb-0 bread">SONSOO JOIN</h1>
				<p class="breadcrumbs">
					<span class="mr-2"><a href="/home">Home</a></span> 
					<span>JOIN</span>
				</p>
			</div>
			</div>
		</div>
	</div>

<div class="container" style="text-align: center;">
		<h5 style="font-size: 50px; margin-top: 50px; margin-bottom: 50px; text-align: left; color: black;">MEMBERSHIP JOIN</h5>
	</div>

<div class="container">
	<form  class="form-horizontal" 
			  action="join" method="post">
		 
		 <div class="form-group row">
		 	<label class="col-sm-2">Id</label>
		 	<div class="col-sm-3">
		 		<input name="id" id="id" class="form-control" placeholder="id">
		 		<input type="button" value="Checked" class="btn btn-primary" id="dupCheck" style="margin-top: 10px;">
		 		<input type="hidden" id="idChecked" name="idChecked" value='false'><br>
		 		<label id="result" class="badge badge-success"></label>
		 	</div>
		 </div>
		 
		 <div class="form-group row">
		 	<label class="col-sm-2">Password</label>
		 	<div class="col-sm-3">
		 		<input type="password" name="password" id="password" class="form-control" placeholder="password">
		 	</div>
		 </div>
		 
		 <div class="form-group row">
		 	<label class="col-sm-2">Password Check</label>
		 	<div class="col-sm-3">
		 		<input type="password" name="password_confirm" id="password_confirm" class="form-control" placeholder="password_confirm" >
		 	</div>
		 </div>
		 
		 <div class="form-group row">
		 	<label class="col-sm-2">Name</label>
		 	<div class="col-sm-3">
		 		<input name="name" id="name" class="form-control" placeholder="name" >
		 		<input type="hidden" name="ccc" id="ccc" class="form-control" placeholder="name" value="">
		 	</div>
		 </div>
		 
		 <!-- <div class="form-group row">
		 	<label class="col-sm-2">Gender</label>
		 	<div class="col-sm-10">
		 		<input name="gender" id="gender" type="radio" value="남" checked="checked" >Man
		 		<input name="gender" id="gender" type="radio" value="여" style="margin-left: 10px;">Woman
		 	</div>
		 </div> -->
		 
		 <!-- <div class="form-group row">
		 	<label class="col-sm-2">Birthday</label>
		 	<div class="col-sm-4">
		 		<input id="birthyy" name="birthyy" maxlength="4" placeholder="yyyy" size="6" >
				<select name="birthmm" id="birthmm" >
					<option value="">M</option>
					<option value="01">1</option>
					<option value="02">2</option>
					<option value="03">3</option>
					<option value="04">4</option>
					<option value="05">5</option>
					<option value="06">6</option>
					<option value="07">7</option>
					<option value="08">8</option>
					<option value="09">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
				</select>
				<input id="birthdd" name="birthdd" maxlength="2" placeholder="dd" size="4" >
		 	</div>
		 </div> -->
		 
		<!--  <div class="form-group row">
		 	<label class="col-sm-2">E-Mail</label>
		 	<div class="col-sm-10">
		 		<input id="mail1" name="mail1" maxlength="50" placeholder="e-mail">@
				<select name="mail2" >
					<option value="naver.com">naver.com</option>
					<option value="daum.net">daum.net</option>
					<option value="gmail.com">gmail.com</option>
				</select>
		 	</div>
		 </div> -->
		 
		 <div class="form-group row">
		 	<label class="col-sm-2">Phone</label>
		 	<div class="col-sm-5">
		 		<input id="phone" name="phone" maxlength="20" class="form-control" placeholder="phone">
		 	</div>
		 </div>
		 
		 <div class="form-group row">
		 	<label class="col-sm-2">PostCode</label>
		 	<div class="col-sm-10">
		 		<input type="text" id="postcode" placeholder="postcode" name="postcode">
		 		<input type="button" onclick="execDaumPostcode()" value="search" class="btn btn-primary"><br>
		 	</div>
		 </div>
		 
		 <div class="form-group row">
		 	<label class="col-sm-2">Address</label>
		 	<div class="col-sm-10">
		 		<input name="address" id="address" maxlength="20" class="form-control" placeholder="address">
		 	</div>
		 </div>
		 
		 <div class="form-group row">
		 	<label class="col-sm-2">ExtraAddress</label>
		 	<div class="col-sm-10">
		 		<input id="extraAddress" name="extraAddress" class="form-control" placeholder="extraAddress">
		 	</div>
		 </div>		 
		 
		 <div class="form-group row">
		 	<label class="col-sm-2">DetailAddress</label>
		 	<div class="col-sm-10">
		 		<input id="detailAddress" name="detailAddress" placeholder="detailAddress">
		 	</div>
		 </div>
		 		
		 <div class="form-group row">
		 	<div class="col-sm-offset-2 col-sm-10">
		 		<input type="submit" value="Submit" class="btn btn-primary" onclick="return CheckAddMember()">
		 		<!-- <input type="reset" value="Cancel" class="btn btn-primary"> -->
		 		<input type="reset" value="Reset" class="btn btn-primary">
		 		<button type="button" class="btn btn-primary" onclick="location.href='/home'">Cancel</button>
		 	</div>
		 </div>
		 
	</form>
</div>







































<!-- loader -->
<div id="ftco-loader" class="show fullscreen">
<svg class="circular" width="48px" height="48px">
	<circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/>
	<circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/>
</svg>
</div>
<script src="/resources/js/jquery.min.js"></script>
<script src="/resources/js/jquery-migrate-3.0.1.min.js"></script>
<script src="/resources/js/popper.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/js/jquery.easing.1.3.js"></script>
<script src="/resources/js/jquery.waypoints.min.js"></script>
<script src="/resources/js/jquery.stellar.min.js"></script>
<script src="/resources/js/owl.carousel.min.js"></script>
<script src="/resources/js/jquery.magnific-popup.min.js"></script>
<script src="/resources/js/aos.js"></script>
<script src="/resources/js/jquery.animateNumber.min.js"></script>
<script src="/resources/js/bootstrap-datepicker.js"></script>
<script src="/resources/js/scrollax.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
<script src="/resources/js/google-map.js"></script>
<script src="/resources/js/main.js"></script>
<script type="text/javascript" src="/resources/js/message.js"></script>
<jsp:include page="../includes/footer.jsp" />
</body>
</html>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = ' ';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
</script>
