<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html><html><head><meta charset="UTF-8">
	<title>SONSOO</title>
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
<jsp:include page="../includes/menu.jsp" />
<div class="hero-wrap hero-bread" style="background-image: url('/resources/images/bg_6.jpg');">
	<div class="container">
		<div class="row no-gutters slider-text align-items-center justify-content-center">
		<div class="col-md-9 ftco-animate text-center">
			<h1 class="mb-0 bread">SONSOO PRODUCTS</h1>
			<p class="breadcrumbs">
			<c:choose>
				<c:when test="${memberId==seller}">
					<br>
					<button id='regBtn' type="button" class="btn btn-primary py-1 px-2">상품 등록</button>				
				</c:when>
			</c:choose>
			</p>
		</div>
		</div>
	</div>
</div>



<section class="ftco-section bg-light">
<div class="container-fluid">
<div class="row">
	<div class="about-author d-flex p-4 bg-light">
		<div class="bio align-self-md-center mr-4">
			<img src="/resources/images/shop.png" width="200" height="200" alt="Image placeholder" class="img-fluid mb-4">
		</div>
		 &nbsp;&nbsp;
		<div class="desc align-self-md-center">
			<h1 class="mb-3">${seller}님의 상품</h1>
			<p>${seller}가 판매하는 상품을 만나보세요</p>
		</div>
	</div>
</div>
<br><br>
<div class="row">	
	<c:forEach var="product" items="${listSeller}">
	<div class="col-sm col-md-6 col-lg-3 ftco-animate">	
		<div class="product">
			<a href="/products/product?id=${memberId}&p_id=${product.p_id}" class="img-prod">
				<img class="img-fluid" src="/pimage/<c:out value="${product.tnImage}"/>" alt="Colorlib Template">
			</a>
		
			<div class="text py-3 px-3">
				<h3><a href="#"><c:out value="${product.name}"/></a></h3>
				<div class="d-flex">
					<div class="pricing">
						<p class="price">
						<span class="price">가격&nbsp;:&nbsp;"${product.price}"</span></p>
					</div>
				</div>
				<div class="d-flex">
					<p>재고수&nbsp;:&nbsp;"${product.stock}"</p>
				</div>			
				<hr>
				<p class="bottom-area d-flex">
					<a href="/products/productListSeller?id=${product.id}" class="add-to-cart">
						<span>판매자 &nbsp;:&nbsp;<c:out value="${product.id}"/></span>
					</a>
					<%-- <button onclick="updateLikey(this)" class="ml-auto" data-p_id='<c:out value="${product.p_id}"/>'>
						<span><i class="ion-ios-heart-empty"></i>&nbsp;&nbsp;<c:out value="${product.likey}"/></span>
					</button> --%>
					<a href="#" class="ml-auto">
						<span><i class="ion-ios-heart-empty"></i>&nbsp;&nbsp;<c:out value="${product.likey}"/></span>
					</a>
				</p>
				<!-- <ul class="comment-list">
				<li class="comment">
                  <div class="vcard bio">
                    <img src="images/person_1.jpg" alt="Image placeholder">
                  </div>
                    <h3>John Doe</h3>
                </li>
                </ul> -->
			</div>
		</div>	
	</div>
	</c:forEach>
</div>
</div>
</section>

	
	

<!-- loader -->
<div id="ftco-loader" class="show fullscreen">
<svg class="circular" width="48px" height="48px">
	<circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/>
	<circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/>
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
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
<script src="/resources/js/google-map.js"></script>
<script src="/resources/js/main.js"></script>
 <script type="text/javascript" src="/resources/js/message.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var actionForm = $("#actionForm");
		var result = '<c:out value="${result}"/>';//입력,수정,삭제 결과 rttr.addFlashAttribute("result","success");

		$("#regBtn").on("click", function() {
			self.location = "/products/productRegister";
		});
	    
		<%--페이지 이동--%>
		var actionForm = $("#actionForm");
		$("a[name=pageBtn]").on("click",function(e){
			e.preventDefault();
			console.log('click');
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();	
			});

		$(".move").on("click",function(e){
			e.preventDefault();
			actionForm.append("<input type='hidden' name='fp_id' value='"+
					$(this).attr("href")+"'>");
			actionForm.attr("action","/funding/FProduct");	
			actionForm.submit();	
			});
	});
</script>
<script type="text/javascript" src="/resources/js/message.js"></script>
  <jsp:include page="../includes/footer.jsp" />
</body>
</html>
