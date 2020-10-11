<meta charset="UTF-8" content="text/html"; http-equiv="Content-type" /> <!--html에서의 한글처리-->
<%@ page contentType="text/html; charset=UTF-8" %> <!--jsp에서의 한글처리-->
<%@ page import="java.sql.*, javax.sql.*, java.io.*,  service.*, domain.*, java.util.*"%> <!--필요한 임포트-->

<html>
<head>
</head>
<body>

<%
   request.setCharacterEncoding("utf-8");

   String jump = request.getParameter("jump");
   String id = request.getParameter("id");
   String pass = request.getParameter("passwd");

   Login login = new Login();
   LoginService loginService= new LoginService();
   
   login = loginService.selectOne(id);

	boolean bPassChk = false;

	if (id.replaceAll(" ", "").equals(login.getId().trim()) && pass.replaceAll(" ", "").equals(login.getPass().trim()))
	{
   		bPassChk = true;
	} else {
   		bPassChk = false;
	}

	if(bPassChk) {
   		session.setAttribute("login_ok", "yes");
   		session.setAttribute("login_id", id);
   		session.setAttribute("login_pass", pass);
   		response.sendRedirect(jump); //로그인체크 이후 돌아갈 곳
	} else { %>
   		<h2>아이디 또는 패스워드 오류.</h2>
   		<input type-button value='로그인' OnClick="location.href='./login.jsp?jump=<%=jump%>'">
  <%
  }
	%>

</body>
</html>