<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html><html><head><meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<title>영수증</title>

 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <!-- <link href="https://fonts.googleapis.com/css?family=Lato:100,300,400,700,900" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300,400,700" rel="stylesheet"> -->

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

<script>

$(document).ready(function() {

	

	var o_number = $('#o_number').html();

	if(o_number.charAt(0)=='F') $('#payInfo').remove();
	
	$.ajax({
		url:'findOrderVO?o_number='+o_number,
		type:'GET',
		dataType: 'json',
		contentType:'application/json;charset=UTF-8',
		success:function(data){
			if(data!=null){
				$('#couponUsed').html(data.couponUsed);
				$('#totalCost').html(data.totalCost);
			}
			
		} 
	});

	   if(o_number.charAt(0)=='F') $('#myorderP').hide();
	   if(o_number.charAt(0)=='T') $('#myorderF').hide();

});

</script>


<body>

<jsp:include page="../includes/menu.jsp" />
		
	<div class="hero-wrap hero-bread" style="background-image: url('/resources/images/bg_6.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
            <h1 class="mb-0 bread">주문 완료</h1>
            	<p class="breadcrumbs">
            		<span class="mr-2"><a href="/home">Home</a></span>
            		<span class="mr-2"><a href="/products/productList">상품 목록</a></span>
            		<span class="mr-2"><a href="/funding/fd_products">펀딩 참여</a></span>
            	</p>
          </div>
        </div>
      </div>
    </div>
		
	<section class="ftco-section bg-light">
      <div class="container bg-light">
        <div class="row justify-content-center">
          <div class="col-xl-8 ftco-animate">
			
				<h3 class="mb-4 billing-heading">결제 영수증</h3>
				<hr>
				<div class="row align-items-end">
	          	<h5 class="col-md-12">주문 상품</h5>
	          	<div class="row col-md-12" style="margin-top:10px; margin-bottom:10px;">
	          	
	          	<c:set var="opvo" value="${opvo}" />
	          	<c:choose>
	          	<c:when test="${empty opvo}">
	          	<c:forEach var="opvoList" items="${opvoList}">
	          		<div class="col-md-3">
	          			<span class="form-group">
	                		<img id="tnImage" src="/resources/images/${opvoList.tnImage}" width="150" height="150">
	             		</span>
	             	</div>			
				 
					<div class="col-md-4">
	                	<div class="form-group" style="margin-top:50px;">
	                		<label>상품명</label>
	                		<p class="total-price"><span id="p_name">${opvoList.p_name}</span></p>
	                	</div>
	             	</div>
	             	
	             	<div class="col-md-2">
	                	<div class="form-group" style="margin-top:50px;">
	                		<label>수량</label>
	                		<p class="total-price"><span id="qty">${opvoList.qty}</span></p>
	                	</div>
	             	</div>
	             	
	             	<div class="col-md-2">
	                	<div class="form-group" style="margin-top:50px;">
	                		<label>가격</label>
	                		<p class="total-price"><span id="price">${opvoList.price}</span></p>
	                	</div>
	             	</div>
	            </c:forEach>
	            </c:when>
	            </c:choose>	
	            
	            <c:set var="opvoList" value="${opvoList}" />
	          	<c:choose>
	          	<c:when test="${empty opvoList}">
	          		<div class="col-md-3">
	          			<span class="form-group">
	                		<img id="tnImage" src="${opvo.tnImage}" width="150" height="150">
	             		</span>
	             	</div>			
				 
					<div class="col-md-4">
	                	<div class="form-group" style="margin-top:50px;">
	                		<label>상품명</label>
	                		<p class="total-price"><span id="p_name">${opvo.p_name}</span></p>
	                	</div>
	             	</div>
	             	
	             	<div class="col-md-2">
	                	<div class="form-group" style="margin-top:50px;">
	                		<label>수량</label>
	                		<p class="total-price"><span id="qty">${opvo.qty}</span></p>
	                	</div>
	             	</div>
	             	
	             	<div class="col-md-2">
	                	<div class="form-group" style="margin-top:50px;">
	                		<label>가격</label>
	                		<p class="total-price"><span id="price">${opvo.price}</span></p>
	                	</div>
	             	</div>
	            </c:when>
	            </c:choose>	
	            
	            </div>
	          	
	          	
	          	<hr>
	          	<div class="col-md-6 d-flex" id="payInfo">
	          		<div class="cart-detail cart-total bg-light p-3 p-md-4">
	          			<h3 class="billing-heading mb-4">결제 정보</h3>
	          					<hr>
	          					<p class="d-flex">
		    						<span>카드번호</span><span>${cvo.cardNumber}</span>
		    					</p>
		    					<p class="d-flex">
		    						<span>만료일</span><span>${cvo.expDate}</span>
		    					</p>
		    					<p class="d-flex">
		    						<span>CVC/CVV</span><span>${cvo.securityCode}</span>
		    					</p>
					</div>
	          	</div>
	          	
	          	<div class="col-md-6 d-flex">
	          		<div class="cart-detail cart-total bg-light p-3 p-md-4" style="height:245px; width:360px;">
	          			<h3 class="billing-heading mb-4">주문 내역</h3>
	          					<hr>
	          					<p class="d-flex">
		    						<span>주문 번호</span><span id="o_number">${vo.o_number}</span>
		    					</p>
		    					<p class="d-flex">
		    						<span>쿠폰 할인</span><span id="couponUsed">${vo.couponUsed}</span>
		    					</p>
		    					<hr>
		    					<p class="d-flex total-price">
		    						<span>결제 금액</span><span id="totalCost">${vo.totalCost}</span>
		    					</p>
					</div>
				</div>
				<hr>
				<div class="col-md-6 d-flex" style="margin-top:40px; margin-bottom:40px; margin-left:500px;">
	          		<div class="row ">
						<div>
							<a href="/home" class="btn btn-primary">홈으로</a>
						</div>
				
						<div style="margin-left:10px;">
							<!-- 펀딩 주문 내역 -->
                    	 <a href="/funding/orderFPList" class="btn btn-primary" id="myorderF">나의 주문 내역</a>
                  	   <!-- 일반 상품 주문 내역 -->
                    	 <a href="/history/buyList" class="btn btn-primary"  id="myorderP">나의 주문 내역</a>
						</div>
				
					</div>
				</div>
				
			</div><!-- 결제 영수증 END -->
		</div>
		</div>
		</div>
    </section> <!-- .section -->

    
  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


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
  <!-- <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script> -->
  <script src="/resources/js/google-map.js"></script>
  <script src="/resources/js/main.js"></script>

  <script>
		$(document).ready(function(){

		var quantitiy=0;
		   $('.quantity-right-plus').click(function(e){
		        
		        // Stop acting like a button
		        e.preventDefault();
		        // Get the field name
		        var quantity = parseInt($('#quantity').val());
		        
		        // If is not undefined
		            
		            $('#quantity').val(quantity + 1);

		          
		            // Increment
		        
		    });

		     $('.quantity-left-minus').click(function(e){
		        // Stop acting like a button
		        e.preventDefault();
		        // Get the field name
		        var quantity = parseInt($('#quantity').val());
		        
		        // If is not undefined
		      
		            // Increment
		            if(quantity>0){
		            $('#quantity').val(quantity - 1);
		            }
		    });
		    
		});
	</script>
<script type="text/javascript" src="/resources/js/message.js"></script>
  <jsp:include page="../includes/footer.jsp" />
</body>
</html>

