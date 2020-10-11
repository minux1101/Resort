<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> <!-- html에서 한글처리 -->
<%@page contentType="text/html; charset=utf-8" %>  <!-- jsp에서 한글처리 -->
<%@page import="java.io.*, java.util.*, domain.*, service.*"%> <!--JAVA import -->
<!DOCTYPE html>  <!-- html5로 작성 -->
<head>
<meta charset="utf-8">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<title>예약 삭제</title>
</head>
<body>
<%  
   ReserveService rs = new ReserveService();
	RoomCountService rcs = new RoomCountService();
	RoomCount rc = new RoomCount();
   request.setCharacterEncoding("utf-8"); /*request로 받아온 파라미터의 인코딩을  utf-8형식으로*/
   int roomNum = 0;
   String title = null;
   if(request.getParameter("room1") != null) {
   	  title = request.getParameter("room1");
     if(title.contains("스위트")) {
   	  roomNum = 1;
   	  rc.setrName("sweet");
     } else if(title.contains("패밀리")) {
   	  roomNum = 2;
   	  rc.setrName("family");
     } else {
   	  roomNum = 3;
   	  rc.setrName("delux");
     }
   }
 
   String date = null;
   if(request.getParameter("resv_date1") != null) {
		if(request.getParameter("resv_date1").length() > 10) {
			String d = request.getParameter("resv_date1");
			date = d.substring(0, 10);
		} else {
	  		date = request.getParameter("resv_date1");
		}
	}
   rc.setDate(date);
   Reserve reserve = new Reserve();
   rcs.updatePlus(rc);
   rs.delete(date, roomNum);  // 게시판 삭제
%>
	<script>
	   swal("삭제가 완료되었습니다.")
	   .then((value) => {window.location.href="./adm_allview.jsp";})	   
	</script>
</body>
</html>