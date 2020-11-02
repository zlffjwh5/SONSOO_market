<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html><html><head><meta charset="UTF-8">

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<title>FAQ 수정</title>

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
    
<script>
function checkImage(obj){
	var reg = /(\.gif|\.jpg|\.JPG|\.jpeg|\.JPEG|\.png|\.PNG)$/;
	var maxSize = 5242880; //5MB

    if (reg.test(obj.value) == false) {
        alert("이미지 형식의 파일만 가능합니다.");
        obj.value="";
        return false;
    }
	if(maxSize<=obj.files[0].size){
		alert("5MB미만의 이미지만 업로드 가능합니다.");
		obj.value="";
		return false;
	}
	if(1<obj.files.length){
		alert("하나의 이미지만 업로드하세요");
		obj.value="";
		return false;
	}
}

function validate(){
	if(!$('#thumbnail').val()){
		alert("썸네일 이미지를 확인해주세요.");
		return false;
	}
	$("#modifyFAQ").submit();
}


function remove(){
	var con = confirm('해당 FAQ를 삭제하시겠습니까?');
	if(con==true) {
		$("#modifyFAQ").attr("action","remove");
		$("#modifyFAQ").submit();
	}
}
			
</script>

</head>
<body>


<div class="hero-wrap hero-bread" style="background-image: url('/resources/images/bg_6.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
            <h1 class="mb-0 bread">FAQ 수정</h1>
            <p class="breadcrumbs">
            		<span class="mr-2"><a href="/home">Home</a></span>
            		<span class="mr-2"><a href="/products/productList">상품 목록</a></span>
            		<span class="mr-2"><a href="/funding/fd_products">펀딩 참여</a></span>
            	</p>
          </div>
        </div>
      </div>
</div>

<section class="ftco-section contact-section bg-light">
      <div class="container">
        <div class="row block-12">
          <div class="col-md-8 order-md-last d-flex">
           
            <form id="modifyFAQ" action="modifyFAQ" method="post" class="p-5 contact-form">
            	<input type="hidden" id='bno' name='bno' value='<c:out value="${faq.bno}"/>'>
              	<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum }"/>'>		
  				<input type="hidden" name="amount" value='<c:out value="${cri.amount }"/>'>		
  				<input type="hidden" name="type" value='<c:out value="${cri.type }"/>'>		
  				<input type="hidden" name="keyword" value='<c:out value="${cri.keyword }"/>'>		
  				
              
              <div class="form-group">
                <label>제목</label><input type="text" name="title" id="title" value='<c:out value="${faq.title}"/>' class="form-control" required>
              </div>
              
              <div class="form-group">
                <label>요약 내용</label><input type="text" name="summary" id="summary" value='<c:out value="${faq.summary}"/>'  class="form-control" required>
              </div>
              
              <div class="form-group">
                <label>상세 설명</label><input type="text" name="content" id="content" value='<c:out value="${faq.content}"/>' class="form-control" required>
              </div>
              
              <div class="form-group">
              <label>썸네일 등록</label><input type="file" name="thumbnail" id="thumbnail" value='<c:out value="${faq.thumbnail}"/>' onchange="checkImage(this)" multiple="multiple" class="form-control">
              </div>
              
              <div class="form-group" style="margin-top: 30px;  text-align:right;">
              	<input type="button" value="수정" class="btn btn-primary py-2 px-4" onclick="validate()">
              	<input type="button"  value="삭제"  class="btn btn-primary py-2 px-4" onclick="remove()">
  				<a href="/faq/list" class="btn btn-primary py-2 px-4">목록으로</a>
              </div>
              
            
            
            
            </form><!-- 공지사항 수정 폼 END -->
          
          </div>

        </div>
      </div>
    </section>
    
    			
<jsp:include page="../includes/footer.jsp" />
    
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