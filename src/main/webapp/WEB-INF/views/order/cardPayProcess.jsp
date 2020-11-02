<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html><html><head><meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<title>결제하기</title>

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
    
<!-- <script type="text/javascript" src="/resources/js/order/cardPayProcess.js"></script> -->

<script>

function pay(num,exp,cvccvv){

	/* if(num=='false' || exp=='false' || cvccvv=='false') {
		alert('카드 정보를 정확하게 입력해주세요.');
	}else{ */
		$('#paymentForm').submit();
	/* } */
}	

</script>



</head>
<body>

<jsp:include page="../includes/menu.jsp" />
		
	<div class="hero-wrap hero-bread" style="background-image: url('/resources/images/bg_6.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
            <h1 class="mb-0 bread">카드 결제</h1>
            <p class="breadcrumbs"><span class="mr-2">신용카드 및 체크카드만 결제 가능합니다.</span></p>
          </div>
        </div>
      </div>
    </div>
		
	<section class="ftco-section">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-xl-8 ftco-animate">
			
			<form id="paymentForm" action="insertOrder" method="post" class="billing-form bg-light p-3 p-md-5">
				<h3 class="mb-4 billing-heading">결제 양식</h3>
	          	
	          	<div class="row mt-5 pt-3 d-flex">
	          	<div class="col-md-6 d-flex">
	          		<div class="cart-detail cart-total bg-light p-3 p-md-4">
	          			<h3 class="billing-heading mb-4">카드 결제</h3>
	          				<hr>
	          					
	          					
	          						<p class="d-flex">
		    							<span>카드번호</span><!-- 6011567812345678(4자씩 띄어쓰기,하이픈, 공백 가능) 로 테스트 하세요 -->
		    							<input type="text" name="cardNumber" id="cardNumber" data-encrypted-name="number" size="20" maxlength="20" placeholder="1234 5678 9012 3456" class="form-control" required>
		    							<input type="hidden" id="numberChecked" value="false">
		    						</p>
		    						<div id="number"></div>
		    					
		    					
		    					
	          						<p class="d-flex ">
		    							<span>만료일</span><!-- 11/03  -->
		    							<input type="text" name="expDate" id="expDate" placeholder="MM/YY" size="3" maxlength="5" class="form-control"  required>
		    							<input type="hidden" id="expChecked" value="false">
		    						</p>
		    						<div id="exp"></div>
		    					
		    				
	          						<p class="d-flex ">
		    							<span>CVC/CVV</span><!-- 123 또는 1234 -->
		    							<input type="text" name="securityCode" id="securityCode" placeholder="1231" size="3" maxlength="4" class="form-control" required>
		    							<input type="hidden" id="securityChecked" value="false">
		    						</p>
		    						<div id="security"></div>
		    					
					</div>
	          	</div>
	          	
	          	<div class="col-md-6 d-flex">
	          		<div class="cart-detail cart-total bg-light p-3 p-md-4">
	          			<h3 class="billing-heading mb-4">결제 내역</h3>
	          					<hr>
	          					<p class="d-flex">
		    						<span>주문 번호</span><span>${vo.o_number}</span>
		    						<input type="hidden" name="o_number" value="${vo.o_number}">
		    					</p>
		    					<hr>
		    					<p class="d-flex">
		    						<span>쿠폰 할인</span><span id="couponUsed">${vo.couponUsed}</span>
		    					</p>
		    					<p class="d-flex total-price">
		    						<span>결제 금액</span><span id="totalCost">${vo.totalCost}</span>
		    					</p>
		    					
					</div>
	          	</div>
	          	
	          </div><!-- Cart Total END -->
	          
	          <input type="button" value="결제하기" class="btn btn-primary" onclick="pay(numberChecked.value,expChecked.value,securityChecked.value)">
                
            </form><!-- 양식 폼 END -->
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

