<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SONSOO</title>
<style>
#star_grade a {
	text-decoration: none;
	color: gray;
}

#star_grade a.on {
	color: #f1b8c4;
}
</style>
<script>
	function addToCart() {
		var memberId = '<c:out value="${memberId}"/>';
		var productstock = '<c:out value="${product.stock}"/>';
		var stock = document.getElementById('quantity').value;
		if (!memberId) {
			alert("로그인 먼저 해주세요");
			return;
		}

		if(stock > productstock){
			alert("재고가 부족합니다!!");
			return false;
			}
		if (confirm("상품을 장바구니에 추가하시겠습니까?")) {
			document.addForm.submit();
		} else {
			document.addForm.reset();
		}
	}
</script>
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
<link rel="stylesheet" href="/resources/css2/style.css">
<link rel="stylesheet" href="/resources/css2/responsive.css">
</head>

<body>
	<jsp:include page="../includes/menu.jsp" />
	<div class="hero-wrap hero-bread"
		style="background-image: url('/resources/images/bg_6.jpg');">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<h1 class="mb-0 bread">SONSOO PRODUCT</h1>
					<p class="breadcrumbs">
						<br>
						<c:choose>
							<c:when test="${memberId==product.id}">
								<button data-oper="modify" class="btn btn-primary py-1 px-2">상품
									수정</button>
								<!-- <button data-oper="list" class="btn btn-primary py-1 px-2">상품 목록</button>	 -->
							</c:when>
						</c:choose>
					</p>
				</div>
			</div>
		</div>
	</div>



	<section class="ftco-section bg-light">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 mb-5 ftco-animate">
					<img src="/pimage/${product.tnImage}" class="img-fluid"
						alt="Colorlib Template">
				</div>
				<div class="col-lg-6 product-details pl-md-5 ftco-animate">

					<h3>${product.name}</h3>
					<p class="price">
						<span>${product.price}원</span>
					</p>
					<p>${product.script}</p>
					<p>
						판매자 : <a href="/products/productListSeller?id=${product.id}">${product.id}</a>
					</p>


					<!-- 장바구니 -->
					<form name="addForm" action="/products/cartPost" method="post">
						<div class="row mt-4">
							<div class="input-group col-md-6 d-flex mb-3">
								<span class="input-group-btn mr-2">
									<button type="button" class="quantity-left-minus btn"
										data-type="minus" data-field="">
										<i class="ion-ios-remove"></i>
									</button>
								</span> <input type="number" id="quantity" name="quantity" class="form-control input-number" value="1" min="1" max="${product.stock}">
								<span class="input-group-btn ml-2">
									<button type="button" class="quantity-right-plus btn"
										data-type="plus" data-field="">
										<i class="ion-ios-add"></i>
									</button>
								</span>
							</div>
						</div>
						<input type="hidden" name="id" value="${memberId}"> <input
							type="hidden" id='p_id' name='p_id'
							value='<c:out value="${product.p_id}"/>'> <input
							type="button" class="btn btn-primary py-3 px-12"
							style="float: bottom;" value='Add to Cart' onclick="addToCart()">
					</form>

				</div>
			</div>
		</div>
	</section>
	<!-- 이동할 폼 생성 -->
	<form id="operForm" action="/products/productModify" method="get">
		<input type="hidden" id="p_id" name="p_id"
			value='<c:out value="${product.p_id}"/>'> <input
			type="hidden" id='pageNum' name='pageNum'
			value='<c:out value="${cri.pageNum}"/>'> <input type="hidden"
			id='amount' name='amount' value='<c:out value="${cri.amount}"/>'>
	</form>


	<!-- 상세페이지 -->
	<section class="product_description_area">
		<div class="container">
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item"><a class="nav-link" id="home-tab"
					data-toggle="tab" href="#home" role="tab" aria-controls="home"
					aria-selected="true">Description</a></li>
				<li class="nav-item"><a class="nav-link" id="profile-tab"
					data-toggle="tab" href="#profile" role="tab"
					aria-controls="profile" aria-selected="false">Specification</a></li>
				<li class="nav-item"><a class="nav-link" id="contact-tab"
					data-toggle="tab" href="#contact" role="tab"
					aria-controls="contact" aria-selected="false">Message</a></li>
				<li class="nav-item"><a class="nav-link active" id="review-tab"
					data-toggle="tab" href="#review" role="tab" aria-controls="review"
					aria-selected="false">Reviews</a></li>
			</ul>
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade" id="home" role="tabpanel"
					aria-labelledby="home-tab">
					<p>Beryl Cook is one of Britain’s most talented and amusing
						artists .Beryl’s pictures feature women of all shapes and sizes
						enjoying themselves .Born between the two world wars, Beryl Cook
						eventually left Kendrick School in Reading at the age of 15, where
						she went to secretarial school and then into an insurance office.
						After moving to London and then Hampton, she eventually married
						her next door neighbour from Reading, John Cook. He was an officer
						in the Merchant Navy and after he left the sea in 1956, they
						bought a pub for a year before John took a job in Southern
						Rhodesia with a motor company. Beryl bought their young son a box
						of watercolours, and when showing him how to use it, she decided
						that she herself quite enjoyed painting. John subrnouently bought
						her a child’s painting set for her birthday and it was with this
						that she produced her first significant work, a half-length
						portrait of a dark-skinned lady with a vacant expression and large
						drooping breasts. It was aptly named ‘Hangover’ by Beryl’s husband
						and</p>
					<p>It is often frustrating to attempt to plan meals that are
						designed for one. Despite this fact, we are seeing more and more
						recipe books and Internet websites that are dedicated to the act
						of cooking for one. Divorce and the death of spouses or grown
						children leaving for college are all reasons that someone
						accustomed to cooking for more than one would suddenly need to
						learn how to adjust all the cooking practices utilized before into
						a streamlined plan of cooking that is more efficient for one
						person creating less</p>
				</div>
				<div class="tab-pane fade" id="profile" role="tabpanel"
					aria-labelledby="profile-tab">
					<div class="table-responsive">
						<table class="table">
							<tbody>
								<tr>
									<td><h5>Width</h5></td>
									<td><h5>128mm</h5></td>
								</tr>
								<tr>
									<td><h5>Height</h5></td>
									<td><h5>508mm</h5></td>
								</tr>
								<tr>
									<td><h5>Depth</h5></td>
									<td><h5>85mm</h5></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="tab-pane fade" id="contact" role="tabpanel"
					aria-labelledby="contact-tab">
					<section class="login_box_area p_120"
						style="padding: 20px 0px 20px 0px;">
						<div class="container">
							<div class="row">
								<div class="col-lg-6">
									<div class="login_box_img"
										style="margin-right: 30px; margin-top: 30px;">
										<img class="img-fluid" src="/resources/images/MsgEnvelope.png">
									</div>
								</div>
								<div class="col-lg-6">
									<div class="login_form_inner" style="padding: 0px;">
										<h3 style="padding-top: 80px;">Send a Message to the
											artist</h3>
										<div class="col-md-12 form-group">
											<input type="text" class="form-control" id="sendMsgTitle"
												placeholder="Title">
										</div>
										<div class="col-md-12 form-group">
											<textarea id="sendMsgContent" rows="6" cols="20"
												class="form-control" placeholder="Content"></textarea>
										</div>
										<div class="col-md-12 form-group">
											<button type="submit" id="addMessageBtn"
												class="btn submit_btn">Add Message</button>
										</div>

									</div>
								</div>
							</div>
						</div>
					</section>
				</div>

				<div class="tab-pane fade show active" id="review" role="tabpanel"
					aria-labelledby="review-tab">
					<div class="row">
						<div class="col-lg-6">
							<div class="row total_rate">
								<div class="col-6">
									<div class="box_total">
										<h5>Star Point Avg</h5>
										<h4>${starAvg}</h4>
										<h6>(${starCnt} Reviews)</h6>
									</div>
								</div>
								<div class="col-6">
									<div class="rating_list">
										<h3>Based on 3 Reviews</h3>
										<ul class="list">
											<li><a href="#">5 Star <i
													style="font-style: normal;">&nbsp;★ ★ ★ ★ ★&nbsp;&nbsp;</i>(${star5})
											</a></li>
											<li><a href="#">4 Star <i
													style="font-style: normal;">&nbsp;★ ★ ★ ★ ☆&nbsp;&nbsp;</i>(${star4})
											</a></li>
											<li><a href="#">3 Star <i
													style="font-style: normal;">&nbsp;★ ★ ★ ☆ ☆&nbsp;&nbsp;</i>(${star3})
											</a></li>
											<li><a href="#">2 Star <i
													style="font-style: normal;">&nbsp;★ ★ ☆ ☆ ☆&nbsp;&nbsp;</i>(${star2})
											</a></li>
											<li><a href="#">1 Star <i
													style="font-style: normal;">&nbsp;★ ☆ ☆ ☆ ☆&nbsp;&nbsp;</i>(${star1})
											</a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="review_list">

								<c:choose>
									<c:when test="${!empty review}">
										<c:forEach items="${review}" var="review">
											<div class="review_item" style="margin-top: 20px;">
												<div class="media">
													<div class="d-flex">
														<img src="/resources/images/user.png"
															style="width: 50px; height: 50px;">
													</div>
													<div class="media-body">
														<h4>${review.id}</h4>
														<c:forEach begin="1" end="${review.star}">
															<i style="font-style: normal;">★</i>
														</c:forEach>
													</div>
												</div>
												<a href="detailsReview?rno=${review.rno}"
													style="font-size: 15px;"><p style="color: black;">${review.title}</p></a>
												<hr>
											</div>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<div class="center">
											<hr>
											<img src='/resources/images/speech-bubble.png'
												style='opacity: 0.3; margin-left: 30%;'><br>
											<h4
												style='text-align: center; margin: 20px 0px 20px 0px; opacity: 0.4;'>Please
												leave your first review :D</h4>
											<hr>
										</div>
									</c:otherwise>
								</c:choose>


							</div>

							<div class="col text-center" style="margin-top: 50px;">
								<div class="block-27">
									<ul>
										<c:if test="${pageMaker.prev}">
											<li class='paginate_button'><a
												href="${pageMaker.startPage -1}">&lt;</a></li>
										</c:if>

										<c:forEach var="num" begin="${pageMaker.startPage}"
											end="${pageMaker.endPage}">
											<li
												class='paginate_button ${pageMaker.cri.pageNum == num ? "active":""}'><a
												href="${num}">${num}</a></li>
										</c:forEach>

										<c:if test="${pageMaker.next}">
											<li class='paginate_button'><a
												href="${pageMaker.endPage +1}">&gt;</a></li>
										</c:if>
									</ul>
								</div>
							</div>

							<form id="actionForm"
								action="product?id=${param.id}&p_id=${param.p_id}#review"
								method="get">
								<input type="hidden" name="id" value="${param.id}"> <input
									type="hidden" name="p_id" value="${param.p_id}"> <input
									type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
							</form>


							<script
								src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
							<script type="text/javascript">
								$(document)
										.ready(
												function() {
													var actionForm = $("#actionForm");

													$(".paginate_button a")
															.on(
																	"click",
																	function(e) {

																		e
																				.preventDefault();

																		console
																				.log('click');

																		actionForm
																				.find(
																						"input[name='pageNum']")
																				.val(
																						$(
																								this)
																								.attr(
																										"href"));

																		actionForm
																				.submit();

																	});
												});
							</script>

						</div>
						<div class="col-lg-6">
							<div class="review_box">
								<h4>Add a Review</h4>
								<p style="color: black;">Your Rating: &nbsp;&nbsp;</p>

								<p id="star_grade" style="font-size: 20px;">
									<a href="#none" id="star1" class="on">★</a> <a href="#none"
										id="star2" class="on">★</a> <a href="#none" id="star3"
										class="on">★</a> <a href="#none" id="star4">★</a> <a
										href="#none" id="star5">★</a>
								</p>
								<p style="float: right; color: black;">Writer : ${memberId}</p>


								<script
									src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
								<script>
									$('#star_grade a')
											.click(
													function() {
														$(this).parent()
																.children("a")
																.removeClass(
																		"on"); /* 별점의 on 클래스 전부 제거 */
														$(this).addClass("on")
																.prevAll("a")
																.addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
														var star = $('.on').length;
														document
																.getElementById('starid').value = star;
														return false;

													});
								</script>

								<form class="row contact_form" action="/products/addReviewPost"
									method="post" id="contactForm" enctype="multipart/form-data">
									<input type="hidden" value="${reviewYN}"> <input
										type="hidden" id="starid" name="star" value="3"> <input
										type="hidden" name="id" value="${memberId}"> <input
										type="hidden" name="p_id" value="${param.p_id}">
									<div class="col-md-12">
										<div class="form-group">
											<input type="text" class="form-control" id="name"
												name="title" placeholder="Subject" required>
										</div>
									</div>

									<div class="col-md-12">
										<div class="form-group">
											<textarea class="form-control" name="content" id="message"
												rows="10" placeholder="Review Content" required></textarea>
										</div>
									</div>

									<div class="col-md-12">
										<div class="form-group">
											<input type="file" name="uploadFile" id="img">
										</div>
										<div class="select_img">
											<img src="" />
										</div>
									</div>

									<!-- 리뷰 등록의 파일 선택후 내가 선택한 파일의 이미지 미리보기하기 위함 -->
									<script>
										$("#img")
												.change(
														function() {
															if (this.files
																	&& this.files[0]) {
																var reader = new FileReader;
																reader.onload = function(
																		data) {
																	$(
																			".select_img img")
																			.attr(
																					"src",
																					data.target.result)
																			.width(
																					500);
																}
																reader
																		.readAsDataURL(this.files[0]);
															}
															var fileValue = $(
																	"#img")
																	.val()
																	.split("\\");
															var fileName = fileValue[fileValue.length - 1]; // 파일명
															document
																	.getElementById('imageName').value = fileName;

														});
									</script>


									<input type="hidden" value="" id="imageName" name="imageName">


									<c:choose>
										<c:when test="${reviewYN==0}">
											<div class="col-md-12 text-right">
												<button type="submit" value="submit" class="btn submit_btn"  onclick="return reviewMember()">Submit
													Now</button>
											</div>
										</c:when>
										<c:otherwise>
											<div class="col-md-12 text-right">
												<button type="button" class="btn submit_btn"
													onclick="return reviewY()">Submit Now</button>
											</div>
										</c:otherwise>
									</c:choose>

									<script type="text/javascript">
										function reviewY() {
											alert("해당 상품의 리뷰를 이미 작성하셨습니다 :D");
											return false;
										}
										function reviewMember() {
											var member = '${memberId}';

											if (member == null
													|| member.length == 0) {
												alert("로그인을 해주세요!");
												return false;
											} else {
												alert("리뷰가 작성되었습니다 :D");
												$("#contactForm").submit();
											}
										}
									</script>

								</form>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>



	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" />
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
	<!-- <script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script> -->
	<script src="/resources/js/google-map.js"></script>
	<script type="text/javascript" src="/resources/js/message.js"></script>
	<script src="/resources/js/main.js"></script>
	<script type="text/javascript">
		$("#addMessageBtn").on("click", function(e) {

			var senderId = '<c:out value="${memberId}"/>';
			var readerId = '<c:out value="${product.id}"/>';
			var sendMsgTitle = $("#sendMsgTitle");
			var sendMsgContent = $("#sendMsgContent");

			var message = {
				sender : senderId,
				reader : readerId,
				title : sendMsgTitle.val(),
				content : sendMsgContent.val()
			};

			if (sendMsgTitle.val() == null || sendMsgTitle.val().length == 0) {
				alert("제목을 입력해주세요!");
				return false;
			}
			if (sendMsgContent == null || sendMsgContent.length == 0) {
				alert("내용을 입력해주세요!");
				return false;
			}

			MessageService.add(message, function(result) {

				sendMsgTitle.val("");
				sendMsgContent.val("");
				alert("쪽지를 보냈습니다! 답변을 기다려주세요 :D");

			});

		});
	</script>


	<!-- 수정/삭제/리스트 페이지로이동 처리 스크립트  -->
	<script type="text/javascript">
		$(document).ready(function() {
			var operForm = $("#operForm");
			$("button[data-oper='modify']").on("click", function(e) {
				operForm.attr("action", "/products/productModify").submit();
			});
			$("button[data-oper='list']").on("click", function(e) {
				operForm.find("#p_id").remove();
				operForm.attr("action", "/products/productList").submit();
			});
		});
	</script>

	<!-- 수량 +/- -->
	<script>
		$(document).ready(function() {
			var quantitiy = 0;
			$('.quantity-right-plus').click(function(e) {

				// Stop acting like a button
				e.preventDefault();
				// Get the field name
				var quantity = parseInt($('#quantity').val());

				// If is not undefined
				$('#quantity').val(quantity + 1);

				// Increment
			});

			$('.quantity-left-minus').click(function(e) {
				// Stop acting like a button
				e.preventDefault();
				// Get the field name
				var quantity = parseInt($('#quantity').val());

				// If is not undefined

				// Increment
				if (quantity > 0) {
					$('#quantity').val(quantity - 1);
				}
			});
		});
	</script>
	<script type="text/javascript" src="/resources/js/message.js"></script>
  <jsp:include page="../includes/footer.jsp" />
</body>
</html>