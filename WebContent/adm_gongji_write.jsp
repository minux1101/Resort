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
<title>글 쓰기</title>
</head>
<body>
<%
	GongjiService gser = new GongjiService();  /*공지 서비스겍체 생성*/
	request.setCharacterEncoding("utf-8"); /*request로 받아온 파라미터의 인코딩을  utf-8형식으로*/
	String key = request.getParameter("num"); /*공지 번호를 인자로 받아옴*/
	int n1 = 0;
	String tit = request.getParameter("title");  /*공지 제목을 인자로 받아옴*/
	String cont = request.getParameter("content"); /*공지 내용을 인자로 받아옴*/
	Gongji gj = new Gongji(tit, cont);  /*공지객체를 생성해서 제목과 내용 값을 저장*/
	if (key.equals("insert")) {  /*인자로 받은 공지 번호가  insert일때, 공지 서비스의 insert메소드를 호출 실행*/
		gser.insert(gj);
		out.print("<H2>" + gj.getTitle() + " (이)가 등록되었습니다</H2>");
	} else {  /*인자로 받은 공지 번호가  insert가 아닐때*/
		n1 = Integer.parseInt(request.getParameter("num")); /*공지 번호를 인자로 받아와서 정수로 변환해 n1에 저장*/
		gj.setId(n1);  /*공지 번호를  n1으로 지정*/
		gser.update(gj); /*공지 서비스의 update메소드를 호출 실행*/
		out.print("<H2>" + gj.getTitle() + " (이)가 수정되었습니다</H2>");
	}
%>
	
	<table width=650>
	<tr>
		<td width=550></td>  <!-- 목록 버튼을 누르면 gongji_list.jsp로 이동 -->
		<td><input type=button value="목록" Onclick="window.location='./e_01.jsp'"></td>
	</tr>
	</table>
</body>
</html>