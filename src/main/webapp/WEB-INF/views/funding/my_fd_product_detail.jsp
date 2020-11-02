<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html><html>
<head><meta charset="UTF-8">
<title>프로젝트 상세</title>
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
     <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
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
  <style type="text/css">
  .bg-pink {
  background-color: #FFB2D9 !important; }
  </style>
</head>
<body>
<jsp:include page="../includes/menu.jsp" />

		<div class="hero-wrap hero-bread" style="background-image: url('/resources/images/bg_6.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
            <h1 class="mb-0 bread">My Project</h1>
            <p class="breadcrumbs"><span class="mr-2">
            <button data-oper='list' class="btn btn-primary py-1 px-2">목록</button>
            <c:choose>
            	<c:when test="${memberId==fp.fp_seller}">
            	<button data-oper='edit' class="btn btn-primary py-1 px-2" style="background-color: #79ABFF">수정/삭제</button>
           	    </c:when>
           	</c:choose>

           </span></p>
          </div>
        </div>
      </div>
    </div>
		
		<section class="ftco-section bg-light">
    	<div class="container">
    		<div class="row">
    			<div class="col-lg-6 mb-5 ftco-animate">
    				<img src="/fimage/${fp.fp_image }" class="img-fluid" alt="Colorlib Template" style="width: 900px">
    				<br><br>
    				<p>${fp.fp_description}</p>
    			</div>
    			<div class="col-lg-6 product-details pl-md-5 ftco-animate">
    				<h2>[${fp.fp_category}] ${fp.fp_name}</h2>
    				<br>
    				<h5>가격</h5>
    				<p class="price"><span><fmt:formatNumber type="number" value="${fp.fp_price }"/>원</span></p>
    				<fmt:formatDate var="deadline" value="${fp.deadline }" pattern="yyyy-MM-dd"/>
    				<h5>마감일 <span style="font-size: 90%">(<c:out value="${deadline }"/> 오전 0시 마감) </span></h5>
    				<jsp:useBean id="now" class="java.util.Date"/>
    				<fmt:parseNumber value="${now.time/(60*60*24*1000)}" var="today" integerOnly="true"/>
    				<fmt:parseNumber value="${fp.deadline.time/(60*60*24*1000)}" var="end" integerOnly="true"/>
    				<c:choose>
    					<c:when test="${today==end}">
    						<p class="price"><span>D-day</span></p>
    					</c:when>
    					<c:when test="${today<end}">
    						<p class="price"><span>${end-today}일 남았습니다</span></p>
    					</c:when>
    					<c:when test="${today>end}">
    						<p class="price"><span>${today-end}일 지났습니다</span></p>
    					</c:when>
    					
    				</c:choose> 

    				<%-- <h5>후원자</h5>
    				<p class="price"><span>${fp.funding_people}명</span></p> --%>
    				<h5>모인 금액</h5>
    				<p class="price"><span><fmt:formatNumber type="number" value="${fp.funding_qty*fp.fp_price}"/>원</span></p>
    				<h5>목표 금액</h5>
    				<p class="price"><span><fmt:formatNumber type="number" value="${fp.goal_cost}"/>원 </span></p>
    				<h5>달성률</h5>
    				<c:set var="percent" value="${(fp.funding_qty*fp.fp_price/fp.goal_cost)*100}"/>
    				<p class="price"><span><fmt:formatNumber value="${percent}" pattern="0"/>%</span></p>
    				<div class="progress" style="height:10px">
   							<div class="progress-bar bg-pink" style="width:<fmt:formatNumber value="${percent}" pattern="0"/>%"></div>
						</div>
					<br>	
    				
					<hr>
					<div style="color: red; margin: 0">
					목표 금액 <fmt:formatNumber type="number" value="${fp.goal_cost}"/>원이 모여야만 결제됩니다. <br>
					결제는 <fmt:formatDate value="${fp.payDate}" pattern="yyyy-MM-dd"/>에 진행됩니다.
					</div>
						<div class="row mt-4">


          	</div>
          		<br>
          	<hr>
    				<br>
    				<h5>프로젝트 주최자</h5>
    				<p class="price"><span>${fp.fp_seller}</span></p>
    				
    		</div>
    		</div>
    	</div>
    </section>
    <!-- 이동할 폼 생성 -->
	<form id='operForm' action="#" method="get">
	  <input type='hidden' id='fp_id' name='fp_id' value='<c:out value="${fp.fp_id}"/>'>
	   <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
	  <input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
	</form>

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
  <script src="/resources/js/main.js"></script>
<!--펀딩 참여페이지로 이동-->  
<script>
function participate(){
	 var id=$('#fp_id').val();
	 var qty = $('#quantity').val();
	 location.href='/order/orderView?fp_id='+id+'&qty='+qty;
		
	}
</script>
  
<!-- 버튼 클릭시 페이지 이동(상품목록/수정페이지로) -->
<script>
var operForm = $("#operForm"); 
$(document).ready(function(){
/* $("button[data-oper='modify']").on("click", function(e){  
   operForm.attr("action","/board/modify").submit(); 
});    */
$("button[data-oper='list']").on("click", function(e){
   operForm.find("#fp_id").remove();
   operForm.attr("action","/funding/mypageSeller")
   operForm.submit();	       
}); 

$("button[data-oper='edit']").on("click", function(e){
       operForm.attr("action","/funding/modifyFP")
       operForm.submit();	       
    }); 

});
</script>

    <script type="text/javascript" src="/resources/js/message.js"></script>
  <jsp:include page="../includes/footer.jsp" />
</body>
</html>