<meta charset="UTF-8" content="text/html"; http-equiv="Content-type" /> <!--html에서의 한글처리-->
<%@ page contentType="text/html; charset=UTF-8" %> <!--jsp에서의 한글처리-->
<%@ page import="java.sql.*, javax.sql.*, java.io.*,  service.*, domain.*, java.util.*"%> <!--필요한 임포트-->
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<%
   String jump = request.getParameter("jump");
%>
<div align=center>
<h2>관리자 로그인</h2>
<form method="post" action="loginck.jsp">
<table border=1>
   <tr>
      <td>아이디</td>
      <td><input type="text" name="id"></td>
   </tr>
   <tr>
      <td>비밀번호</td>
      <td><input type="password" name="passwd"></td>
   </tr>
   <tr>
      <td colspan=2 align=center><input type="submit" value="전송"></td>
   </tr>
</table>
<input type="hidden" name="jump" value='<%=jump%>'>
</form>
</div>
</body>