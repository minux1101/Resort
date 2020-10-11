<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="domain.*, service.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>resv_mkdata</title>
</head>
<body>
<%
	ReserveService reserveService = new ReserveService();
	reserveService.create();
	for(int i = 0; i < 6; i++) {
		Reserve reserve = new Reserve();
		reserve.setName("김예약" + (i + 1));
		reserve.setResv_date("2020-08-" + (i + 10));
		reserve.setRoom(1);
		reserve.setAddr("서울시");
		reserve.setTelnum("010-1111-123" + i);
		reserve.setIn_name("김예약" + (i + 1));
		reserve.setComment("");
		reserve.setWrite_date("2020-07-1" + i);
		reserve.setProcessing(1);
		
		reserveService.insert(reserve);
	}	
%>
<script>
	alert("등록이 완료되었습니다.");
	window.location.href="index.html";
</script>
</body>
</html>

