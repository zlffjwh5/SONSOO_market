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
					<h1 class="mb-0 bread">${memberInformation.id}님의 회원정보</h1>
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index.html">Home</a></span> <span
							class="mr-2"><a href="index.html">Chart</a></span>
					</p>
				</div>
			</div>
		</div>
	</div>
	
	<div class="panel-body" style="width: 60%; margin: 0 auto; margin-top: 50px;">
			<table class="table" style=" margin-bottom: 50px;">
				<thead class="thead-primary">
					<tr class="text-center">
						<th colspan="9"><h3>회원정보</h3></th>
					</tr>
					<tr>
						<th><b style="color:black;">ID</b></th>
						<th><b style="color:black;">이름</b></th>
						<th><b style="color:black;">번호</b></th>
						<th><b style="color:black;">주소</b></th>
						<th><b style="color:black;">보유쿠폰</b></th>
						<th><b style="color:black;">최근 방문일</b></th>
						<th><b style="color:black;">가입일</b></th>
						<th><b style="color:black;">누적 방문횟수</b></th>
						<th><b style="color:black;">누적 주문금액</b></th>
					</tr>
				</thead>
					<tr>
						<td>${memberInformation.id}</td>
						<td>${memberInformation.name}</td>
						<td>${memberInformation.phone}</td>
						<td>${memberInformation.address} ${memberInformation.detailaddress}(${memberInformation.postcode})</td>
						<td>${memberCouponCnt.coupon}</td>
						<td><fmt:formatDate value="${memberVisit.visit_Date}" pattern="yyyy-MM-dd"/></td>
						<td><fmt:formatDate value="${memberInformation.reg_Date}" pattern="yyyy-MM-dd"/></td>
						<td>${memberTotalVisit.memberTotalVisit} 회</td>
						<c:choose>
							<c:when test="${!empty memberTotalCost.memberTotalCost}">
							<td>${memberTotalCost.memberTotalCost} 원</td>
							</c:when>
							<c:otherwise>
								<td>0 원</td>
							</c:otherwise>
						</c:choose>
						
					</tr>
			</table>
			
			<table class="table">
				<thead class="thead-primary">
					<tr class="text-center">
						<th colspan="8"><h3>주문 & 배송정보</h3></th>
					</tr>
					<tr>
						<td><b style="color:black;">결제 완료</b></td>
						<td><b style="color:black;">배송 준비중</b></td>
						<td><b style="color:black;">배송중</b></td>
						<td><b style="color:black;">배송완료</b></td>
						<td><b style="color:black;">구매확정</b></td>
						<td><b style="color:black;">반품신청</b></td>
						<td><b style="color:black;">반품완료</b></td>
						<td><b style="color:black;">구매취소</b></td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${memberOrderAndShipping.status1}건</td>
						<td>${memberOrderAndShipping.status2}건</td>
						<td>${memberOrderAndShipping.status3}건</td>
						<td>${memberOrderAndShipping.status4}건</td>
						<td>${memberOrderAndShipping.status5}건</td>
						<td>${memberOrderAndShipping.status6}건</td>
						<td>${memberOrderAndShipping.status7}건</td>
						<td>${memberOrderAndShipping.status8}건</td>
					</tr>
				</tbody>
			</table>

		</div>
	
		<div class="row" style="width: 80%; margin: 0 auto; margin-top: 120px;">
            <!-- Bar Chart -->
            <div class="col-lg-8" style="width: 80%; margin: 0 auto;">
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <b style="color: black;">${memberInformation.id}님 월별 방문횟수 </b>
                </div>
                <div class="card-body">
                  <div class="chart-bar">
                    <div style="width: 100%; height: 410px;" class="about-author d-flex p-4 bg-light">
						<canvas id="myChart"></canvas>
					</div>
                  </div>
                  <hr>
                  Styling for the bar chart can be found in the <code>/js/demo/chart-bar-demo.js</code> file.
                </div>
              </div>
            </div>
            <!-- Donut Chart -->
            <div class="col-lg-8" style="width: 80%; margin: 0 auto;">
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <b style="color: black;">${memberInformation.id}님 월별 주문 금액 </b>
                </div>
                <div class="card-body">
                  <div class="chart-bar">
                    <div style="width: 100%; height: 410px;" class="about-author d-flex p-4 bg-light">
						<canvas id="myChart2"></canvas>
					</div>
                  </div>
                  <hr>
                  Styling for the bar chart can be found in the <code>/js/demo/chart-bar-demo.js</code> file.
                </div>
              </div>
            </div>
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
	<script src="/resources/js/google-map.js"></script>
	<script src="/resources/js/main.js"></script>
	<script type="text/javascript" src="/resources/js/message.js"></script>
	<script type="text/javascript" src="/resources/js/chart.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
	<script type="text/javascript" src="/resources/js/message.js"></script>
	<script type="text/javascript">
	var ctx = document.getElementById('myChart');
	  
	var config = {
		type: 'line',
		data: {
			labels: [ // Date Objects
				'2020-01월',
				'2020-02월',
				'2020-03월',
				'2020-04월',
				'2020-05월',
				'2020-06월',
				'2020-07월',
				'2020-08월',
				'2020-09월',
				'2020-10월'
			],
			datasets: [{
				label: '${memberInformation.id}님 월별 방문횟수',
				backgroundColor: 'rgba(75, 192, 192, 0.5)',
				borderColor: 'rgba(75, 192, 192, 1)',
				fill: true,
				data: [
					'${memberMonthVisit.mvisit1}',
					'${memberMonthVisit.mvisit2}',
					'${memberMonthVisit.mvisit3}',
					'${memberMonthVisit.mvisit4}',
					'${memberMonthVisit.mvisit5}',
					'${memberMonthVisit.mvisit6}',
					'${memberMonthVisit.mvisit7}',
					'${memberMonthVisit.mvisit8}',
					'${memberMonthVisit.mvisit9}',
					'${memberMonthVisit.mvisit10}'
				],
			}]
		},
		options: {
			maintainAspectRatio: false,
			title: {
				text: 'Chart.js Time Scale'
			},
			scales: {
				yAxes: [{
					scaleLabel: {
						display: true,
						labelString: '차트'
					}
				}]
			},
		}
	};
	 
	//차트 그리기
	var myChart = new Chart(ctx, config);
	</script>

	<script>
	var ctx2 = document.getElementById('myChart2');
	  
	var config = {
		type: 'line',
		data: {
			labels: [ // Date Objects
				'2020-01월',
				'2020-02월',
				'2020-03월',
				'2020-04월',
				'2020-05월',
				'2020-06월',
				'2020-07월',
				'2020-08월',
				'2020-09월',
				'2020-10월'
			],
			datasets: [{
				label: 'My First dataset',
				backgroundColor: 'rgba(255, 99, 132, 0.5)',
				borderColor: 'rgba(255, 99, 132, 1)',
				fill: true,
				data: [
					'${memberMonthTotalCost.mtotal1}',
					'${memberMonthTotalCost.mtotal2}',
					'${memberMonthTotalCost.mtotal3}',
					'${memberMonthTotalCost.mtotal4}',
					'${memberMonthTotalCost.mtotal5}',
					'${memberMonthTotalCost.mtotal6}',
					'${memberMonthTotalCost.mtotal7}',
					'${memberMonthTotalCost.mtotal8}',
					'${memberMonthTotalCost.mtotal9}',
					'${memberMonthTotalCost.mtotal10}'
				],
			}]
		},
		options: {
			maintainAspectRatio: false,
			title: {
				text: 'Chart.js Time Scale'
			},
			scales: {
				yAxes: [{
					scaleLabel: {
						display: true,
						labelString: '차트'
					}
				}]
			},
		}
	};
	 
	//차트 그리기
	var myChart2 = new Chart(ctx2, config);
	</script>
	
	
	<jsp:include page="../includes/footer.jsp" />
</body>
</html>