<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html><html>
<head><meta charset="UTF-8">
<title>크라우드 펀딩 관리</title>
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
          <h1 class="mb-0 bread">펀딩 관리</h1>
        </div>
      </div>
    </div>
  </div>
<section class="ftco-section ftco-cart">
	<div class="container">
		<div class="row">
  			<div class="col-md-12 ftco-animate">
  				<!-- 조건 검색 -->
	         <form action="/funding/adminFPList" method="get" >
	            <input type="text" name = "type" value="overDeadline" hidden="">
	            <input type="submit" value="마감이 필요한 상품 보기" id="btnAdd" class="btn btn-primary py-1 px-2" style="margin-bottom: 5px ;background-color: #79ABFF;float: right;">	
	         	<input name="keyword" type="text" class="txt" value="" hidden>
	         </form>
	         <form action="/funding/adminFPList" method="get">
	   			<select name="type" class="txt" style="height: 34px; margin-bottom: 20px">
	   				<option value="%%">주최자/상품명</option>
	   				<option value="seller" <c:if test="${cri.type=='seller'}"><c:out value="selected"/></c:if> >주최자</option>
	   				<option value="fp_name" <c:if test="${cri.type=='fp_name'}"><c:out value="selected"/></c:if> >상품명</option>
	            </select>
	            <input name="keyword" type="text" class="txt" value="${cri.keyword}">
	            <input type="submit" value="검색" id="btnAdd" class="btn btn-primary py-1 px-2" style="margin-bottom: 5px">	
	         </form>
	         
   				<table class="table">
				    <thead class="thead-primary">
				      <tr class="text-center">
				        <th>주최자</th>
				        <th>이미지</th>
				        <th>정보</th>
				        <th>달성률</th>
				        <th>마감일</th>
				        <th>펀딩 상태</th>
				      </tr>
				    </thead>
				    <tbody>
				   		<c:forEach var="fpVO" items="${fpList}">
						      <tr class="text-center">
						        <td class="product-remove">${fpVO.fp_seller}</td>
						        
						        <td class="image-prod">
						        <a href="/funding/adminModifyFP?fp_id=${fpVO.fp_id}">
						        <img class="img-fluid" src="/fimage/${fpVO.fp_image }" alt="product_img" style="width: 100px">
						        </a>
						        </td>
						        
						        <td class="product-name">
						        	<a href="/funding/adminModifyFP?fp_id=${fpVO.fp_id}">
						        	<h3>상품ID: ${fpVO.fp_id}</h3>
						        	</a>
						        	<p>상품명: ${fpVO.fp_name} <br>카테고리: ${fpVO.fp_category} </p>
						        </td>
						        <c:set var="percent" value="${(fpVO.funding_qty*fpVO.fp_price/fpVO.goal_cost)*100}"/>
						        <td class="price"><fmt:formatNumber value="${percent}" pattern="0"/>%</td>
						        <fmt:formatDate var="deadline" value="${fpVO.deadline }" pattern="yyyy-MM-dd"/>
						        <td class="price">${deadline}</td>
						        <td class="total">
			                  		<c:choose>
			    							<c:when test="${fpVO.fp_state==0}"> 진행중</c:when>
			    							<c:when test="${fpVO.fp_state==1}"> 마감(달성 성공)</c:when>
			    							<c:when test="${fpVO.fp_state==2}"> 마감(달성 실패)</c:when>
			    					</c:choose>
						    	</td>
						      </tr><!-- END TR-->
						</c:forEach>
				    </tbody>
				  </table>
  			</div>
  		</div>

  		
	</div>
	
		  <div class="row mt-5">
          <div class="col text-center">
	         <!-- 페이지아이콘처리 -->
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
        
	</section>

    <!-- 페이지 번호 클릭시 동작 -->
		<form id='actionForm' action="/funding/adminFPList" method='get'>
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
			<%--상세--%>
			$(".move").on("click",function(e){
				e.preventDefault();
				actionForm.append("<input type='hidden' name='fp_id' value='"+
						$(this).attr("href")+"'>");
				actionForm.attr("action","");	
				actionForm.submit();	
				});
		});
	</script>
	
    <script type="text/javascript" src="/resources/js/message.js"></script>
  <jsp:include page="../includes/footer.jsp" />
</body>
</html>