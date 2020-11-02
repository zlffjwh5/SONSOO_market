<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#star_grade a {
	text-decoration: none;
	color: gray;
}

#star_grade a.on {
	color: hotpink;
}
</style>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link
	href="https://fonts.googleapis.com/css?family=Lato:100,300,400,700,900"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300,400,700"
	rel="stylesheet">
<link rel="stylesheet"
	href="/resources/css/open-iconic-bootstrap.min.css">
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

	<jsp:include page="../includes/menu.jsp" />

	<div class="hero-wrap hero-bread"
		style="background-image: url('/resources/images/bg_6.jpg');">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<h1 class="mb-0 bread">Login</h1>
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index.html">Home</a></span> <span>Contact</span>
					</p>
				</div>
			</div>
		</div>
	</div>

	<div class="col-md-4 col-md-offset-4" style="margin-left: 25%;">
		<h3 class="form-signin-heading">Login</h3>


		<!-- 상품목록페이지에서 상품상세 페이지로 넘어갈때
			  상품에 맞는 리뷰 리스트를 뿌려주려면 get방식일때는 
			  넘어오는 url주소 뒤에 ?p_id=블라블라 해줘서 넘기면 
			  상품에 맞는 리뷰 출력 가능
			  post방식으로 넘길때는 form태그 안에 
			  input hidden태그 이용해서 넘겨주면 상품에 맞는 리뷰 출력 가능
		 -->

		<form action="loginPost" method="post">

			<input type="hidden" value="test2" name="p_id">
			<!-- <input type="hidden" value="1" name="pageNum"> -->
			<!-- <input type="hidden" value="6" name="amount"> -->

			<div class="form-group">
				<label for="inputUserName" class="sr-only">User Name</label> <input
					type="text" class="form-control" name="id" placeholder="ID"
					required autofocus>
			</div>

			<div class="form-group">
				<label for="inputPassword" class="sr-only">Password</label> <input
					type="password" class="form-control" name="password"
					placeholder="Password" required>
			</div>

			<button type="submit" class="btn btn-primary btn-sm">Customer</button>
			<!-- <button type="submit" class="btn btn-primary btn-sm">Buyer</button> -->
			
			<button type="button" class="btn btn-primary btn-sm" onclick="location.href='/member/join'">Join</button>

		</form>
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