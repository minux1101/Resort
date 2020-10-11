<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.net.*, java.io.*" %>
<%@ page session="true" %>
<!DOCTYPE html>
<HTML> 
<HEAD> 
<meta charset="utf-8">
<TITLE>로그아웃</TITLE>
</HEAD> 
<BODY BACKGROUND>
<div align=center>
	
	<h2>로그아웃 하시겠습니까?</h2>
	<input type=button value='로그아웃' onClick="window.location='./logout.jsp'">

</div>
</body>
</html>
