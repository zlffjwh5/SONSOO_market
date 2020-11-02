<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
String id = (String)session.getValue("memberId"); 
String fp_id = request.getParameter("fp_id");
int qty = Integer.parseInt(request.getParameter("qty"));
%>

<!DOCTYPE html><html><head><meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<title>펀딩 참여하기</title>

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

<script type="text/javascript" src="/resources/js/order/orderFundingView.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</head>
<body>

<jsp:include page="../includes/menu.jsp" />

	<div class="hero-wrap hero-bread" style="background-image: url('/resources/images/bg_6.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
            <h1 class="mb-0 bread">펀딩 참여하기</h1>
            <p class="breadcrumbs"><span>펀딩 상품은 예약 주문만 가능합니다.</span></p>
          </div>
        </div>
      </div>
    </div>
		
	<section class="ftco-section">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-xl-8 ftco-animate">
          
          <!-- 주문 폼 -->
			<form id="participate" action="participate" method="post" class="billing-form bg-light p-3 p-md-5">
			<input type="hidden" name="o_number" id="o_number"  class="form-control">
			<input type="hidden" name="id" id="id" value=<%=id %> class="form-control">
			<input type="hidden" name="p_id" id="p_id" value=<%=fp_id %> class="form-control">
			<input type="hidden" name="tnImage" id="tnImage" value="">
				
				<h3 class="mb-4 billing-heading">주문 내역</h3>
	          	
	          	<div class="row align-items-end">
	          	<h5 class="col-md-12">펀딩 상품</h5>
	          	<p class="row align-items-end mt-5 pt-3 d-flex">
	          		<div class="col-md-3">
	                	<span class="form-group">
	                		<img id="tnImage2" src="" width="150" height="150">
	                	</span>
	             	</div>			
				
					<div class="col-md-4">
	                	<div class="form-group">
	                		<label>상품명</label>
	                		<input type="text" name="p_name" id="p_name" value="" class="form-control" readonly>
	                	</div>
	             	</div>
	             	<div class="col-md-2">
	                	<div class="form-group">
	                		<label>수량</label><input type="text" name="qty" id="qty"  class="form-control" value=<%=qty %> style="text-align: center;" readonly>
	                	</div>
	             	</div>
	             	<div class="col-md-2">
	                	<div class="form-group">
	                		<label>가격</label><input type="text" name="price" id="price" value="" class="form-control" style="text-align: center;" readonly >
	                	</div>
	             	</div>
	             	<div class="col-md-1">
	                	<div class="form-group"></div>
	             	</div>
	             </p><!-- 펀딩 상품 목록 END -->
	             
	              	<div class="col-md-12 mt-5 pt-3 d-flex">
	              		<div class="form-group">
                			<label>배송지 선택</label>
							<div class="radio">
								<label class="mr-3"><input type="radio" name="deliveryAddr"  id="sameAddr" checked>주문자 정보와 동일</label>
								<label class="mr-3"><input type="radio" name="deliveryAddr" id="newAddr">새로운 배송지</label>
							</div>
						</div>
					</div>
					
					<div class="col-md-12">
	              		<div class="form-group">
							<p id="info"></p>
						</div>
					</div>
					
	              		<div class="col-md-6">
	                		<div class="form-group">
	                			<label for="firstname">수령인 이름</label><input type="text"  name="name" id="name" class="form-control">
	                		</div>
	              		</div>
	              	
	              		<div class="col-md-6">
	                		<div class="form-group">
	                			<label for="phone">전화번호</label><input type="text"  name="phone" id="phone" class="form-control">
	                		</div>
	              		</div>
	              	
	              		<div class="col-md-6">
	                		<div class="form-group">
	                			<label for="postcodezip">우편번호</label>
	                			<input type="text" name="postcode" id="postcode" class="form-control">
	                		</div>
	              		</div>
	              	
	              		<div class="col-md-6">
	                		<div class="form-group" style="align-content: left; ">
	                			<input type="button" value="우편번호 찾기" onclick="execDaumPostcode()" class="btn btn-primary" style=" margin-top: 30px; margin-bottom: 10px;">
	                		</div>
	              		</div>
	              
	          			<div class="col-md-6">
	                		<div class="form-group">
	                			<label for="streetaddress">주소</label><input type="text" name="address" id="address" class="form-control">
	                		</div>
	              		</div>
	              
	              		<div class="col-md-6">
	                		<div class="form-group">
	                  			<label for="streetaddress">상세 주소</label>
	                  			<input type="text" name="detailAddress" id="detailAddress" class="form-control">
	                		</div>
                  		</div>
                  
                  		<div class="col-md-6">
	                		<div class="form-group">
	                 			<label for="streetaddress">참고</label>
	                  			<input type="text" name="extraAddress" id="extraAddress" class="form-control">
	                		</div>
                  		</div>
                  	
                	<div class="col-md-12">
		            	<div class="form-group">
		            		<label>요청사항</label>
		            		<input type="text" name="requestedTerm" class="form-control">
		            	</div>
		            </div>
		            
		            <div class="col-md-6">
		            	<div class="form-group">
		            		<label>쿠폰 선택</label>
		            		<div class="select-wrap">
		                  		<div class="icon"><span class="ion-ios-arrow-down"></span></div>
		                  			<select id="couponUsed" name="couponUsed" class="form-control"></select>
		                	</div>
		            	</div>
		            </div>
		            
		            <div class="col-md-6">
	                		<div class="form-group" style="align-content: left; ">
	                			<input type="button" id="couponApply" value="적용" class="btn btn-primary" style=" margin-top: 30px; margin-bottom: 10px;">
	                		</div>
	              	</div>
                
                </div>
                
              <div class="row mt-5 pt-3 d-flex">
	          	<div class="col-md-6 d-flex">
	          		<div class="cart-detail cart-total bg-light p-3 p-md-4">
	          			<h3 class="billing-heading mb-4">결제 내역</h3>
	          					<p class="d-flex">
		    						<span>주문 금액</span>
		    						<span id="cost"></span>
		    					</p>
		    					<p class="d-flex">
		    						<span>쿠폰 사용</span>
		    						<span id="discount"></span>
		    					</p>
		    					<hr>
		    					<p class="d-flex total-price">
		    						<span>총 금액</span>
		    						<span id="totCost"></span>
		    						<input type="hidden" name="totalCost" id="totalCost">
		    					</p>
					</div>
	          	</div>
	          </div><!-- Cart Total END -->
	          <input type="button" value="예약하기" class="btn btn-primary" onclick="payment()">
	         </form><!-- 주문 폼 END -->
          </div>
        </div>
      </div>
    </section> <!-- .section -->

    <section class="ftco-section bg-light">
    	<div class="container">
				<div class="row justify-content-center mb-3 pb-3">
          <div class="col-md-12 heading-section text-center ftco-animate">
          	<h1 class="big">Products</h1>
            <h2 class="mb-4">Related Products</h2>
          </div>
        </div>    		
    	</div>
    	<div class="container-fluid">
    		<div class="row">
    			<div class="col-sm col-md-6 col-lg ftco-animate">
    				<div class="product">
    					<a href="#" class="img-prod"><img class="img-fluid" src="images/product-1.jpg" alt="Colorlib Template"></a>
    					<div class="text py-3 px-3">
    						<h3><a href="#">Young Woman Wearing Dress</a></h3>
    						<div class="d-flex">
    							<div class="pricing">
		    						<p class="price"><span>$120.00</span></p>
		    					</div>
		    					<div class="rating">
	    							<p class="text-right">
	    								<span class="ion-ios-star-outline"></span>
	    								<span class="ion-ios-star-outline"></span>
	    								<span class="ion-ios-star-outline"></span>
	    								<span class="ion-ios-star-outline"></span>
	    								<span class="ion-ios-star-outline"></span>
	    							</p>
	    						</div>
	    					</div>
	    					<hr>
    						<p class="bottom-area d-flex">
    							<a href="#" class="add-to-cart"><span>Add to cart <i class="ion-ios-add ml-1"></i></span></a>
    							<a href="#" class="ml-auto"><span><i class="ion-ios-heart-empty"></i></span></a>
    						</p>
    					</div>
    				</div>
    			</div>
    			<div class="col-sm col-md-6 col-lg ftco-animate">
    				<div class="product">
    					<a href="#" class="img-prod"><img class="img-fluid" src="images/product-2.jpg" alt="Colorlib Template"></a>
    					<div class="text py-3 px-3">
    						<h3><a href="#">Young Woman Wearing Dress</a></h3>
    						<div class="d-flex">
    							<div class="pricing">
		    						<p class="price"><span>$120.00</span></p>
		    					</div>
		    					<div class="rating">
	    							<p class="text-right">
	    								<span class="ion-ios-star-outline"></span>
	    								<span class="ion-ios-star-outline"></span>
	    								<span class="ion-ios-star-outline"></span>
	    								<span class="ion-ios-star-outline"></span>
	    								<span class="ion-ios-star-outline"></span>
	    							</p>
	    						</div>
	    					</div>
	    					<hr>
    						<p class="bottom-area d-flex">
    							<a href="#" class="add-to-cart"><span>Add to cart <i class="ion-ios-add ml-1"></i></span></a>
    							<a href="#" class="ml-auto"><span><i class="ion-ios-heart-empty"></i></span></a>
    						</p>
    					</div>
    				</div>
    			</div>
    			<div class="col-sm col-md-6 col-lg ftco-animate">
    				<div class="product">
    					<a href="#" class="img-prod"><img class="img-fluid" src="images/product-3.jpg" alt="Colorlib Template"></a>
    					<div class="text py-3 px-3">
    						<h3><a href="#">Young Woman Wearing Dress</a></h3>
    						<div class="d-flex">
    							<div class="pricing">
		    						<p class="price"><span>$120.00</span></p>
		    					</div>
		    					<div class="rating">
	    							<p class="text-right">
	    								<span class="ion-ios-star-outline"></span>
	    								<span class="ion-ios-star-outline"></span>
	    								<span class="ion-ios-star-outline"></span>
	    								<span class="ion-ios-star-outline"></span>
	    								<span class="ion-ios-star-outline"></span>
	    							</p>
	    						</div>
	    					</div>
	    					<hr>
    						<p class="bottom-area d-flex">
    							<a href="#" class="add-to-cart"><span>Add to cart <i class="ion-ios-add ml-1"></i></span></a>
    							<a href="#" class="ml-auto"><span><i class="ion-ios-heart-empty"></i></span></a>
    						</p>
    					</div>
    				</div>
    			</div>
    			<div class="col-sm col-md-6 col-lg ftco-animate">
    				<div class="product">
    					<a href="#" class="img-prod"><img class="img-fluid" src="images/product-4.jpg" alt="Colorlib Template"></a>
    					<div class="text py-3 px-3">
    						<h3><a href="#">Young Woman Wearing Dress</a></h3>
    						<div class="d-flex">
    							<div class="pricing">
		    						<p class="price"><span>$120.00</span></p>
		    					</div>
		    					<div class="rating">
	    							<p class="text-right">
	    								<span class="ion-ios-star-outline"></span>
	    								<span class="ion-ios-star-outline"></span>
	    								<span class="ion-ios-star-outline"></span>
	    								<span class="ion-ios-star-outline"></span>
	    								<span class="ion-ios-star-outline"></span>
	    							</p>
	    						</div>
	    					</div>
	    					<hr>
    						<p class="bottom-area d-flex">
    							<a href="#" class="add-to-cart"><span>Add to cart <i class="ion-ios-add ml-1"></i></span></a>
    							<a href="#" class="ml-auto"><span><i class="ion-ios-heart-empty"></i></span></a>
    						</p>
    					</div>
    				</div>
    			</div>
    		</div>
    	</div>
    </section>

    
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
