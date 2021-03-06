<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SONSOO</title>
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
<link rel="stylesheet" href="/resources/css2/style.css">
<link rel="stylesheet" href="/resources/css2/responsive.css">
<script src='http://jquery-multifile-plugin.googlecode.com/svn/trunk/jquery.form.js' type="text/javascript" language="javascript"></script>
<script src='http://jquery-multifile-plugin.googlecode.com/svn/trunk/jquery.MetaData.js' type="text/javascript" language="javascript"></script>
<script src='http://jquery-multifile-plugin.googlecode.com/svn/trunk/jquery.MultiFile.js' type="text/javascript" language="javascript"></script>
<script src='http://jquery-multifile-plugin.googlecode.com/svn/trunk/jquery.blockUI.js' type="text/javascript" language="javascript"></script> 
</head>

<body>
<jsp:include page="../includes/menu.jsp" />
<div class="hero-wrap hero-bread" style="background-image: url('/resources/images/bg_6.jpg');">
	<div class="container">
		<div class="row no-gutters slider-text align-items-center justify-content-center">
			<div class="col-md-9 ftco-animate text-center">
				<h1 class="mb-0 bread">REGISTER PRODUCT</h1>
			</div>
		</div>
	</div>
</div>
		
<section class="ftco-section">
<div class="container">
	<div class="row justify-content-center">
		<div class="col-xl-8 ftco-animate">
			<form name="productRegister" action="/products/productRegister" method="post" onsubmit="return validate();"
				  enctype="multipart/form-data" class="billing-form bg-light p-3 p-md-5">				
				<h3 class="mb-4 billing-heading">?????? ??????</h3>
				<div class="row align-items-end">					
					<div class="col-md-6">
						<div class="form-group">
							<label for="firstname">?????????</label>
							<input name="name" id="name" type="text" class="form-control">
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label for="category">????????????</label>
							<div class="select-wrap">
								<div class="icon"><span class="ion-ios-arrow-down"></span></div>
								<select name="category" id="category" class="form-control">
								<c:forEach var="category" items="${categoryList}">
									<option value="${category}">${category}</option>
								</c:forEach>
								</select>
							</div>
						</div>
					</div>
					<div class="w-100"></div>
					<div class="col-md-6">
						<div class="form-group">
							<label for="lastname">??????</label>
							<input type="text" name="price" id="price" class="form-control" >
						</div>
					</div>
					
					
					<div class="col-md-6">
						<div class="form-group">
							<label for="lastname">?????????</label>
							<input type="text" name="stock" id="stock" class="form-control" >
						</div>
					</div>
					<!-- <div class="col-lg-6 product-details pl-md-5 ftco-animate">
					<div class="row mt-4">	
					<div class="input-group col-md-6 d-flex mb-3">
						<label for="lastname">?????????</label>
						<span class="input-group-btn mr-2">
							<button type="button" class="quantity-left-minus btn" data-type="minus" data-field="">
								<i class="ion-ios-remove"></i>
							</button>
						</span> 
						<input type="text" id="stock" name="stock" class="form-control input-number" value="50" min="0" max="100">
						<span class="input-group-btn ml-2">
							<button type="button" class="quantity-right-plus btn" data-type="plus" data-field="">
								<i class="ion-ios-add"></i>
							</button>
						</span>
					</div>		
					</div>   
					</div>  -->  
					   
					
		            <div class="w-100"></div>
					<div class="col-md-12">
						<div class="form-group">
							<label for="lastname">??????</label>
							<textarea name="script" id="script" rows="6" cols="20" class="form-control"></textarea>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label for="lastname">????????? ?????????</label>
							<input type="file" onchange="checkImage(this)" name="uploadFile" id="uploadFile" class="form-control" multiple="multiple">
						</div>
					</div>
					<!-- <div class="col-md-6">
						<div class="form-group">
							<label for="lastname">???????????? ?????????</label>
							<input type="file" name="dsImage" class="form-control" multiple="multiple">
						</div>
					</div> -->
                <div class="w-100"></div>
                <div class="col-md-12">
                	<input type="hidden" name="id" id="id" value="${memberId}">
                	<input type="submit" value="?????? ??????" class="btn btn-primary py-3 px-4">
				</div>
				</div>
			</form>
		</div>
	</div>
