<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html><html><head><meta charset="UTF-8">

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<title>공지사항</title>

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
            <h1 class="mb-0 bread">공지사항</h1>
            <p class="breadcrumbs">
            		<span class="mr-2"><a href="/home">Home</a></span>
            		<span class="mr-2"><a href="/products/productList">상품 목록</a></span>
            		<span class="mr-2"><a href="/funding/fd_products">펀딩 참여</a></span>
            	</p>
          </div>
        </div>
      </div>
</div>

<section class="ftco-section ftco-cart">
	<div style="margin-bottom:40px; margin-left:500px;">
	<form id='searchForm' action="list" method='get' class="row align-items-end mt-12 pt-12 d-flex" style="margin-left:200px;">
							<select name='type' class="form-control col-md-3">
								<option value="" <c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
								<option value="T" <c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
								<option value="C" <c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
								<option value="TC" <c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목 or 내용</option>
							</select> 
							<input type='text' class="form-control col-md-3" name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>' />
							<input type='hidden'  name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>' />
							<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>' />
							<button class='btn btn-primary col-ms-2'>검색</button>
	</form>
	</div>
	<div class="container">
				<div class="row">
    			<div class="col-md-12 ftco-animate">
    			
    			<form id="getForm" action="getget" method="get">
    			<input type="hidden" name='bno' value='<c:out value="${nvo.bno}"/>'>
    			<input type="hidden" name='summary' value='<c:out value="${nvo.summary}"/>'>
    			<input type="hidden" name='title' value='<c:out value="${nvo.title}"/>'>
    			<input type="hidden" name='thumbnail' value='<c:out value="${nvo.thumbnail}"/>'>
    			<input type="hidden" name='bno' value='<c:out value="${nvo.bno}"/>'>
    			<input type="hidden" name='id' id="id" value='<c:out value="${id}"/>'>
    			
    				<table class="table">
						    <thead class="thead-primary">
						      <tr class="text-center">
						      	<th>&nbsp;</th>
						        <th>번호</th>
						        <th>제목</th>
						        <th>등록일</th>
						        <th>조회수</th>
						      </tr>
						    </thead>
						    
						    <c:forEach var="nvo" items="${noticeList}">
						    <tbody>
						      <tr class="text-center">
						        <td class="image-prod"><img id="thumbnail" src="/image/notice/${nvo.thumbnail}" class="img" style="height: 100px; width: 100px;"></td>
						        <td id="bno">${nvo.bno}</td>
						        <td>
						        	<a id="move" class="img-prod move" href='get?bno=<c:out value="${nvo.bno}"/>'><b id="title">${nvo.title}</b></a>
						        	<p id="summary">${nvo.summary}</p>
						        </td>
						        
						        <td id="regDate">${nvo.regDate}</td>
						        
						        <td id="cnt">${nvo.cnt}</td>
						        
						      </tr><!-- END TR-->

						    </tbody>
						    </c:forEach>
						    
						  </table>
					  </form><!-- 공지사항 목록 폼 END -->
    			</div>
    		</div>
    		
    		<a href="/notice/write" id="block" class="btn btn-primary" style="margin-top:40px; margin-bottom:40px; margin-left:1000px;">작성</a>
 
    		
    	<div class="row mt-5">
          <div class="col text-center">
            <div class="block-27">
            <ul>
              <c:if test="${pageMaker.prev}">
							<li class="paginate_button previous">
							<a href="${pageMaker.startPage -1}">Previous</a></li>
						</c:if>

                       <%-- 페이지 리스트 출력 --%>
						<c:forEach var="num" begin="${pageMaker.startPage}"	end="${pageMaker.endPage}">
							<li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} ">
								<a href="${num}">${num}</a>
							</li>
						</c:forEach>

                       <%-- 다음 페이지 표시  --%>
						<c:if test="${pageMaker.next}">
							<li class="paginate_button next">
							<a href="${pageMaker.endPage +1 }">Next</a></li>
						</c:if>
              </ul>
            </div>
          </div>
        </div>
    		
			</div>
		</section>
		
		<!-- 페이지 번호 클릭시 동작 -->
		<form id='actionForm' action="/notice/list" method='get'>
			<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
			<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
			<input type='hidden' name='type' value='<c:out value="${ pageMaker.cri.type }"/>'> 
			<input type='hidden' name='keyword' 	value='<c:out value="${ pageMaker.cri.keyword }"/>'>
		</form>
	
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

<script>

	$(document)	.ready(	function() {

						$("#regBtn").on("click", function() {
							self.location = "/notice/write";
						});

						var actionForm = $("#actionForm");

						$(".paginate_button a").on("click",function(e) {
									e.preventDefault();// 페이지 이동 막기
									actionForm.find("input[name='pageNum']").val($(this).attr("href"));//이동 페이지 설정
									actionForm.submit();
						});

						$("#block").on("click",function(e) {
									if($('#id').val()!='admin'){ 
										e.preventDefault();
										alert('관리자만 접근 가능합니다.');
									}
						});

						var searchForm = $("#searchForm");

						$("#searchForm button").on("click",	function(e) {
									if (!searchForm.find("option:selected").val()) {
										alert("검색종류를 선택하세요");
										return false;
									}

									if (!searchForm.find(	"input[name='keyword']").val()) {
										alert("키워드를 입력하세요");
										return false;
									}

									searchForm.find("input[name='pageNum']").val("1");//pageNum에 값을 1로 세팅
									e.preventDefault();

									searchForm.submit();
								});
	});

</script>

</body>
</html>