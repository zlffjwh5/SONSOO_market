<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
<title>구매내역 페이지</title>
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
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script>
function confirmation() { 
	var result = confirm('구매확정시 교환/환불이 불가능합니다. 확정하시겠습니까?'); 
	if(result == false) { 
		return result; 
	}
}
</script>
</head>
<body>

	<jsp:include page="../includes/menu.jsp" />
	<!-- END nav -->

	<div class="hero-wrap hero-bread"
		style="background-image: url('/resources/images/bg_6.jpg');">
		<div class="container">
			<div class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<h1 class="mb-0 bread">구매 내역</h1>
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index.jsp">Home</a></span> <span><a
							href="cart.jsp">Cart</a></span>
					</p>
				</div>
			</div>
		</div>
	</div>

	<section class="ftco-section ftco-cart">
		<div class="container">
			<div class="row">
				<div class="col-md-12 ftco-animate">
					<table class="table">
						<thead class="thead-primary">
							<tr class="text-center">
								<th>&nbsp;</th>
								<th>&nbsp;</th>
								<th>상품</th>
								<th>가격</th>
								<th>수량</th>
								<th>합계</th>
								<th>구매날짜</th>
								<th>&nbsp;</th>
							</tr>
						</thead>
						
						<tbody>
							<c:forEach var="buyList" items="${buyList }" varStatus="i">
								<tr class="text-center" id="p_list">
                                    <td>${i.count}</td>
									<td class="image-prod"><div class="img"
											style="background-image: url(/pimage/${buyList.tnImage});"></div></td>

									<td class="product-name">
										<p><small>${buyList.o_number }</small></p>
										<h3><a href="/products/product?id=${buyList.id }&p_id=${buyList.p_id }">${buyList.p_name }</a></h3>
										<p>${buyList.script }</p>
									</td>

									<td class="price"><fmt:formatNumber type="number">&#8361;${buyList.price }</fmt:formatNumber></td>

									<td class="quantity">
										<p>${buyList.qty }
									</td>

									<td class="total"><fmt:formatNumber type="number">&#8361;${buyList.price * buyList.qty }</fmt:formatNumber></td>
									
									<td>${buyList.o_date }
										<br>
										<c:if test="${buyList.status==1}">
								       		<a class="badge badge-light" href="cancelApplication?o_number=${buyList.o_number }&p_id=${buyList.p_id }&pageNum=${pageMaker.cri.pageNum}">구매취소</a>
								       </c:if>
								       <c:if test="${buyList.status==2 || buyList.status==3 || buyList.status==4}">
								       		<a class="badge badge-light" href="refundApplication?o_number=${buyList.o_number }&p_id=${buyList.p_id }" >반품신청</a>
								       </c:if>
									</td>

									<td>
										<c:if test="${buyList.status==1}">
								       		<p class="text-success">상품준비중</p>
									 	</c:if>
									 	<c:if test="${buyList.status==2 || buyList.status==3 || buyList.status==4}">
									 		<form action="confirmation" method="post">
									 			<input name="o_number" value="${buyList.o_number }" type="hidden">
									 			<input name="pageNum" value="${pageMaker.cri.pageNum}" type="hidden">
									 			<input name="p_id" value="${buyList.p_id }" type="hidden">
									 			<input class="btn btn-primary px-2 btn-block" onclick="return confirmation()" type="submit" value="구매확정">
									 		</form>
									 	</c:if>
									 	<c:if test="${buyList.status==5}">
									 		<p class="text-success">구매확정</p>
									 	</c:if>
								       <c:if test="${buyList.status==6}">
								       		<p class="text-info">환불대기중</p>
								       </c:if>
								       <c:if test="${buyList.status==7}">
								       		<p class="text-danger">환불완료</p>
								       </c:if>
								       <c:if test="${buyList.status==8}">
								       		<p class="text-danger">취소완료</p>
								       </c:if>
									</td>
								</tr>
								<!-- END TR-->
							</c:forEach>
						</tbody>
					</table>
					<div class="row mt-5">
						<div class="col text-center">
							<div class="block-27">
								<ul>
					              	<c:if test="${pageMaker.prev}">
										<li class="paginate_button previous">
										<a href="${pageMaker.startPage -1}"><</a></li>
									</c:if>
			
			                       <%-- 페이지 리스트 출력 --%>
									<c:forEach var="num" begin="${pageMaker.startPage}"	end="${pageMaker.endPage}">
										<li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} ">
											<a href="${num}">${num}</a>
										</li>
									</c:forEach>
			
			                       <%-- 다음 페이지 표시  --%>
									<c:if test="${pageMaker.next}">
										<li class="paginate_button next">
										<a href="${pageMaker.endPage +1 }">></a></li>
									</c:if>
					                <!-- <li class="active"><span>1</span></li> -->
					              </ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<form id='actionForm' action="/history/buyList" method='get'>
		<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
		<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
	</form>

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