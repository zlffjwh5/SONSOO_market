<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Modist - Free Bootstrap 4 Template by Colorlib</title>
<style>
     #star_grade a{
        text-decoration: none;
        color: gray;
    }
    #star_grade a.on{
        color: #f1b8c4;
    }
</style>
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
    
    
    <script type="text/javascript">
		function BackPage(){
				history.back();
			}
    </script>
    
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
			<div class="row justify-content-center">
				<div class="col-xl-8 ftco-animate">
					<form action="updateReviewPost" method="post" class="billing-form bg-light p-3 p-md-5" enctype="multipart/form-data">
						<h3 class="mb-4 billing-heading">- Review Update -</h3>
						
								
								<p id="star_grade" style="font-size: 20px;">
									Your Rating: &nbsp;&nbsp;
        							<a href="#none" id="star1">★</a>
        							<a href="#none" id="star2">★</a>
        							<a href="#none" id="star3">★</a>
        							<a href="#none" id="star4">★</a>
        							<a href="#none" id="star5">★</a>
			   					</p>
			   					
			   					<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
			    <script>
       			 
           			 $('#star_grade a').click(function(){
           				$(this).parent().children("a").removeClass("on");  /* 별점의 on 클래스 전부 제거 */ 
                		  $(this).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
                		  var star = $('.on').length;
                		  document.getElementById('starid').value = star;
                	  	return false;
               			 });
     			   
				</script>
			   					
						<div class="row align-items-end">
							<div class="col-md-12">
								<div class="form-group">
									<label for="firstname">Title</label> <input type="text"
										class="form-control" name="title" value="${Ureview.title}">
								</div>
							</div>

							<div class="col-md-12">
								<label for="firstname">Content</label>
								<textarea class="form-control" name="content" id="message"
									rows="10">${Ureview.content}</textarea>
							</div>
							<div class="col-md-12" style="margin-top: 20px;">
										<div class="form-group">
											<input type="file" name="uploadFile" id="img">
										</div>
										<div class="select_img"><img src=""/></div>
							</div>
							<input type="hidden" id="starid" name="star" value="">
							<input type="hidden" name="rno" value="${Ureview.rno}">
							<script>
 									 $("#img").change(function(){
 	 									 if(this.files && this.files[0]) {
 	 	 									 var reader = new FileReader;
 	 	 									 reader.onload = function(data) {
 	 	 	 									 $(".select_img img").attr("src", data.target.result).width(500);        
 	 	 	 									 }
 	 	 									 reader.readAsDataURL(this.files[0]);
 	 	 									 }
 	 									 });
 									 </script>
 							<div class="col-md-12 text-right">
								<button type="submit" value="submit" class="btn submit_btn">Update Now</button>
							</div>
						</div>
					</form>
					<!-- END -->
				</div>
				<!-- .col-md-8 -->
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
  <script src="/resources/https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="/resources/js/google-map.js"></script>
  <script type="text/javascript" src="/resources/js/message.js"></script>
  <script src="/resources/js/main.js"></script>
  <jsp:include page="../includes/footer.jsp" />
</body>
</html>