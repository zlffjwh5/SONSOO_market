<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
					<h1 class="mb-0 bread">Admin Member Management</h1>
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index.html">Home</a></span> <span
							class="mr-2"><a href="index.html">Chart</a></span>
					</p>
				</div>
			</div>
		</div>
	</div>


	<section class="ftco-section ftco-cart" style="padding-top: 50px; padding-bottom: 10px;">
		<div class="container">
			<div class="row">
				<div class="col-md-12 ftco-animate">
					<div class="cart-list" style="overflow: hidden;">
						<table class="table">
							<thead class="thead-primary">
								<tr class="text-center">
									<th>회원 아이디</th>
									<th>회원 이름</th>
									<th>총 결제금액</th>
									<th>총 방문횟수</th>
									<th>회원가입날짜</th>
									<th>&nbsp;</th>
								</tr>
							</thead>
							<tbody>
						<c:forEach var="mSList" items="${mSList}" varStatus="status">
								<tr>
									<td>${mSList.id}</td>
									<td>${mSList.name}</td>
									<td>${mSList.totalCost}</td>
									<td>${mCList[status.index].visit}</td>
									<td><fmt:formatDate value="${mSList.reg_Date}" pattern="yyyy-MM-dd"/></td>
									<td><a href="/visitor/memberChartDetail?id=${mSList.id}"><b style="color: black;">상세보기</b></a></td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>
	





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
	<script src="/resources/js/google-map.js"></script>
	<script src="/resources/js/main.js"></script>
	<script type="text/javascript" src="/resources/js/message.js"></script>
	<script type="text/javascript" src="/resources/js/chart.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
	<script type="text/javascript" src="/resources/js/message.js"></script>
	<jsp:include page="../includes/footer.jsp" />
</body>
</html>