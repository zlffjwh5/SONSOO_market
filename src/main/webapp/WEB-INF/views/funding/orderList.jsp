<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>펀딩 예약 리스트</title>
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
<!-- <script type="text/javascript">
$(document).ready(function() {
	var fp_id = $('#p_id').val();
	$(fp_state)
	$.ajax({
   		url:'/order/getFundingProduct?p_id='+fp_id,
   		type:'GET',
   		dataType: 'json',
   		contentType:'application/json;charset=UTF-8',
   		success:function(data){
      		if(data!=null){
      			 	$('#fp_state').html(fp_state);
      		}
   		}
	});
});
</script> -->
<script type="text/javascript">
function deleteOrder(){
	var result =confirm("취소하시겠습니까?");
	if(!result){
		return false;
	}
}
</script>
</head>
<body>

	<jsp:include page="../includes/menu.jsp" />
	<!-- END nav -->
<div class="hero-wrap hero-bread" style="background-image: url('/resources/images/bg_6.jpg');">
    <div class="container">
      <div class="row no-gutters slider-text align-items-center justify-content-center">
        <div class="col-md-9 ftco-animate text-center">
          <h1 class="mb-0 bread">내가 참여한 펀딩</h1>
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
				  	    <th>주문 번호</th>
				        <th colspan="2">상품 정보</th>
				        <th>수량/금액</th>
				        <th>/</th>
				      </tr>
				    </thead>
				    <tbody>
				   		<c:forEach var="fpO" items="${fpOrderList}" varStatus="status">
						      <tr class="text-center">
						   	   <td class="product-remove">${fpO.o_number}</td>				   	
						        <td class="image-prod">
						        <a href="/funding/FProduct?fp_id=${fpO.p_id}">
						        <img class="img-fluid" src="${fpO.tnimage }" alt="product_img" style="width: 100px">
						        </a>
						        </td>
						      <td class="product-remove">상품명: ${fpO.p_name}<br>상품ID: ${fpO.p_id}
						      <input name="p_id" id="p_id" value="${fpO.p_id}" hidden="">
						      </td>  
						        <td class="product-name">        	
						        	<p>주문 수량: ${fpO.qty}<br>총 금액: <fmt:formatNumber type="number" value="${fpO.totalcost}"/>원 </p>
						        </td>
						     
						        <td class="total">
								<form action="/funding/deleteOrder" method="post" onsubmit="return deleteOrder()">
									<input name="fp_id" value="${fpO.p_id}" hidden="">
									<input name="orderQty" value="${fpO.qty}" hidden="">
									<input name="o_number" value="${fpO.o_number}" hidden="">
									<input type="submit" value="취소" class="btn btn-primary py-2 px-3" style="background-color: #53C14B;">
								</form>
						    	</td>
						      </tr><!-- END TR-->
						</c:forEach>
				    </tbody>
				  </table>
  			</div>
  		</div>

  		
	</div>
	
        
	</section>

	<!-- Modal  추가 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">크라우드 펀딩</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">처리 완료 메세지</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	
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