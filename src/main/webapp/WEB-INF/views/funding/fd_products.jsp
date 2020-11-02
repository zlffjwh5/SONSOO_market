<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html><html>
<head><meta charset="UTF-8">
<title>크라우드펀딩 상품 목록</title>
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
  <%-- 퍼센트바 색상변경 --%>  
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
            <h1 class="mb-0 bread">Crowd Funding</h1>
            <!-- <button id='regBtn' type="button" class="btn btn-primary py-1 px-2">펀딩 등록</button> -->
          </div>
        </div>
      </div>
    </div>
	
	<section class="ftco-section bg-light">
    	<div class="container-fluid">
    			<!-- 조건 검색 -->
    		
    		<form action="/funding/FProducts" method="get" >
    			<select name="type" class="txt" style="height: 34px; margin-bottom: 20px">
    				<option value="%%">전체</option>
	                <c:forEach var="cateVO" items="${categoryList}">
	                  <option value="${cateVO.category}" <c:if test="${cri.type==cateVO.category}"><c:out value="selected"/></c:if> >${cateVO.category}</option>
	                </c:forEach>      
	            </select>
	            <input name="keyword" type="text" class="txt" value="${cri.keyword}">
	            <input type="submit" value="검색" id="btnAdd" class="btn btn-primary py-1 px-2" style="margin-bottom: 5px">	
	         </form>	
	  
    		<!--  -->
    		<div class="row">
    			<c:forEach var="fpVO" items="${fpList}">
	    			<div class="col-sm col-md-6 col-lg-3 ftco-animate">
	    				<div class="product">
	    					<a class="img-prod move" href='<c:out value="${fpVO.fp_id}"/>'>
	    					<img class="img-fluid" src="/fimage/${fpVO.fp_image }" alt="product_img" style="width: 500px">
	    					</a>
	    					<div class="text py-3 px-3">
	    						<h3><a href='<c:out value="${fpVO.fp_id}"/>' class="move">[${fpVO.fp_category}] ${fpVO.fp_name}</a></h3>
	    						<div class="d-flex">
	    							<div class="pricing">
			    						<p class="price"><span><fmt:formatNumber type="number" value="${fpVO.fp_price }"/>원</span></p>
			    					</div>
			    				
		    					</div>
		    					<div class="progress" style="height:10px">
		    					<c:set var="percent" value="${(fpVO.funding_qty*fpVO.fp_price/fpVO.goal_cost)*100}"/>
		    					
	   							<div class="progress-bar bg-pink" style="width:<fmt:formatNumber value="${percent}" pattern="0"/>%"></div>
								</div>
		    					<hr>
	    						<p class="bottom-area d-flex">
	    							<a href='<c:out value="${fpVO.fp_id}"/>' class="add-to-cart move"><span>참여하기 <i class="ion-ios-add ml-1"></i></span></a>
	    							<%--<a href="#" class="ml-auto"><span><i class="ion-ios-heart-empty"></i></span></a>--%>
	    						</p>
	    					</div>
	    				</div>
	    			</div>
    			
    			</c:forEach>
    		</div>
    		<div class="row mt-5">
          <div class="col text-center">
            <div class="block-27">
              <ul>
              	<c:if test="${pageMaker.prev}">
              		<li><a href='<c:out value="${pageMaker.startPage-1}"/>' name="pageBtn">&lt;</a></li>
              	</c:if>
                <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                	<li name="pageBtn" class="${pageMaker.cri.pageNum==num? "active":""}">
                	<a href='<c:out value="${num}"/>' name="pageBtn">${num}</a>
                	</li>
                </c:forEach>
                <c:if test="${pageMaker.next}">
                	<li name="pageBtn"><a href='<c:out value="${pageMaker.endPage+1}"/>' name="pageBtn">&gt;</a></li>
                </c:if>
                <!-- <li class="active"><span>1</span></li> -->
              </ul>
            </div>
          </div>
        </div>
    	</div>
    </section>
    <!-- 페이지 번호 클릭시 동작 -->
		<form id='actionForm' action="/funding/FProducts" method='get'>
			<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
			<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
		</form>
	<!-- Modal  추가 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">크라우드 펀딩</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">처리 완료 메세지</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

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
<%--로그인 여부 확인용 
<script>
$(document).ready(function(){
	var memberId = '<c:out value="${memberId}"/>';
	
	$("#regBtn").on("click", function() {
		if(memberId===''||memberId){
			alert("로그인 먼저 해주세요");
			return;
		}
		self.location = "/funding/addFP";

	});
});
</script>--%>
	<%--상품 등록시 모달창 처리 --%>
	<script type="text/javascript">
		$(document).ready(function(){
			var result = '<c:out value="${result}"/>';
			checkModal(result);
			history.replaceState({},null,null);

			function checkModal(result){
				if(result===''||history.state){return;}
				else if(result==='successModify'){
					$(".modal-body").html("상품 정보가 수정되었습니다.");	
				}
				else if(result==='successDelete'){
					$(".modal-body").html("상품이 삭제되었습니다.");	
				}
				else{
					$(".modal-body").html("상품ID ["+result+"]으로 상품이 등록되었습니다.");	
				}

				$("#myModal").modal("show");
			}
			
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