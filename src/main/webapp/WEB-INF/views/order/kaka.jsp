<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

카카오페이 결제가 정상적으로 완료되었습니다.
 
결제일시:     ${approvalVO.approved_at}<br/>
주문번호:    ${approvalVO.partner_order_id}<br/>
상품명:    ${approvalVO.item_name}<br/>
상품수량:    ${approvalVO.quantity}<br/>
결제금액:   ${approvalVO.amount.total}<br/>
결제방법:   ${approvalVO.payment_method_type}<br/>
 
 
 
<h2>${vo}</h2>

</body>
</html>