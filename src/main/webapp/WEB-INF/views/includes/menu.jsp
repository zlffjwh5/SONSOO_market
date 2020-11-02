<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.msgBox {
    -ms-overflow-style: none; /* IE and Edge */
    scrollbar-width: none; /* Firefox */
}
.msgBox::-webkit-scrollbar {
    display: none; /* Chrome, Safari, Opera*/
}
</style>
<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light ftco-navbar-light-2" id="ftco-navbar">
	<div class="container">
		<a class="navbar-brand" href="/home">SONSOO</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
			<span class="oi oi-menu"></span> Menu
		</button>
		
		<div class="collapse navbar-collapse" id="ftco-nav">
			<ul class="navbar-nav ml-auto">
			
				<li class="nav-item"><a href="/home" class="nav-link">Home</a></li>
				
				<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="/products/productList" id="dropdown04" data-toggle="dropdown">Product</a>
					<div class="dropdown-menu" aria-labelledby="dropdown04">
						<a class="dropdown-item" href="/products/productList">All Products</a>
						<a class="dropdown-item" href="/products/productList?category=food">Food</a>
						<a class="dropdown-item" href="/products/productList?category=accessary">Accessary</a>
						<a class="dropdown-item" href="/products/productList?category=interior">Interior</a>
						<a class="dropdown-item" href="/products/productList?category=toy">Toy</a>
					</div>
				</li>
				<li class="nav-item"><a href="/funding/FProducts" class="nav-link">Crowd Funding</a></li>
				
				
				<li class="nav-item dropdown">
	          	<a class="nav-link dropdown-toggle" href="/products/productList" id="dropdown04" data-toggle="dropdown">Community</a>
              		<div class="dropdown-menu" aria-labelledby="dropdown04">
              			<a class="dropdown-item" href="/notice/list">공지사항</a>
                		<a class="dropdown-item" href="/faq/list">FAQ</a>
              		</div>
              	</li>
				
				<li class="nav-item cta cta-colored">
					<a href="/products/cart?id=${memberId}" class="nav-link">
	          		<span class="icon-shopping_cart"></span><!-- [0] -->
	          		</a>
				</li>
				
				<li class="nav-item dropdown">
	          	<a class="nav-link dropdown-toggle" href="/msg/message" id="readMsgCount" data-toggle="dropdown"><span class="icon-message"></span><b style="color:black;">[0]</b></a>
	          	<div class="dropdown-menu" id="msgMenu" aria-labelledby="dropdown04">
	          		
	          		
              	</div> 
	          </li>
				
				<c:choose>
					<c:when test="${empty memberId}">
						<li class="nav-item"><a href="/member/login" class="nav-link">LOGIN / JOIN</a></li>
					</c:when>
					<c:otherwise>
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown">[ ${memberId} ]</a>
							<div class="dropdown-menu" aria-labelledby="dropdown04">
								<c:if test="${memberId=='admin'}">
									<a class="dropdown-item" href="/member/logout" class="nav-link">LOGOUT</a>
									<a class="dropdown-item" href="/products/productManagement">Product Management</a>
									<a class="dropdown-item" href="/funding/adminFPList">Funding Management</a>
									<a class="dropdown-item" href="/history/AdminShippingSet">Admin Shipping Status</a>
									<a class="dropdown-item" href="/history/AdminRefundSet">Admin Refund Status</a>
									<a class="dropdown-item" href="/chart/chart">Admin Chart</a>
									<a class="dropdown-item" href="/visitor/adminMember">Admin M Management</a>
								</c:if>
								<c:if test="${memberId!='admin'}">
									<a class="dropdown-item" href="/member/logout" class="nav-link">LOGOUT</a>
									<a class="dropdown-item" href="/member/myinfo?id=${memberId}">MY INFO</a>
									<a class="dropdown-item" href="/history/buyList">구매 내역</a>
									<a class="dropdown-item" href="/history/shippingList">배송 현황</a>
									<a class="dropdown-item" href="/history/refundList">취소/반품 내역</a>
									<!-- productListSeller페이지에 로그인아이디와 판매자아이디 같은 경우에만 등록 버튼 노출 -->
									<a class="dropdown-item" href="/products/productListSeller?id=${memberId}">My Product</a>
									<a class="dropdown-item" href="/msg/message">My Message</a>	
									<!-- 펀딩과 관련 없는 메뉴는 이 줄 위에 써주세요 -->
									<a class="dropdown-item" style="color: #BDBDBD;">---Crowd Funding---</a>	
									<a class="dropdown-item" href="/funding/mypageSeller">My Project</a>
									<a class="dropdown-item" href="/funding/orderFPList">My Order</a>								
								</c:if>
							</div>
						</li>
					</c:otherwise>
				</c:choose>
			
			</ul>
		</div>
	</div>
</nav>