<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Cart</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Lato:100,300,400,700,900" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300,400,700" rel="stylesheet">

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
    <jsp:include page="/WEB-INF/views/includes/menu.jsp" />
	<div class="hero-wrap hero-bread" style="background-image: url('/resources/images/bg_6.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
            <h1 class="mb-0 bread">My Cart</h1>
            <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span>Cart</span></p>
          </div>
        </div>
      </div>
    </div>
		
		<section class="ftco-section ftco-cart">
			<div class="container">			
			<div class="row">
    			<div class="col-md-12 ftco-animate">
    				<div class="cart-list">
	    				<table class="table">
						    <thead class="thead-primary">
						      <tr class="text-center">
						        <th>&nbsp;</th>
						        <th>&nbsp;</th>
						        <th>Product</th>
						        <th>Price</th>
						        <th>Quantity</th>
						        <th>Total</th>
						      </tr>
						    </thead>
						    
						    <tbody>
						    <c:set var="totals" value="0"/>
						    <c:forEach var="cartList" items="${cartList}">
						      <tr class="text-center">						      
						        <td class="product-remove">
						        	<a href="/products/cartDelete?seq=${cartList.seq}&id=${memberId}"><span class="ion-ios-close"></span></a>
						        </td>
						        						        
						        <td class="image-prod">
						        	<%-- <div class="img" style="background-image:url(/resources/images/${product.tnImage});"></div> --%>
						        	<img src="/pimage/<c:out value="${cartList.tnImage}"/>" class="img" alt="Colorlib Template">
						        </td>
						        
						        <td class="product-name">
						        	<h3><c:out value="${cartList.name}"/></h3>
						        </td>
						        
						        <td class="price"><c:out value="${cartList.price}"/>원</td>
						        
						        <td class="quantity">
						        	<div class="input-group mb-3">
					             		<input type="text" name="quantity" class="quantity form-control input-number" value="${cartList.quantity}" min="1" max="100">
					          		</div>
					          	</td>						        
					          	
					          	<c:set var="total" value="${cartList.price*cartList.quantity}"/>
						        <c:set var="totals" value="${totals+total}"/>
						        <td class="total"><c:out value="${total}"/>원</td>
						      </tr><!-- END TR-->
						    </c:forEach>
						    </tbody>						    
						  </table>
					  </div>
    			</div>
    		</div>
    		<div class="row justify-content-end">
    			<div class="col col-lg-5 col-md-6 mt-5 cart-wrap ftco-animate">
    				<div class="cart-total mb-3">
    					<h3>Cart Totals</h3>
    					<p class="d-flex total-price">
    						<span>Total</span>
    						<span><c:out value="${totals}"/>원</span>
    					</p>
    				</div>
    				<p class="text-center"><a href="/order/orderView" class="btn btn-primary py-3 px-4">Proceed to Checkout</a></p>
    			</div>
    		</div>
		</div>
	</section>
	<!-- cart ENd -->







    <!--  -->
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
    					<a href="#" class="img-prod"><img class="img-fluid" src="/resources/images/product-1.jpg" alt="Colorlib Template"></a>
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
    					<a href="#" class="img-prod"><img class="img-fluid" src="/resources/images/product-2.jpg" alt="Colorlib Template"></a>
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
    					<a href="#" class="img-prod"><img class="img-fluid" src="/resources/images/product-3.jpg" alt="Colorlib Template"></a>
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
    					<a href="#" class="img-prod"><img class="img-fluid" src="/resources/images/product-4.jpg" alt="Colorlib Template"></a>
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
                      <input type="text" class="form-control" placeholder="Enter email address">
                      <input type="submit" value="Subscribe" class="submit px-3">
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
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="/resources/js/google-map.js"></script>
    <script type="text/javascript" src="/resources/js/message.js"></script>
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