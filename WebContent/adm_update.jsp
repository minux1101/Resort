<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="java.time.LocalDate"%>
<%@page import="domain.*, service.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>예약 수정</title>
<script>
function checking() {
   if (document.getElementById("name").value == "" || document.getElementById("name").value == null
      || document.getElementById("resv_date").value == "" || document.getElementById("resv_date").value == null
      || document.getElementById("room").value == "" || document.getElementById("room").value == null
      || document.getElementById("telnum").value == "" || document.getElementById("telnum").value == null) {      
         alert("내용을 입력해주세요.");  /*이름, 예약날짜, 예약방, 전화번호가 null값일 때 경고창이 나온다.*/
   } else {
      document.update.action="./adm_write.jsp";  /*내용을 입력했으면 adm_write.jsp로 이동*/
      document.update.submit();  /*update의 값을 넘긴다.*/
   }
}
</script>
</head>
<body>
<%
request.setCharacterEncoding("utf-8"); /*request로 받아온 파라미터의 인코딩을  utf-8형식으로*/
int roomNum = 0;
String room = null;

if(request.getParameter("room1") != null) {
	room = request.getParameter("room1");
  if(room.contains("스위트")) {
	  roomNum = 1;
  } else if(room.contains("패밀리")) {
	  roomNum = 2;
  } else {
	  roomNum = 3;
  }
}

String date = null;
if(request.getParameter("resv_date1") != null) {
  date = request.getParameter("resv_date1");
}

LocalDate currentDate = LocalDate.now();
ReserveService rService = new ReserveService();
Reserve reserve = rService.selectOne(date, roomNum);
%>

<br>
<center>
<h2>예약 확인 페이지 입니다.</h2>
</center>
<form method="post" name="update">
   <table align=center>
      <tr>
         <td width=100px height=30px>성명</td>
         <td><input style="height:20px" type="text" name ="name" id="name" value="<%=reserve.getName()%>"></td>
      </tr>
      <tr>
         <td width=100px height=30px>예약 일자</td>
         <td><input type='date' min="<%=currentDate%>" max="<%=currentDate.plusDays(30)%>" name ="resv_date" id="resv_date" value="<%=reserve.getResv_date()%>"></td>
      </tr>
      <tr>
         <td width=100px height=30px>예약방</td>
         <td><select style="width:120px; height:25px;" name="room" id="room">
         		  <option value="<%=room%>"><%=room%></option>
                  <option value="스위트">스위트</option>
                  <option value="패밀리">패밀리</option>
                  <option value="디럭스">디럭스</option>      
                </select></td>
      </tr>      
      <tr>
         <td width=100px height=30px>주소</td>
         <td><input style="height:20px" type="text" name ="addr" id="addr" value="<%=reserve.getAddr()%>" ></td>
      </tr>
      <tr>
         <td width=100px height=30px>전화번호</td>
         <td><input style="height:20px" type="text" name ="telnum" id="telnum" value="<%=reserve.getTelnum()%>" ></td>
      </tr>
      <tr>
         <td width=100px height=30px>입금자명</td>
         <td><input style="height:20px" type="text" name ="in_name" id="in_name" value="<%=reserve.getIn_name()%>" ></td>
      </tr>
      <tr>
         <td width=100px height=30px>남기실 말</td>
         <td><input style="height:20px" type="text" name ="comment" id="comment" value="<%=reserve.getComment()%>"></td>
      </tr>
      <tr> <!-- 전송을 누르면 checking 함수를 호출 수행한다. -->
         <td height=30px></td>
         <td><input style="margin-left:100px" type=button value="확인" Onclick="checking()">
         	 <input type=button value="취소" Onclick="window.location='./adm_oneview.jsp?title=<%=room%>&date=<%=reserve.getResv_date()%> <%=reserve.getName()%>'"></td>
      </tr>   
   </table>
   		<input type="hidden" name="id" value='<%=reserve.getId()%>'>
</form>

</body>
</html>