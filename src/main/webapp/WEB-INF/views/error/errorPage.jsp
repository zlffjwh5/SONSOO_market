<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
<title>ERROR 500</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Lato:100,300,400,700,900"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300,400,700"
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

	<jsp:include page="../includes/menu.jsp" />
	<!-- END nav -->

	<div class="hero-wrap hero-bread">
		<div class="container">
			<div class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<c:if test="${requestScope['javax.servlet.error.status_code'] == 400}">
						<h1 class="mb-0 bread">잘못 된 요청입니다.</h1>    
					</c:if>	
					
					<c:if test="${requestScope['javax.servlet.error.status_code'] == 404}">
						<h1 class="mb-0 bread">요청하신 페이지를 찾을 수 없습니다.</h1>    
					</c:if>
					
					<c:if test="${requestScope['javax.servlet.error.status_code'] == 405}">
						<h1 class="mb-0 bread">요청된 메소드가 허용되지 않습니다.</h1>    
					</c:if>
					
					<c:if test="${requestScope['javax.servlet.error.status_code'] == 500}">
						<h1 class="mb-0 bread">잘못 된 접근입니다.</h1>
					</c:if>
					
					<c:if test="${requestScope['javax.servlet.error.status_code'] == 503}">
						<h1 class="mb-0 bread">서비스를 사용할 수 없습니다.</h1>
					</c:if>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<a class="btn btn-primary btn-block" href="/home"> 홈으로 이동하기</a>
		<a class="btn btn-info btn-block" href="javascript:history.back();">뒤로가기</a>
	</div>

	<section class="ftco-section bg-light">
		<div class="container">
			<div class="row justify-content-center mb-3 pb-3">
				<div class="col-md-12 heading-section text-center ftco-animate">
					<h1 class="big">Blog</h1>
					<h2 class="mb-4">추천 판매자 채널</h2>
				</div>
			</div>
		</div>
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm col-md-6 col-lg ftco-animate">
					<div class="product">
						<a href="#" class="img-prod"><img class="img-fluid"
							src="/resources/images/blog.png" alt="Colorlib Template"></a>
						<div class="text py-3 px-3">
							<h3>
								<a href="#">판매자 블로그1</a>
							</h3>
							<hr>
							<p class="bottom-area d-flex">
								<a href="#" class="add-to-cart"><span>구독하기 <i
										class="ion-ios-add ml-1"></i></span></a> <a href="#" class="ml-auto"><span><i
										class="ion-ios-heart-empty"></i></span></a>
							</p>
						</div>
					</div>
				</div>
				<div class="col-sm col-md-6 col-lg ftco-animate">
					<div class="product">
						<a href="#" class="img-prod"><img class="img-fluid"
							src="/resources/images/blog.png" alt="Colorlib Template"></a>
						<div class="text py-3 px-3">
							<h3>
								<a href="#">판매자 블로그2</a>
							</h3>
							<hr>
							<p class="bottom-area d-flex">
								<a href="#" class="add-to-cart"><span>구독하기 <i
										class="ion-ios-add ml-1"></i></span></a> <a href="#" class="ml-auto"><span><i
										class="ion-ios-heart-empty"></i></span></a>
							</p>
						</div>
					</div>
				</div>
				<div class="col-sm col-md-6 col-lg ftco-animate">
					<div class="product">
						<a href="#" class="img-prod"><img class="img-fluid"
							src="/resources/images/blog.png" alt="Colorlib Template"></a>
						<div class="text py-3 px-3">
							<h3>
								<a href="#">판매자 블로그3</a>
							</h3>
							<hr>
							<p class="bottom-area d-flex">
								<a href="#" class="add-to-cart"><span>구독하기 <i
										class="ion-ios-add ml-1"></i></span></a> <a href="#" class="ml-auto"><span><i
										class="ion-ios-heart-empty"></i></span></a>
							</p>
						</div>
					</div>
				</div>
				<div class="col-sm col-md-6 col-lg ftco-animate">
					<div class="product">
						<a href="#" class="img-prod"><img class="img-fluid"
							src="/resources/images/blog.png" alt="Colorlib Template"></a>
						<div class="text py-3 px-3">
							<h3>
								<a href="#">판매자 블로그4</a>
							</h3>
							<hr>
							<p class="bottom-area d-flex">
								<a href="#" class="add-to-cart"><span>구독하기<i
										class="ion-ios-add ml-1"></i></span></a> <a href="#" class="ml-auto"><span><i
										class="ion-ios-heart-empty"></i></span></a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section-parallax">
		<div class="parallax-img d-flex align-items-center">
			<div class="container">
				<div class="row d-flex justify-content-center py-5">
					<div class="col-md-7 text-center heading-section ftco-animate">
						<h1 class="big">Subscribe</h1>
						<h2>Subcribe to our Newsletter</h2>
						<div class="row d-flex justify-content-center mt-5">
							<div class="col-md-8">
								<form action="#" class="subscribe-form">
									<div class="form-group d-flex">
										<input type="text" class="form-control"
											placeholder="Enter email address"> <input
											type="submit" value="Subscribe" class="submit px-3">
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
<script type="text/javascript">
	$(document)	.ready(	function() {

						

						var actionForm = $("#actionForm");

						$(".paginate_button a").on(
								"click",
								function(e) {

									e.preventDefault();// 페이지 이동 막기

									console.log('click');

									actionForm.find("input[name='pageNum']").val($(this).attr("href"));//이동 페이지 설정
									actionForm.submit();
								});

						
					});
</script>

	<jsp:include page="../includes/footer.jsp" />



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

</body>
</html>