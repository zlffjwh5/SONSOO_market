<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Modist - Free Bootstrap 4 Template by Colorlib</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link href="https://fonts.googleapis.com/css?family=Lato:100,300,400,700,900"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300,400,700"
	rel="stylesheet">

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
</head>
<body>

	<jsp:include page="/WEB-INF/views/includes/menu.jsp" />
	
	<!-- END nav -->
	
	<div class="hero-wrap hero-bread" style="background-image: url('/resources/images/bg_6.jpg');">
		<div class="container">
			<div class="row no-gutters slider-text align-items-center justify-content-center">
			<div class="col-md-9 ftco-animate text-center">
				<h1 class="mb-0 bread">SONSOO MY INFO</h1>
				<p class="breadcrumbs">
					<span class="mr-2"><a href="/home">Home</a></span> 
					<span>MY INFO</span>
				</p>
			</div>
			</div>
		</div>
	</div>
	
	<div class="container" style="text-align: center;">
		<h5 style="font-size: 50px; margin-top: 50px; margin-bottom: 50px; text-align: left; color: black;">MY INFO</h5>
	</div>
	<%--  while(rs.next())  --%>
	<%-- <c:forEach var="row" items="${resultSet.rows}"> --%>
		<%-- <c:set var="mail" value="${row.mail}" />
		<c:set var="mail1" value="${mail.split('@')[0]}" />
		<c:set var="mail2" value="${mail.split('@')[1]}" />

		<c:set var="birth" value="${row.birth}" />
		<c:set var="year" value="${birth.split('/')[0]}" />
		<c:set var="month" value="${birth.split('/')[1]}" />
		<c:set var="day" value="${birth.split('/')[2]}" /> --%>
		<div class="container">
			<form class="form-horizontal"
				action="mupdate" method="post">
				<!-- onsubmit="return checkForm()"> -->
				
				<!-- 아이디 -->
				<div class="form-group row">
					<label class="col-sm-2">Id</label>
					<div class="col-sm-3">
						<input name="id" class="form-control" placeholder="id"
							value="${member.id}" readonly>
					</div>
				</div>
				
				<!-- 비밀번호 -->
				<div class="form-group row">
					<label class="col-sm-2">Password</label>
					<div class="col-sm-3">
						<input type="password" name="password" class="form-control"
							placeholder="password">
					</div>
				</div>
				
				<!-- 비밀번호확인 -->
				 <div class="form-group row">
					<label class="col-sm-2">Password Check</label>
					<div class="col-sm-3">
						<input type="password" name="password_confirm"
							class="form-control" placeholder="password_confirm">
						<%-- <input type="button"  class="btn btn-primary" 
	    	      value="password" id="changePassword" 
	    	   name="changePassword"  onclick="changePass('${row.id}')"> --%>
					</div>
				</div> 
				
				<!-- 이름 -->
				<div class="form-group row">
					<label class="col-sm-2">Name</label>
					<div class="col-sm-3">
						<input name="name" class="form-control" placeholder="name"
							value="<c:out value='${member.name}'/>">
					</div>
				</div>

				<%-- <div class="form-group row">
					<label class="col-sm-2">Gender</label>
					<div class="col-sm-10">
						<c:set var="gender" value="${row.gender}" />
						<input name="gender" type="radio" value="Man"
							<c:if test="${gender.equals('Man')}"><c:out value="checked"/></c:if>>Man
						<input name="gender" type="radio" value="Woman"
							<c:if test="${gender.equals('Woman')}"><c:out value="checked"/></c:if>>Woman
					</div>
				</div> --%>

				<%-- <div class="form-group row">
					<label class="col-sm-2">Birthday</label>
					<div class="col-sm-4">
						<input name="birthyy" maxlength="4" placeholder="YYYY" size="6"
							value='<c:out value="${year}"/>'> <select name="birthmm">
							<option value="">M</option>
							<option value="01" <c:if test="${month==01}">selected</c:if>>1</option>
							<option value="02" <c:if test="${month==02}">selected</c:if>>2</option>
							<option value="03" <c:if test="${month==03}">selected</c:if>>3</option>
							<option value="04" <c:if test="${month==04}">selected</c:if>>4</option>
							<option value="05" <c:if test="${month==05}">selected</c:if>>5</option>
							<option value="06" <c:if test="${month==06}">selected</c:if>>6</option>
							<option value="07" <c:if test="${month==07}">selected</c:if>>7</option>
							<option value="08" <c:if test="${month==08}">selected</c:if>>8</option>
							<option value="09" <c:if test="${month==09}">selected</c:if>>9</option>
							<option value="10" <c:if test="${month==10}">selected</c:if>>10</option>
							<option value="11" <c:if test="${month==11}">selected</c:if>>11</option>
							<option value="12" <c:if test="${month==12}">selected</c:if>>12</option>
						</select> <input name="birthdd" maxlength="2" placeholder="DD" size="4"
							value='<c:out value="${day}"/>'>
					</div>
				</div> --%>

				<%-- <div class="form-group row">
					<label class="col-sm-2">E-Mail</label>
					<div class="col-sm-10">
						<input name="mail1" maxlength="50" value="${mail1}">@ <select
							name="mail2">
							<option value="naver.com"
								<c:if test="${mail2=='naver.com'}">selected</c:if>>naver.com</option>
							<option value="daum.net"
								<c:if test="${mail2=='daum.net'}">selected</c:if>>daum.net</option>
							<option value="gmail.com"
								<c:if test="${mail2=='gmail.com'}">selected</c:if>>gmail.com</option>
						</select>
					</div>
				</div> --%>
				
				<!-- 전화번호 -->
				<div class="form-group row">
					<label class="col-sm-2">Phone</label>
					<div class="col-sm-10">
						<input name="phone" maxlength="20" class="form-control"
							placeholder="phone(000-0000-0000)" value='${member.phone}'>
					</div>
				</div>
				
				<!-- 우편번호 -->
				<div class="form-group row">
					<label class="col-sm-2">PostCode</label>
					<div class="col-sm-10">
						<input type="text" id="postcode" placeholder="PostCode"
							name="postcode" value='${member.postcode}'> <input
							type="button" onclick="execDaumPostcode()" value="search"><br>
					</div>
				</div>

				<!-- 주소 -->
				<div class="form-group row">
					<label class="col-sm-2">Address</label>
					<div class="col-sm-10">
						<input name="address" id="address" class="form-control"
							placeholder="address" value='${member.address}'>
					</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-2">ExtraAddress</label>
					<div class="col-sm-10">
						<input id="extraAddress" name="extraAddress" class="form-control"
							placeholder="ExtraAddress" value='${member.extraAddress}'>
					</div>
				</div>

				<div class="form-group row">
					<label class="col-sm-2">DetailAddress</label>
					<div class="col-sm-10">
						<input id="detailAddress" name="detailAddress"
							class="form-control" placeholder="DetailAddress"
							value='${member.detailAddress }'>
					</div>
				</div>

				<div class="form-group row">
            <div class="col-sm-offset-2 col-sm-10">
               <input type="submit" value="UPDATE" class="btn btn-primary">
               
               <button type="button" onclick="resign()" class="btn btn-primary">RESIGN</button>
               <script> 
                  function resign(){ 
                     if(confirm('정말 탈퇴하시겠습니까?')){
                        location.href="/member/mdelete?id=${member.id}";
                     }else{
                        return;
                     }                        
                  } 
               </script>
               <input type="reset" value="CANCEL" class="btn btn-primary" onclick="location.href='/home'">
            </div>
         </div>
			</form>
		</div>
	<%-- </c:forEach> --%>
	
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
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
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
					document.getElementById("extraAddress").value = extraAddr;

				} else {
					document.getElementById("extraAddress").value = '';
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
	
	
	
	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
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
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="/resources/js/google-map.js"></script>
	<script src="/resources/js/main.js"></script>
	<script type="text/javascript" src="/resources/js/message.js"></script>
<jsp:include page="../includes/footer.jsp" />
	
</body>
</html>