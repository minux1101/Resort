<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.net.*, java.io.*, service.*, domain.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body BACKGROUND>
<% 
   Login login = new Login();
   LoginService loginService = new LoginService();
   String id = (String)session.getAttribute("login_id");
   String pass = (String)session.getAttribute("login_pass");
   SimpleDateFormat sdf = new SimpleDateFormat("YYYY년 MM월 dd일 HH시 mm분 ss초");
   long lastTime = (long) session.getLastAccessedTime();
   String time = sdf.format(new Date(lastTime));
   login.setId(id);
   login.setPass(pass);
   login.setTime(time);
   loginService.update(login);
   session.invalidate();
   out.println("<h2>로그아웃 되었습니다.</h2>");
   // 로그아웃 후 일반적으로는 홈으로 간다(여기서는 adm_login_test.jsp)
   out.println("<input type=button value='메인페이지' onClick=\"location.href='main.jsp'\">");
%>
</body>
</html>