<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html><html><head><meta charset="UTF-8">

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<title>FAQ</title>

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
<body>

<jsp:include page="../includes/menu.jsp" />

<div class="hero-wrap hero-bread" style="background-image: url('/resources/images/bg_6.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
            <h1 class="mb-0 bread">FAQ</h1>
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
      <div class="container">
      <div class="row justify-content-center">
          <div class="col-xl-8 ftco-animate">
          
          <input type="hidden" name='id' id="id" value='<c:out value="${id}"/>'>
            
            <div class="col-md-12">
            <div class="form-group">
              	<img src="/image/notice/<c:out value='${faq.thumbnail}'/>" class="img" style="height: 100px; width: 100px;">
              </div>
            </div>
              
              <div class="col-md-12">
              <div class="form-group">
                <label><b>제목 :</b></label><p><c:out value="${faq.title}"/></p>
              </div>
              </div>
              
              <div class="col-md-12">
              <div class="form-group">
                <label><b>요약 내용 :</b></label><p><c:out value="${faq.summary}"/></p>
              </div>
              </div>
              
              <div class="col-md-12">
              <div class="form-group">
                <label><b>상세 설명 :</b></label><p><c:out value="${faq.content}"/></p>
              </div>
              </div>
              
              <div class="form-group" style="margin-top: 30px; text-align:right;">
              	<button type="submit" data-oper='modify' class="btn btn-primary py-2 px-4">수정</button>
  				<a href="/faq/list" class="btn btn-primary py-2 px-4">목록으로</a>
              </div>
              
              <!--  이동할 폼 생성  -->
				<form id='operForm' action="modify" method="get">
				<input type="hidden" id='bno' name='bno' value='<c:out value="${faq.bno}"/>'>
				<input type="hidden" id='pageNum' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
				<input type="hidden" id='amount' name='amount' value='<c:out value="${cri.amount}"/>'>
				<input type="hidden" id='keyword' name='keyword' value='<c:out value="${cri.keyword}"/>'>
				<input type="hidden" id='type' name='type' value='<c:out value="${cri.type}"/>'>
				</form>
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
  
 <script>
$(document).ready(function() {
  
  var operForm = $("#operForm"); 
  
  $("button[data-oper='modify']").on("click", function(e){
	  if($('#id').val()!='admin'){ 
			e.preventDefault();
			alert('관리자만 접근 가능합니다.');
		}else if($('#id').val()=='admin'){
		    operForm.attr("action","/faq/modify").submit();
		}
   });
  
    
  $("button[data-oper='list']").on("click", function(e){
    operForm.find("#bno").remove();
    operForm.attr("action","/faq/list").submit();
  });
    
});
</script>
<script type="text/javascript" src="/resources/js/message.js"></script>
  <jsp:include page="../includes/footer.jsp" />
</body>
</html>