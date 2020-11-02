<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
		$(document).ready(function(){

			var reader = '${memberId}';

			MessageService.notReadMsgCount(reader,function(result){

				if(reader==null || reader.length==0){

					var str = "";
					str += "<a class='dropdown-item' href='/member/login'>로그인을 해주세요 :D</a>";
					$("#msgMenu").html(str);
					return false;
						
					} 
				
				MessageService.unreadMsg3Cnt({reader:reader}, function(list){

					if(result >= 1) {
						$("#readMsgCount b").text("[" + result + "]");
						var str = "";
						str += "<a class='dropdown-item' id='readMsgCount2'>읽지 않은 쪽지가 <b style='color:red;'>" + result + "건</b>";
						str += "있습니다 :D</a><hr style='margin-top:-0.5px;'>";
						str += "<div style='overflow: scroll; overflow-x:hidden; height:230px;' class='msgBox'>";
								
						for(var i=0; i<list.length; i++){
						str += "<a href='/msg/message' class='dropdown-item' style='padding:0px 0px 0px 10px; font-size:12px;'>보낸사람 : " + list[i].sender + "<br>제목 : " + list[i].title +"<b style='float:right; margin-right:20px; color:#FFBB00;'>" + MessageService.displayTime(list[i].regDate) + "</b></a><hr>";
						}
						str += "</div>";
						str += "<a class='dropdown-item' href='/msg/message' id='goToMsg' style='text-align:center;'><b style='color:black;'>바로 </b>";
						str += "<img src='/resources/images/msg.png' style='width:25px; height:25px; margin-bottom:-5px; margin-top:-10px;'><b style='color:black;'> 가기</b></a>";
						$("#msgMenu").html(str);
					} else {
						var str = "";
						str += "<b style='color:black;'><a class='dropdown-item' id='readMsgCount2'>도착한 쪽지가 없습니다!!</a></b><hr style='margin-top:-0.5px;'>";
						str += "";
						str += "<a class='dropdown-item' href='/msg/message' style='text-align:center;'><b style='color:black;'>바로 </b>";
						str += "<img src='/resources/images/msg.png' style='width:25px; height:25px; margin-bottom:-5px; margin-top:-10px;'><b style='color:black;'> 가기</b></a>";
						$("#msgMenu").html(str);
					}

							

					
					});
				});

			
			
			});
</script>

<footer class="ftco-footer bg-light ftco-section">
      <div class="container">
        <div class="row mb-5">
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">SONSOO</h2>
              <ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
                <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4 ml-md-5">
              <h2 class="ftco-heading-2">Menu</h2>
              <ul class="list-unstyled">
                <li><a href="#" class="py-2 d-block">Shop</a></li>
                <li><a href="#" class="py-2 d-block">About</a></li>
                <li><a href="#" class="py-2 d-block">Journal</a></li>
                <li><a href="#" class="py-2 d-block">Contact Us</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md-4">
             <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">Help</h2>
              <div class="d-flex">
	              <ul class="list-unstyled mr-l-5 pr-l-3 mr-4">
	                <li><a href="#" class="py-2 d-block">Shipping Information</a></li>
	                <li><a href="#" class="py-2 d-block">Returns &amp; Exchange</a></li>
	                <li><a href="#" class="py-2 d-block">Terms &amp; Conditions</a></li>
	                <li><a href="#" class="py-2 d-block">Privacy Policy</a></li>
	              </ul>
	              <ul class="list-unstyled">
	                <li><a href="#" class="py-2 d-block">FAQs</a></li>
	                <li><a href="#" class="py-2 d-block">Contact</a></li>
	              </ul>
	            </div>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
            	<h2 class="ftco-heading-2">Have a Questions?</h2>
            	<div class="block-23 mb-3">
	              <ul>
	                <li><span class="icon icon-map-marker"></span><span class="text">203 Fake St. Mountain View, San Francisco, California, USA</span></li>
	                <li><a href="#"><span class="icon icon-phone"></span><span class="text">+2 392 3929 210</span></a></li>
	                <li><a href="#"><span class="icon icon-envelope"></span><span class="text">info@yourdomain.com</span></a></li>
	              </ul>
	            </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12 text-center">

            <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart color-danger" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
						  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						</p>
          </div>
        </div>
      </div>
    </footer>