<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="domain.*, service.*" %>
<%@ page import="java.util.*, java.text.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
<%
   request.setCharacterEncoding("utf-8"); /*request로 받아온 파라미터의 인코딩을  utf-8형식으로*/
   RoomCountService rcs = new RoomCountService();
   RoomCount rc = new RoomCount();
   RoomCount rc2 = new RoomCount();
   String bookName = request.getParameter("name");
   String date = null;
   if(request.getParameter("resv_date") != null) {
		if(request.getParameter("resv_date").length() > 10) {
			String d = request.getParameter("resv_date");
			date = d.substring(0, 10);
		} else {
	  		date = request.getParameter("resv_date");
		}
	}
   int id = Integer.parseInt(request.getParameter("id"));
   String address = request.getParameter("addr");
   String phone = request.getParameter("telnum");
   String depositName = request.getParameter("in_name");
   String word = request.getParameter("comment");
   
   //out.println(bookName);
   //out.println(date);
   //out.println(address);
   //out.println(phone);
   //out.println(depositName);
   //out.println(word);   
   
   ReserveService reserveService = new ReserveService();
   Reserve reserve = reserveService.selectId(id);
   
   rc.setDate(reserve.getResv_date());
   if(reserve.getRoom() == 1) {
	   rc.setrName("sweet");
   } else if(reserve.getRoom() == 2) {
	   rc.setrName("family");
   } else {
	   rc.setrName("delux");
   }
   
   int roomNum = 0;
   String rName = null;
   if (request.getParameter("room").contains("스위트")) {
      roomNum = 1;
     rName = "sweet";
   } else if (request.getParameter("room").contains("패밀리")) {
      roomNum = 2;
      rName = "family";
   } else {
      roomNum = 3;
      rName = "delux";
   }
   
   rc2 = rcs.selectOne(rName, date);
   
   Reserve reserve2 = new Reserve();
   if(rc2.getNum() == 0) { %>
     <script>
	   swal("이미 예약된 방입니다.")
	   .then((value) => {window.location.href="./adm_allview.jsp";})	   
	   </script>
  <% } else {
	  	reserve2.setId(id);
   		reserve2.setName(bookName);
   		reserve2.setResv_date(date);
   		reserve2.setRoom(roomNum);
   		reserve2.setAddr(address);
   		reserve2.setTelnum(phone);
   		reserve2.setIn_name(depositName);
   		reserve2.setComment(word);
   
   		reserveService.update(reserve2);
   		rcs.updatePlus(rc);
   		rcs.updateMinus(rc2);
   %>
	<script>
	   swal("예약이 수정되었습니다.")
	   .then((value) => {window.location.href="./adm_allview.jsp";})	   
	</script>
<%
  }
%>
</body>
</html>