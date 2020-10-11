<meta charset="UTF-8" content="text/html"; http-equiv="Content-type" /> <!--html에서의 한글처리-->
<%@ page contentType="text/html; charset=UTF-8" %> <!--jsp에서의 한글처리-->
<%@ page import="java.sql.*, javax.sql.*, java.io.*,  service.*, domain.*, java.util.*"%> <!--필요한 임포트-->
<%@ page import="com.oreilly.servlet.*, com.oreilly.servlet.multipart.*" %> <!--MultipartRequest 사용에 대한 임포트-->
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<% 

String loginOK=null;
String jumpURL="login.jsp?jump=login_test.jsp";

loginOK = (String)session.getAttribute("login_ok");
if(loginOK == null) {
   response.sendRedirect(jumpURL);
   return;
}
if(!loginOK.equals("yes")) {
   response.sendRedirect(jumpURL);
   return;
}

%>
</head>
<body>
<div alian=center>
<h1> 로그인 오케이 </h1>
<script>
location.href="adm_allview.jsp";
</script>
<br>
<br>
</div>
</body>
</html>