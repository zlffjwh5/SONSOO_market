<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html><html>
<head><meta charset="UTF-8">
<title>크라우드펀딩 상품 수정</title>
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
    <script src='http://jquery-multifile-plugin.googlecode.com/svn/trunk/jquery.form.js' type="text/javascript" language="javascript"></script>
<script src='http://jquery-multifile-plugin.googlecode.com/svn/trunk/jquery.MetaData.js' type="text/javascript" language="javascript"></script>
<script src='http://jquery-multifile-plugin.googlecode.com/svn/trunk/jquery.MultiFile.js' type="text/javascript" language="javascript"></script>
<script src='http://jquery-multifile-plugin.googlecode.com/svn/trunk/jquery.blockUI.js' type="text/javascript" language="javascript"></script> 

    
<!--유효성 검사  -->
<script>
function validate(){
	var fname = document.getElementById("fp_name");
	var fprice = document.getElementById("fp_price");
	var goalCost = document.getElementById("goal_cost");
	var fdescription = document.getElementById("fp_description");
	var deadline = document.getElementById("deadline");
	var checkAgreeArray = document.getElementsByName("checkAgree");
	var uploadFile = document.getElementById("uploadFile");
	//상품명 체크
	if (fname.value.length < 4 || fname.value.length > 30) {
		alert("[상품명]\n최소 4자에서 최대 30자까지 입력하세요.");
		fname.select();
		fname.focus();
		return false;
	}
	// 상품 가격 체크
	if (fprice.value.length == 0 || isNaN(fprice.value)) {
		alert("[가격]\n숫자를 입력하세요.");
		fprice.select();
		fprice.focus();
		return false;
		
	}else if (parseInt(fprice.value) < 0 || !(is_integer(fprice.value))) {
		alert("[가격]\n1원 단위부터 입력할 수 있습니다");
		fprice.select();
		fprice.focus();
		return false;
	}
	// 목표 비용 체크
	if (goalCost.value.length == 0 || isNaN(goalCost.value)){
		alert("[목표 금액]\n숫자를 입력하세요.");
		goalCost.select();
		goalCost.focus();
		return false;
	}else if (goalCost.value < 0 || !(is_integer(goalCost.value))) {
		alert("[목표 금액]\n양의 정수만 입력할 수 있습니다");
		goalCost.select();
		goalCost.focus();
		return false;
	}else if(parseInt(goalCost.value)<=parseInt(fprice.value)){
		alert("[목표 금액]\n목표 금액은 상품 가격보다 높아야 합니다.");
		goalCost.select();
		goalCost.focus();
		return false;
	}
	//상세설명 체크
	if(fdescription.value.length<10){
		alert("[상세설명]\n 설명을 10자 이상 입력하세요");
		fdescription.focus();
		return false;
	}
	//펀딩 종료일 설정
	if(deadline.value.length==0){
		alert("[펀딩 종료일]\n펀딩 종료일을 입력해주세요.");
		return false;
	}
	
	//약관 확인 동의여부
	for(var i=0;i<checkAgreeArray.length;i++){
		if (checkAgreeArray[i].checked==false){
			alert("모든 약관에 동의해주세요");
			return false;
		}
	}
	
	//정수인지 판단하는 함수
	function is_integer(x)
	{
	    var reg = /^[-|+]?\d+$/;
	    return reg.test(x);
	}
	//스트링 날짜를 날짜 타입으로
	function to_date(date_str)
	{
	    var yyyyMMdd = String(date_str);
	    var sYear = yyyyMMdd.substring(0,4);
	    var sMonth = yyyyMMdd.substring(5,7);
	    var sDate = yyyyMMdd.substring(8,10);

	    return new Date(Number(sYear), Number(sMonth)-1, Number(sDate));
	}
	

}

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
</script>
</head>
<body>
<jsp:include page="../includes/menu.jsp" />
		<div class="hero-wrap hero-bread" style="background-image: url('/resources/images/bg_6.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
            <h1 class="mb-0 bread"><i class="fas fa-cloud"></i>펀딩 상품 수정(관리자)<i class="fas fa-cloud"></i></h1>
          </div>
        </div>
      </div>
    </div>
    		<section class="ftco-section">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-xl-8 ftco-animate">
			<form id="operForm" action="/funding/adminModifyFP" method="post" enctype="multipart/form-data" class="billing-form bg-light p-3 p-md-5">
							<h3 class="mb-4 billing-heading">상품 정보</h3>
							
	          	<div class="row align-items-end">
	          	<div class="col-md-6">
	                <div class="form-group">
	                	<label for="firstname">프로젝트 상태</label>
	                	<div class="select-wrap">
		                  <div class="icon"><span class="ion-ios-arrow-down"></span></div>
		                  <select name="fp_state" id="fp_state" class="form-control">
		                  	<c:forEach var='i' begin="0" end="2" step="1">
			                  	<option value="${i}" <c:if test="${fp.fp_state==i}"><c:out value="selected"/></c:if>>
			                  		<c:choose>
			    							<c:when test="${i==0}">펀딩 진행중</c:when>
			    							<c:when test="${i==1}">펀딩 마감(달성 성공)</c:when>
			    							<c:when test="${i==2}">펀딩 마감(달성 실패)</c:when>
			    					</c:choose>
			                  	</option>
		                 	 </c:forEach>
		                  </select>
		                </div>
	                </div>
	              </div>
	          	<div class="w-100"></div>
	          	<div class="col-md-6">
	                <div class="form-group">
	                	<label for="firstname">상품ID (수정 불가)</label>
	                  <input name="fp_id" id="fp_id" type="text" value="${fp.fp_id}" class="form-control" readonly>
	                </div>
	              </div>
              <div class="col-md-6">
                <div class="form-group">
                	<label for="firstname">주최자 (수정 불가)</label>
	              <input name="fp_seller" id="fp_seller" type="text" class="form-control" value="${fp.fp_seller}" readonly>
					</div>
	              </div>
	          	<div class="w-100"></div>
	          		<div class="col-md-6">
	                <div class="form-group">
	                	<label for="firstname">상품명</label>
	                  <input name="fp_name" id="fp_name" type="text" value="${fp.fp_name}" class="form-control">
	                </div>
	              </div>
	              <div class="col-md-6">
		            	<div class="form-group">
		            		<label for="category">카테고리</label>
		            		<div class="select-wrap">
		                  <div class="icon"><span class="ion-ios-arrow-down"></span></div>
		                  <select name="fp_category" id="fp_category" class="form-control">
		                  	<c:forEach var="cateVO" items="${categoryList}">
		                  	<option value="${cateVO.category}"
		                  	<c:if test="${fp.fp_category==cateVO.category}"><c:out value="selected"/></c:if>
		                  	>${cateVO.category}</option>
		                  </c:forEach>
		                  </select>
		                </div>
		            	</div>
		            </div>
 				  <div class="w-100"></div>
	              <div class="col-md-6">
	                <div class="form-group">
	                	<label for="lastname">가격 (수정 불가)</label>
	                  <input type="text" name="fp_price" id="fp_price" value="${fp.fp_price}" class="form-control" readonly>
	                </div>
                </div>
                <div class="col-md-6">
	                <div class="form-group">
	                	<label for="lastname">목표 금액</label>
	                  <input name ="goal_cost" id ="goal_cost" value="${fp.goal_cost}" type="text" class="form-control" >
	                </div>
                </div>
                <div class="col-md-6">
	                <div class="form-group">
	                	<label for="lastname">펀딩 시작일 (수정 불가)</label>
	                	<fmt:formatDate var="startDate" value="${fp.startDate }" pattern="yyyy-MM-dd"/>
	                  <input type="date" name="startDate" id="startDate" class="form-control" value="${startDate}" readonly>
	      
	                </div>
                </div>
                <div class="col-md-6">
	                <div class="form-group">
	                	<label for="lastname">펀딩 종료일 (수정 불가)</label>
	                	<fmt:formatDate var="deadline" value="${fp.deadline }" pattern="yyyy-MM-dd"/>
	                  <input type="date" name="deadline" id="deadline" class="form-control" value="${deadline}" readonly>
	                  
	                </div>
                </div>
                <div class="w-100"></div>
		         
		            <div class="w-100"></div>
		            <div class="col-md-12">
	                <div class="form-group">
	                	<label for="lastname">상세 설명</label>
	                  <textarea name="fp_description" id="fp_description" rows="6" cols="20" class="form-control">${fp.fp_description}</textarea>
	                </div>
               	   </div>
               	   <div class="col-md-6">
	                <div class="form-group">
	                	<label for="lastname">대표 이미지</label>
	                  <input type="file" onchange="checkImage(this)" 
	                  name="uploadFile" id="uploadFile" class="form-control" multiple="multiple">
	                </div>
                </div>
                <div class="w-100"></div>
                <div class="col-md-12">
                
                	<button data-oper='modify' onclick="return validate();" class="btn btn-primary py-3 px-4" style="background-color: #79ABFF">수정하기</button> 
                	<button data-oper='delete' onclick="deleteFP()" class="btn btn-primary py-3 px-4" style="background-color:#FF4848">삭제하기</button>
		         	<!-- <button data-oper='list' class="btn btn-primary py-3 px-4" >목록으로</button> -->
		         
		          </div>
	            </div>
	           	<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
	  			<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
	          </form><!-- END -->

          </div> <!-- .col-md-8 -->
        </div>
      </div>
    </section> <!-- .section -->

<script>
function deleteFP(){
 var id=$('#fp_id').val();
 location.href='/funding/adminDeleteFP?fp_id='+id;
	
}

</script>

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
  <script type="text/javascript" src="/resources/js/message.js"></script>
  <jsp:include page="../includes/footer.jsp" />
</body>
</html>