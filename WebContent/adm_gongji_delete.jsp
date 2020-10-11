<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="domain.Gongji, service.GongjiService" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>글 삭제</title>
</head>
<body>
<%
	GongjiService g = new GongjiService();  /*공지 서비스겍체 생성*/
	request.setCharacterEncoding("utf-8"); /*request로 받아온 파라미터의 인코딩을  utf-8형식으로*/
	int n = Integer.parseInt(request.getParameter("key")); /*공지 번호를 인자로 받아옴*/
	Gongji del = g.selectOne(n);
	g.delete(n); /*공지 서비스의 delete 메소드를 호출해서 해당 공지 삭제*/
%>
	<H2><%=del.getTitle()%>(이)가 삭제 되었습니다</H2>
	<table width=650>
	<tr>
		<td width=550></td>
		<td><input type=button value="목록" Onclick="window.location='./e_01.jsp'"></td>
	</tr>   <!-- 목록 버튼을 누르면 gongji_list.jsp로 이동 -->
	</table>
</body>
</html>