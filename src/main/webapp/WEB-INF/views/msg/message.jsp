<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<link rel="stylesheet" href="/resources/css2/style.css">
<link rel="stylesheet" href="/resources/css2/responsive.css">
</head>
<body>

	<jsp:include page="../includes/menu.jsp" />
	<div class="hero-wrap hero-bread"
		style="background-image: url('/resources/images/bg_6.jpg');">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<h1 class="mb-0 bread">Message</h1>
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index.html">Home</a></span> <span
							class="mr-2"><a href="index.html">Message</a></span>
					</p>
				</div>
			</div>
		</div>
	</div>

	

	<section class="product_description_area">
		<div class="container">
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item">
					<a class="nav-link" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">보낸 쪽지</a>
				</li>
				<li class="nav-item">
					<a class="nav-link active" id="review-tab" data-toggle="tab" href="#review" role="tab" aria-controls="review" aria-selected="false">받은 쪽지</a>
				</li>
			</ul>
			<div class="tab-content" id="myTabContent">
			
				<div class="tab-pane fade" id="home" role="tabpanel" aria-labelledby="home-tab">
					<div class="table-responsive">
						<table class="table" style="width: 70%; height: 100%; margin-left: 30px;">
							<thead>
								<th><input type="checkbox" id="chk_all2"></th>
								<th><b style="color:#5D5D5D;">받은 사람</b></th>
								<th><b style="color:#5D5D5D;">제목</b></th>
								<th><b style="color:#5D5D5D;">날짜</b></th>
							</thead>
							<tbody class="sendMessage">
								
							</tbody>
						</table>
						
						
							<div class="col text-center" style="text-align: center;  margin: 30px 0px 30px 0px;">
								<div class="block-27">
									<div class="sendPanel-footer">
									
									</div>
									<button id="insertMsg2" style="float: left; margin-left: 40px;" 
									class="btn submit_btn">쪽지 쓰기</button>
									<button id="sendMsgCheckBoxDelete" style="float: right;
									margin-right:55px;" class="btn submit_btn">쪽지 삭제</button>
								</div>
							</div>
						
						
					</div>
				</div>
				
				<div class="tab-pane fade show active" id="review" role="tabpanel" aria-labelledby="review-tab">
					<div class="table-responsive" style="text-align: center;">
						<table class="table" style="width: 70%; height: 100%; margin-left: 30px;">
								<thead>
									<th><input type="checkbox" id="chk_all"></th>
									<th><b style="color:#5D5D5D;">보낸 사람</b></th>
									<th><b style="color:#5D5D5D;">제목</b></th>
									<th><b style="color:#5D5D5D;">날짜</b></th>
									<th><b style="color:#5D5D5D;">열람 여부</b></th>
								</thead>
								<tbody class="readMessage">
								
							</tbody>
						</table>
						 
						
							<div class="col text-center" style="text-align: center; margin: 30px 0px 30px 0px;">
								<div class="block-27">
									<div class="readPanel-footer">
									
									</div>
								</div>
								<button id="insertMsg" style="float: left; margin-left: 40px;" 
								class="btn submit_btn">쪽지 쓰기</button>
								<button id="readMsgCheckBoxDelete" style="float: right; 
								margin-right:55px;" class="btn submit_btn">쪽지 삭제</button>
							</div>
					</div>
				</div>

			</div>
		</div>
					
	</section>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel"></h4>
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			</div>
			<div class="modal-body">
				<div class="form-group" id="msgtitle">
					
				</div>
				<div class="form-group" id="msgadd">
					<label id="readerLabel">받는 사람</label>
					<p id="reader"></p>
					<div  id="sender">
					<label>받는 사람</label>
					<input type="text" class="form-control" name='reader' placeholder="reader">
					</div>
					<label>제목</label>
					<input type="text" class="form-control" name='title' placeholder="title">
					<label>내용</label>
					<!-- <input type="text" class="form-control" name='content'> -->
					<textarea id="sendMsgContent" rows="6" cols="20" class="form-control" placeholder="Content"></textarea>
				</div>
			</div>
			<div class="modal-footer">
				<button id='modalInsert' type="button" class="btn btn-default" >보내기</button>
				<button id='modalMsgAdd' type="button" class="btn btn-default" >답장하기</button>
				<button id='modalRegisterBtn' type="button" class="btn btn-default" >답장</button>
				<button id='modalCloseBtn' type="button" class="btn btn-primary">닫기</button>
			</div>
		</div>
