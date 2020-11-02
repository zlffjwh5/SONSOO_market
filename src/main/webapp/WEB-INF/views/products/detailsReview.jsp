<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>Modist - Free Bootstrap 4 Template by Colorlib</title>
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
    <!-- END nav -->
		
		<div class="hero-wrap hero-bread" style="background-image: url('/resources/images/bg_6.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
            <h1 class="mb-0 bread">Review & Comments</h1>
            <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span class="mr-2"><a href="index.html">Product</a></span> <span>Blog Single</span></p>
          </div>
        </div>
      </div>
    </div>

    <section class="ftco-section ftco-degree-bg">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 ftco-animate" style="margin-top: -28px;">
           	<div class="item" style="margin-bottom: -50px;">
		                <div class="testimony-wrap py-4 pb-5">
		                  
		                  <div class="text text-center">
		                    <p class="name">Title : ${Dreview.title}</p>
		                    <span class="position" style="margin-left: 100px;">Writer : ${Dreview.id}</span>
		                    <input type="button" value="돌아가기" class="btn py-1 px-3 btn-primary" onclick='location.href="/products/product?id=${memberId}&p_id=${Dreview.p_id}"' style="float: right; margin-bottom: 10px;">
		                  </div>
		                </div>
		              </div>
           	
            <hr>
            <p>
              <img src='<spring:url value="/image/${Dreview.imageName}"/>' alt="" class="img-fluid">
            </p>
            <p>${Dreview.content }</p>
            
            <c:choose>
            	<c:when test="${memberId==Dreview.id}">
            		<div style="float: right;">
            			<a href="updateReview?rno=${Dreview.rno}" class="btn py-1 px-3 btn-primary">리뷰 수정</a>
            			<a href="deleteReview?rno=${Dreview.rno}&id=${Dreview.id}&p_id=${Dreview.p_id}" class="btn py-1 px-3 btn-primary">리뷰 삭제</a>
            		</div>
            	</c:when>
            </c:choose>
            
            
            <!-- <div class="pt-5 mt-5">
              <h3 class="mb-5">작품의 다른 구매후기</h3>
              <hr style="margin-top: -30px;">
              <ul class="comment-list">
                <li class="comment">
                  <div class="vcard bio">
                    <img src="/resources/images/person_1.jpg" alt="Image placeholder">
                  </div>
                  <div class="comment-body">
                    <h3>John Doe</h3>
                    <div class="meta">June 27, 2018 at 2:21pm</div>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quidem laborum necessitatibus, ipsam impedit vitae autem, eum officia, fugiat saepe enim sapiente iste iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
                    <p><a href="#" class="reply">보러가기</a></p>
                  </div>
                </li>
              </ul>
              END comment-list
            </div> -->
            
            


          </div> <!-- .col-md-8 -->
      
          
          
          <div class="col-lg-4 sidebar ftco-animate">
            <div class="sidebar-box ftco-animate">
            	<p>Comments
            	<hr>
            	
            <div class="chat">
                <div class="text" data-rcno='10'>
                  	<p style="margin: 0px;"><b>writer : one</b> 
                  	<br>
                  	<p style="margin: 0px;">가나다라마바사가나다라마바사가나다
                    <div><span class="icon-calendar" style="margin-left: 50%; margin-bottom: 100px;"> July 12, 2018</span></div>
                </div>  
             </div>
             
              <hr>
              
              
            
             	<input type="hidden" name="rno" value="${Dreview.rno}">
             	<input type="hidden" id="id" name="id" value="${memberId}">
             	<input type="text" id="content" class="form-control" name="content" placeholder="reply">
             	<input type="button" id="commentsAddBtn" value="댓글 작성" class="btn py-1 px-3 btn-primary" style="margin-top: 10px; float: right;">
             
             
          </div>

        </div>
      </div>
      </div>
      
    </section> <!-- .section -->
		
		

    
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
 
  <script src="/resources/js/reply.js"></script>
  <script type="text/javascript">
	$(document).ready(function (){

		var rnoValue = '<c:out value="${Dreview.rno}"/>';
		var replyUL = $(".chat");

		showList();

		function showList(){
		
			replyService.getList({rno:rnoValue}, function(list){
				var str = "";
				var id = $("#id").val();
				
				if (list == null || list.length == 0){
					str += "<img src='/resources/images/speech-bubble.png' style='padding: 20px; margin-top:-20px; margin-left: 25%; opacity: 0.3; width:150px; height:150px;'>";
					str += "<p style='text-align: center; margin-bottom: 20px; opacity: 0.6;'><b>Please leave the first comment :D</b>"
					replyUL.html(str);
					return;
					}
					for (var i=0, len = list.length || 0; i < len; i++){
						str += "<div class='text' data-rcno='" + list[i].rcno + "'>";
						str += "<p style='margin: 0px;'><b>writer : " + list[i].id + "</b>";
						
						if(list[i].id == id){
							str += "<a href='#none' onclick='commentsDelete(" + list[i].rcno + ")'> - 삭제</a><br>";
						}
						
						str += "<p style='margin: 0px;'>" + list[i].content;
						str += "<div><span class='icon-calendar' style='margin-left: 50%; margin-bottom: 100px;'>"
							 + replyService.displayTime(list[i].regDate) + "</span></div>";
						str += "</div>";
						}
					
					replyUL.html(str);
				
				}); 
		}
		
		$("#commentsAddBtn").on("click", function(e){

			if($('#content').val()=='' || $('#content').val().length == 0){
					alert('댓글을 입력해주세요');
					return false;
				}
			
			var reply = {
					id : $("#id").val(),
					content : $("#content").val(),
					rno : rnoValue
					};

			replyService.add(reply, function(result){

				showList();

				$("#content").val('');
	
				});
			});
		});
	
	function commentsDelete(rcno){

		replyService.remove(rcno, function(result){

			var rnoValue = '<c:out value="${Dreview.rno}"/>';
			var replyUL = $(".chat");

			showList();

			function showList(){
			
				replyService.getList({rno:rnoValue}, function(list){
					var str = "";
					var id = $("#id").val();
					
					if (list == null || list.length == 0){
						str += "<img src='/resources/images/speech-bubble.png' style='padding: 20px; margin-left: 25%; opacity: 0.3; width:150px; height:150px;'>";
						str += "<p style='text-align: center; margin-bottom: 20px; opacity: 0.6;'><b>Please leave the first comment :D</b>"
						replyUL.html(str);
						return;
						}
						for (var i=0, len = list.length || 0; i < len; i++){
							str += "<div class='text' data-rcno='" + list[i].rcno + "'>";
							str += "<p style='margin: 0px;'><b>writer : " + list[i].id + "</b>";
							
							if(list[i].id == id){
								str += "<a href='#none' onclick='commentsDelete(" + list[i].rcno + ")'> - 삭제</a><br>";
							} 
							
							str += "<p style='margin: 0px;'>" + list[i].content;
							str += "<div><span class='icon-calendar' style='margin-left: 50%; margin-bottom: 100px;'>"
								 + replyService.displayTime(list[i].regDate) + "</span></div>";
							str += "</div>";
							}
						
						replyUL.html(str);
					
					}); 
				}
			});
		}
  </script>
  <script src="/resources/js/google-map.js"></script>
  <script src="/resources/js/main.js"></script>
  <script type="text/javascript" src="/resources/js/message.js"></script>
  <jsp:include page="../includes/footer.jsp" />
</body>
</html>