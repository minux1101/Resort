<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="java.time.LocalDate"%>
<%@page import="domain.*, service.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>예약 확인</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8"); /*request로 받아온 파라미터의 인코딩을  utf-8형식으로*/
int roomNum = 0;
String title = null;
if(request.getParameter("title") != null) {
	  title = request.getParameter("title");
  if(title.contains("스위트")) {
	  roomNum = 1;
  } else if(title.contains("패밀리")) {
	  roomNum = 2;
  } else {
	  roomNum = 3;
  }
}

String date = null;
if(request.getParameter("date") != null) {
  date = request.getParameter("date");
}

LocalDate currentDate = LocalDate.now();

ReserveService reserveService = new ReserveService();
Reserve reserve = reserveService.selectOne(date, roomNum);
%>
<br>
<center>
<h2>예약 확인 페이지 입니다.</h2>
</center>
<form method="post" name="reservation">
   <table align=center>
      <tr>
         <td width=100px height=30px>성명</td>
         <td><input style="height:20px" type="text" name ="name1" id="name1" value="<%=reserve.getName()%>" readonly></td>
      </tr>
      <tr>
         <td width=100px height=30px>예약 일자</td>
         <td><input type="text" name ="resv_date1" id="resv_date1" value="<%=date %>" readonly></td>
      </tr>
      <tr>
         <td width=100px height=30px>예약방</td>
         <td><input type="text" name="room1" id="room1" value="<%=title.substring(0,3)%>" readonly></td>         
      </tr>      
      <tr>
         <td width=100px height=30px>주소</td>
         <td><input style="height:20px" type="text" name ="addr1" id="addr1" value="<%=reserve.getAddr()%>" readonly></td>
      </tr>
      <tr>
         <td width=100px height=30px>전화번호</td>
         <td><input style="height:20px" type="text" name ="telnum1" id="telnum1" value="<%=reserve.getTelnum()%>" readonly></td>
      </tr>
      <tr>
         <td width=100px height=30px>입금자명</td>
         <td><input style="height:20px" type="text" name ="in_name1" id="in_name1" value="<%=reserve.getIn_name()%>" readonly></td>
      </tr>
      <tr>
         <td width=100px height=30px>남기실 말</td>
         <td><input style="height:20px" type="text" name ="comment1" id="comment1" value="<%=reserve.getComment()%>" readonly></td>
      </tr>
      <tr> <!-- 전송을 누르면 checking 함수를 호출 수행한다. -->
         <td height=30px></td>
         <td><input style="margin-left:50px" type=button value="수정" Onclick="window.location='./adm_update.jsp?room1=<%=title.substring(0,3)%>&resv_date1=<%=date %>'">
         	 <input type=button value="삭제" Onclick="window.location='./adm_delete.jsp?room1=<%=title%>&resv_date1=<%=date %>'">
        	 <input type=button value="확인" Onclick="window.location='./adm_allview.jsp'"></td>
      </tr>   
   </table>
</form>
</body>
</html>