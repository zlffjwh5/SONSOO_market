<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%
	//주문번호 생성 
	String today = new SimpleDateFormat("yyMMdd").format(new Date());		
	int random = (int) (Math.random()*10000)+1;											//중복을 피하기 위해 0~10000 사이의 무작위 수 1개 생성
	
									//Transaction Number의 약자 + 오늘 일자 + 무작위 숫자 = 주문번호
	String orderNumber = "TN"+today+random;
	out.print(orderNumber);
%>