</div>
</section>

	
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" />
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
	<script src="/resources/js/google-map.js"></script>
		 <script type="text/javascript" src="/resources/js/message.js"></script>
	<script src="/resources/js/main.js"></script>	
	<!-- <script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/popper.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/stellar.js"></script>
	<script src="vendors/lightbox/simpleLightbox.min.js"></script>
	<script src="vendors/nice-select/js/jquery.nice-select.min.js"></script>
	<script src="vendors/isotope/imagesloaded.pkgd.min.js"></script>
	<script src="vendors/isotope/isotope-min.js"></script>
	<script src="vendors/owl-carousel/owl.carousel.min.js"></script>
	<script src="js/jquery.ajaxchimp.min.js"></script>
	<script src="js/mail-script.js"></script>
	<script src="vendors/jquery-ui/jquery-ui.js"></script>
	<script src="vendors/counter-up/jquery.waypoints.min.js"></script>
	<script src="vendors/counter-up/jquery.counterup.js"></script>
	<script src="js/theme.js"></script>
	 -->

	
<!-- ????????? ?????? -->
<script>
function validate(){
	var name = document.getElementById("name");
	var price = document.getElementById("price");
	var price = document.getElementById("stock");
	var script = document.getElementById("script");
	var tnImage = document.getElementById("tnImage");
	//var dsImage = document.getElementById("dsImage");

	if(name.value.length < 2 || name.value.length > 20){
		alert("[?????????]\n ?????? 2????????? ?????? 20????????? ???????????????.");
		name.select();
		name.focus();
		return false;
	}
	if(price.value.length == 0 || isNaN(price.value)){
		alert("[??????]\n ????????? ???????????????.")
		price.select();
		price.focus();
		return false;
	}else if (price.value < 0 || !(is_integer(price.value))) {
		alert("[??????]\n1??? ???????????? ????????? ??? ????????????");
		price.select();
		price.focus();
		return false;
	} 
	
	if(stock.value.length == 0 || isNaN(stock.value)){
		alert("[??????]\n ????????? ???????????????.")
		stock.select();
		stock.focus();
		return false;
	}else if (stock.value < 0 || !(is_integer(stock.value))) {
		alert("[??????]\n1 ???????????? ????????? ??? ????????????");
		stock.select();
		stock.focus();
		return false;
	}

	if(script.value.length<8){
		alert("[????????????]\n ????????? 8??? ?????? ???????????????");
		script.focus();
		return false;
	}

	if(!tnImage.value){
		alert("[?????? ?????????]\n ???????????? ???????????????");
		return false;
	}
	/* if(!dsImage.value){
		alert("[?????? ?????????]\n ???????????? ???????????????");
		return false;
	} */

	function is_integer(x){
	    var reg = /^[-|+]?\d+$/;
	    return reg.test(x);
	}
}
function checkImage(obj){
	var reg = /(\.gif|\.jpg|\.JPG|\.jpeg|\.JPEG|\.png|\.PNG)$/;
	var maxSize = 5242880; //5MB

    if (reg.test(obj.value) == false) {
        alert("????????? ????????? ????????? ???????????????.");
        obj.value="";
        return false;
    }
	if(maxSize<=obj.files[0].size){
		alert("5MB????????? ???????????? ????????? ???????????????.");
		obj.value="";
		return false;
	}
	if(1<obj.files.length){
		alert("????????? ???????????? ??????????????????");
		obj.value="";
		return false;
	}    
}
</script>

<!-- ?????? +/- -->	
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