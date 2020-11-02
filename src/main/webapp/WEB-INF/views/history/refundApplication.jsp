<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>반품신청 페이지</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script>
$(document).ready(function(){
	$('#select').change(function(){
		var eu = $("option:selected", this).val();
		$('#eu').val(eu);
	});	
});

$(document).ready(function(){
	$('#nextStep').click(function(){
		if($('#read').prop('checked') == false){
	    	alert('필수 약관에 동의 하셔야 합니다.');
	    	return false;
		}
    }); // end submit()
}); // end ready()
</script>
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

	<div class="hero-wrap hero-bread"
		style="background-image: url('/resources/images/bg_6.jpg');">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<h1 class="mb-0 bread">반품 신청</h1>
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index.jsp">Home</a></span> <span><a
							href="cart.jsp">Cart</a></span>
					</p>
				</div>
			</div>
		</div>
	</div>
<form action="refund" method="post">
	<section class="ftco-section ftco-cart">
		<div class="container">
			<div class="row">
				<div class="col-md-12 ftco-animate">
					<div class="cart-list">
						<table class="table">
							<thead class="thead-primary">
								<tr class="text-center">
									<th>&nbsp;</th>
									<th>상품</th>
									<th>가격</th>
									<th>수량</th>
									<th>합계</th>
								</tr>
							</thead>
							<tbody>
								<tr class="text-center">

									<td class="image-prod"><div class="img"
											style="background-image: url(/pimage/${buyProduct.tnImage});"></div></td>

									<td class="product-name">
										<h3><a href="/products/product?id=${buyProduct.id }&p_id=${buyProduct.p_id }">${buyProduct.p_name }</a></h3>
										<input name="p_id" value="${buyProduct.p_id }" type="hidden">
										<input name="o_number" value="${buyProduct.o_number }" type="hidden">
										<p>${buyProduct.script }</p>
									</td>

									<td class="price">&#8361;<fmt:formatNumber type="number">${buyProduct.price }</fmt:formatNumber></td>

									<td class="quantity">
										<p>${buyProduct.qty}</p>
									</td>

									<td class="total">&#8361;<fmt:formatNumber type="number">${buyProduct.qty * buyProduct.price}</fmt:formatNumber></td>

								</tr>
								<!-- END TR-->

							</tbody>
						</table>
					</div>
					
					<div class="billing-form bg-light p-3 p-md-5">
						<h3 class="mb-4 billing-heading">반품 사유</h3>
							<div class="row align-items-end">
								<div class="col-md-12">
									<div class="form-group">
										<select id="select" class="form-control">
											<option>단순 변심</option>
											<option >상품 파손 및 변질</option>
											<option >다른 상품으로 재주문</option>
											<option >더 저렴한 가격의 상품 발견</option>
											<option value="" selected>직접 입력</option>
										</select>
									</div>
								</div>
							
								<div class="col-md-12">
									<div class="form-group">
										<input type="text" name="refundMeans" id="eu" class="form-control" placeholder="반품 사유를 입력 해 주세요.">
									</div>
								</div>
								
								<h3 class="mb-4 billing-heading">수거 방법</h3>
								<div class="col-md-12">
									<div class="form-group">
										<select id="select" class="form-control" name="refundSystem">
											<option selected>방문 수거[배송지]</option>
											<option>택배 발송[착불]</option>
										</select>
									</div>
								</div>
								
								<div class="col-md-12 text-right">
									<div class="form-group">
										<label>
											<input type="checkbox" id="read" class="mr-2">
											<a onclick="window.open(this.href, '_blank', 'width=950px,height=370px,toolbars=no,scrollbars=no,left=450,top=200'); 
																return false;" href="clause">약관</a>을 읽었으며, 이에 동의하겠습니다.
										</label>
									</div>
								</div>

							<div class="col-md-12">
									<div class="form-group">
										<input class="btn btn-primary py-3 px-4 btn-block" id="nextStep" type="submit" value="제출하기">
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</form>
		<!-- .col-md-8 -->
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