<!-- /.modal-content -->
	</div>
<!-- /.modal-dialog -->
</div>



	
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>
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
	<script src="/resources/js/google-map.js"></script>
	<script src="/resources/js/main.js"></script>
	<script type="text/javascript" src="/resources/js/message.js"></script>
	<script type="text/javascript">

		$(document).ready(function () {
				var readValue = '<c:out value="${memberId}"/>';
				var rmessageUL = $(".readMessage");

				readshowList(1);

				// 받은쪽지 리스트 받은쪽지 리스트 받은쪽지 리스트 받은쪽지 리스트 받은쪽지 리스트 받은쪽지 리스트 받은쪽지 리스트 받은쪽지 리스트 받은쪽지 리스트 
				function readshowList(page){

					MessageService.getReadMsgList({reader:readValue, page:page||1}, function(readMsgCnt,list){

						if(page == -1){
							pageNum = Math.ceil(readMsgCnt / 10.0);
							readshowList(pageNum);
							return;
							}
						var str = "";
						var yes = "YES";
						if(list == null || list.length == 0){
							rmessageUL.html("");
							return;
							}
						for(var i=0, len=list.length || 0; i<len; i++){
							str += "<tr><td><input type='checkbox' id='" + list[i].msg_seq + "' name='check[]' class='allChk'></td>";
							str += "<td><h5>" + list[i].sender + "</h5></td><td><a href='#none' style='color:#5D5D5D; font-size:16px;' onclick='getReadMsg(";
							str += list[i].msg_seq + ")'>" + list[i].title + "</a></td>";
							str += "<td><h5>" + MessageService.displayTime(list[i].regDate) + "</h5></td>";
							str += "<td><label id='chk" + list[i].msg_seq +"' name='chk' class=" + (list[i].msgCheck == yes ? "'badge badge-success'" : "'badge badge-danger'") + " >" + list[i].msgCheck;
							str += "</label></td></tr>";
							}
						rmessageUL.html(str);
						
						showReadMsgPage(readMsgCnt);
						
						});
					}
				
				readPageFooter.on("click","ul li a", function(e){
					e.preventDefault();
					console.log("page click");

					var targetPageNum = $(this).attr("href");

					console.log("targetPageNum : " + targetPageNum);

					pageNum = targetPageNum;
					$("#chk_all").prop("checked", false);
					readshowList(pageNum);
					});
				
				// 받은쪽지 삭제 받은쪽지 삭제 받은쪽지 삭제 받은쪽지 삭제 받은쪽지 삭제 받은쪽지 삭제 받은쪽지 삭제 받은쪽지 삭제 받은쪽지 삭제 받은쪽지 삭제 받은쪽지 삭제 
				$("#readMsgCheckBoxDelete").on("click", function(){
					var chk = document.getElementsByName("check[]");

					var deleteMsg = confirm("선택된 쪽지를 삭제하시겠습니까?");

					if(deleteMsg){
						
						var checkList = $("input:checkbox[name='check[]']").is(":checked");
						
						if(checkList==false){
							alert("선택된 쪽지가 없습니다!");
							return false;
							}
					
					for(var i=0; i < chk.length; i++){
						if(chk[i].checked){
							var msg_seq = chk[i].id;
							MessageService.readMsgDelete(msg_seq, function(result){});
							
							}
						
						}
					alert("쪽지가 삭제되었습니다.");
					}
					readshowList(1);
				});

				
			});

		$(document).ready(function () {
			var sendValue = '<c:out value="${memberId}"/>';
			var smessageUL = $(".sendMessage");

			sendshowList(1);

			// 보낸 쪽지 리스트 보낸 쪽지 리스트 보낸 쪽지 리스트 보낸 쪽지 리스트 보낸 쪽지 리스트 보낸 쪽지 리스트 보낸 쪽지 리스트 보낸 쪽지 리스트 보낸 쪽지 리스트 
			function sendshowList(page){

				MessageService.getSendMsgList({sender:sendValue, page:page||1}, function(sendMsgCnt,list){

					if(page == -1){
						pageNum = Math.ceil(sendMsgCnt / 10.0);
						sendshowList(pageNum);
						return;
						}
					
					var str = "";
					
					if(list == null || list.length == 0){
						smessageUL.html("");
						return;
						}
					for(var i=0, len=list.length || 0; i<len; i++){
						str += "<tr><td><input type='checkbox' id='" + list[i].msg_seq + "' name='check2[]' class='allChk2'></td>";
						str += "<td><h5>" + list[i].reader + "</h5></td><td><a href='#none' style='color:#5D5D5D; font-size:16px;' onclick='getSendMsg(";
						str += list[i].msg_seq + ")'>" + list[i].title + "</a></td>";
						str += "<td><h5>" + MessageService.displayTime(list[i].regDate) + "</h5></td></tr>";
						}
					smessageUL.html(str);
					$("#chk_all2").prop("checked", false);
					showSendMsgPage(sendMsgCnt);
					});
				}
			
			
			$("#addMessageBtn").on("click",function(e){
				$("#msgadd").show();
				$("#msgtitle").hide();
				$(".modal-title").text("쪽지 보내기");
				$(".modal").modal("show");
				});

			sendPageFooter.on("click","ul li a", function(e){
				e.preventDefault();
				console.log("page click");

				var targetPageNum = $(this).attr("href");

				console.log("targetPageNum : " + targetPageNum);

				pageNum = targetPageNum;

				sendshowList(pageNum);
				});

			$("#sendMsgCheckBoxDelete").on("click", function(){
				var chk = document.getElementsByName("check2[]");

				var deleteMsg = confirm("선택된 쪽지를 삭제하시겠습니까?");

				if(deleteMsg){
					
					var checkList = $("input:checkbox[name='check2[]']").is(":checked");
					
					if(checkList==false){
						alert("선택된 쪽지가 없습니다!");
						return false;
						}
				
				for(var i=0; i < chk.length; i++){
					if(chk[i].checked){
						var msg_seq = chk[i].id;
						MessageService.sendMsgDelete(msg_seq, function(result){});
						
						}
					
					}
				alert("쪽지가 삭제되었습니다.");
				}
				sendshowList(1);
			});

		});

		// 받은 쪽지 쪽 쪽지쓰기 창 열기 받은 쪽지쪽 쪽지쓰기 창 열기 받은 쪽지쪽 쪽지쓰기 창 열기 받은 쪽지쪽 쪽지쓰기 창 열기 받은 쪽지쪽 쪽지쓰기 창 열기 받은 쪽지쪽 쪽지쓰기 창 열기 
		$("#insertMsg").on("click",function(){

			$("#msgtitle").hide();
			$("#msgadd").show();
			$("#reader").hide();
			$("#sender").show();
			$("#readerLabel").hide();
			$("#modalRegisterBtn").hide();
			$("#modalInsert").show();
			$("#modalMsgAdd").hide();
			$(".modal").modal("show");
		
			});


		// 보낸 쪽지 쪽 쪽지 쓰기 열기 보낸 쪽지 쪽 쪽지 쓰기 열기 보낸 쪽지 쪽 쪽지 쓰기 열기 보낸 쪽지 쪽 쪽지 쓰기 열기 보낸 쪽지 쪽 쪽지 쓰기 열기 보낸 쪽지 쪽 쪽지 쓰기 열기
		$("#insertMsg2").on("click",function(){

			$("#msgtitle").hide();
			$("#msgadd").show();
			$("#reader").hide();
			$("#sender").show();
			$("#readerLabel").hide();
			$("#modalRegisterBtn").hide();
			$("#modalInsert").show();
			$("#modalMsgAdd").hide();
			$(".modal").modal("show");
		
			});
		
		// 받은 쪽지 쪽 쪽지 쓰기 받은 쪽지 쪽 쪽지 쓰기 받은 쪽지 쪽 쪽지 쓰기 받은 쪽지 쪽 쪽지 쓰기 받은 쪽지 쪽 쪽지 쓰기 받은 쪽지 쪽 쪽지 쓰기 받은 쪽지 쪽 쪽지 쓰기 받은 쪽지 쪽 쪽지 쓰기 
		$("#modalInsert").on("click", function(){

			var sender = "<c:out value='${memberId}'/>";
			var reader = $(".modal").find("input[name='reader']");
			var title = $(".modal").find("input[name='title']");
			var content = $("#sendMsgContent");

			var message = {sender:sender, reader:reader.val(), title:title.val(), content:content.val()};
			
			if(reader.val()==null || reader.val().length==0){
				alert("받는 사람 ID를 입력해주세요!");
				return false;
				}
			if(title.val()==null || title.val().length==0){
				alert("제목을 입력해주세요!");
				return false;
				}
			if(content.val()==null || content.val().length==0){
				alert("내용을 입력해주세요!");
				return false;
				}

			var readerId = reader.val();
			
			MessageService.sendMsgMemberCheck(readerId, function(result){

				if(result <= 0){
					alert("존재하지 않는 ID입니다!! ID를 다시 확인해주세요 :D");
					return false;
				} else {

					MessageService.add(message, function(result){

						alert("쪽지를 보냈습니다! 답장을 기다려주세요 :D");
						$(".modal").find("input").val("");
						$("#sendMsgContent").val("");
						$(".modal").modal("hide");
							
						});
						
					}
				});
			});


		// 쪽지 읽기 쪽지 읽기 쪽지 읽기 쪽지 읽기 쪽지 읽기 쪽지 읽기 쪽지 읽기 쪽지 읽기 쪽지 읽기 쪽지 읽기 쪽지 읽기 쪽지 읽기 쪽지 읽기 
		function getReadMsg(msg_seq){

			var seq = msg_seq;

			MessageService.getReadMessage(seq, function(result){

				var modal = $(".modal");
				var str = ""

				str += "<div id='msgRead'>";
				str += "<b style='color:#F1B8C4;'>보낸 사람</b> : <b style='color:black;'>" + result.sender + "</b><b style='float:right; color:#F1B8C4;'>" + MessageService.displayTime(result.regDate) + "</b><br>";
				str += "<input type='hidden' name='readerName' value='" + result.sender + "'>"
				str += "<b style='color:#F1B8C4;'>받는 사람</b> : " + result.reader + "<hr>";
				str += "<h4 style='text-align: center; margin-bottom:30px; margin-top: 30px;'>제목 : " + result.title + "</h4>";
				str += "<p style='text-align: center; font-size:16px;'>" + result.content + "</p>";
				str += "</div>"

				$("#msgtitle").show();
				$(".modal-title").text("쪽지");
				$("#msgtitle").html(str)
				$("#msgadd").hide();
				$("#modalRegisterBtn").show();
				$("#modalMsgAdd").hide();
				$("#modalInsert").hide();
				modal.modal("show");

				});

			var MsgCheck = {msg_seq:msg_seq};
			
			MessageService.readMsgCheck(MsgCheck, function(result){
					
				$("#chk" + msg_seq).removeClass();
				$("#chk" + msg_seq).text("YES");
				$("#chk" + msg_seq).addClass('badge badge-success');
				});

			}

		// 답변하기 답변하기 답변하기 답변하기 답변하기 답변하기 답변하기 답변하기 답변하기 답변하기 답변하기 답변하기 
		$("#modalRegisterBtn").on("click",function(){

			var str = $(".modal").find("input[name='readerName']").val();
			$("#reader").show();
			$("#readerLabel").show();
			$("#reader").html(str);
			$("#sender").hide();
			$("#msgadd").show();
			$("#msgRead").hide();
			$("#modalRegisterBtn").hide();
			$("#modalMsgAdd").show();
			
			$("#modalMsgAdd").on("click", function(){
				
				var sender = '<c:out value="${memberId}" />';
				var reader = str;
				var title = $(".modal").find("input[name='title']");
				var content = $("#sendMsgContent");

				if(title.val()==null || title.val().length==0){
					alert("제목을 입력해주세요!");
					return false;
					}
				if(content.val()==null || content.val().length==0){
					alert("내용을 입력해주세요!");
					return false;
					}
				
				var message = {sender:sender, reader:reader, title:title.val(), content:content.val()};

				MessageService.add(message, function(result){

					alert("답장을 보냈습니다!");
					$(".modal").find("input").val("");
					$("#sendMsgContent").val("");
					$(".modal").modal("hide");
					
					});
				});
			});
		
			$("#modalCloseBtn").on("click",function(){

				$(".modal").find("input").val("");
				$("#sendMsgContent").val("");
				$(".modal").modal("hide");
			
			});

		function getSendMsg(msg_seq){

			var seq = msg_seq;

			MessageService.getSendMessage(seq, function(result){

				var modal = $(".modal");
				var str = ""

				str += "<b style='color:#F1B8C4;'>보낸 사람</b> : " + result.reader + "<b style='float:right; color:#F1B8C4;'>" + MessageService.displayTime(result.regDate) + "</b><br>";
				str += "<b style='color:#F1B8C4;'>받은 사람</b> : " + result.sender + "<hr>";
				str += "<h4 style='text-align: center; margin-bottom:30px;'>제목 : " + result.title + "</h4>";
				str += "<p style='text-align: center; font-size:16px;'>" + result.content + "</p>";

				$("#modalInsert").hide();
				$("#modalMsgAdd").hide();
				$("#modalRegisterBtn").hide();
				$("#msgtitle").show();
				$(".modal-title").text("쪽지");
				$("#msgtitle").html(str)
				$("#msgadd").hide();
				modal.modal("show");

				});

			}

		var pageNum = 1;
		var readPageFooter = $('.readPanel-footer');
		var sendPageFooter = $('.sendPanel-footer');
		
		function showReadMsgPage(readMsgCnt){
			
			var endNum = Math.ceil(pageNum / 10.0) * 10;
			
			var startNum = endNum - 9;

			var prev = startNum != 1;
			
			var next = false;

			if(endNum * 10 >= readMsgCnt){
				
				endNum = Math.ceil(readMsgCnt / 10.0);
				
				}
			if(endNum * 10 < readMsgCnt){
				
				next = true;
				}

			var str = "<ul>";

			if(prev){
				str += "<li style='margin-right: 5px;'><a href='" + (startNum -1) + "'>&lt;</a></li>";
				}
			
			for(var i = startNum; i <= endNum; i++){
				var active = pageNum == i ? "active" : "";

				str += "<li class='" + active + "' style='margin-right: 5px;'><a href='" + i + "'>" + i + "</a></li>"

				}

			if(next){
				str += "<li><a href='" + (endNum + 1) + "'>&gt;</a></li>";
				}

			str += "</ul>";

			console.log(str);
			readPageFooter.html(str);
			}

		function showSendMsgPage(sendMsgCnt){

			var endNum = Math.ceil(pageNum / 10.0) * 10;
			var startNum = endNum - 9;

			var prev = startNum != 1;
			var next = false;

			if(endNum * 10 >= sendMsgCnt){
				endNum = Math.ceil(sendMsgCnt / 10.0);
				}
			if(endNum * 10 < sendMsgCnt){
				next = true;
				}

			var str = "<ul>";

			if(prev){
				str += "<li style='margin-right: 5px;'><a href='" + (startNum -1) + "'>&lt;</a></li>";
				}

			for(var i = startNum; i <= endNum; i++){
				var active = pageNum == i ? "active" : "";

				str += "<li class='" + active + "' style='margin-right: 5px;'><a href='" + i + "'>" + i + "</a></li>"

				}

			if(next){
				str += "<li><a href='" + (endNum + 1) + "'>&gt;</a></li>";
				}

			str += "</ul>";

			console.log(str);
			sendPageFooter.html(str);
			}
	</script>
	<script type="text/javascript">
	// 체크박스 전체 선택 체크박스 전체 선택 체크박스 전체 선택 체크박스 전체 선택 체크박스 전체 선택 체크박스 전체 선택 
	$("#chk_all").click(function(){
		
		if($("#chk_all").is(":checked")){
			
			$(".allChk").prop("checked", true);
			}
		else{
			$(".allChk").prop("checked", false);
			}
		});

	$("#chk_all2").click(function(){
		
		if($("#chk_all2").is(":checked")){
			
			$(".allChk2").prop("checked", true);
			}
		else{
			$(".allChk2").prop("checked", false);
			}
		});
	</script>
<jsp:include page="../includes/footer.jsp" />	

</body>
</html>