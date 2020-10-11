<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="domain.Board,service.BoardService" %>
<%@ page import="java.util.ArrayList,java.util.List" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"> <!-- 글 편집기를 사용할 수 있게 만들어준다. -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
<script src="/resources/js/summernote-ko-KR.js"></script>
<script>
$(document).ready(function() {
	  $('#summernote').summernote({
 	    	placeholder: 'content',
	        minHeight: 370,
	        maxHeight: null,
	        focus: true, 
	        lang : 'ko-KR'
	  });
	});

function checking() {  /*제목이 공백이나 null값이면 경고창이 나온다*/
	if (document.getElementById("title").value == "" || document.getElementById("title").value == null) {
		alert("빈 칸을 채워주십시오");
	} else {
		document.upd.action="./board_write.jsp"; /*제목이 공백이나 null값이 아니면 writeDB.jsp로 이동*/
		document.upd.submit();  /*upd의 값을 넘긴다.*/
	}
}
</script>
</head>
<boby>
<div align=center>
	<%
		int n = Integer.parseInt(request.getParameter("key")); //글 번호를 인자로 받아서 정수로 변환
			BoardService bs = new BoardService();
			Board board = bs.selectOne(n); //해당 글 번호의 공지 객체를 들고옴
	%>
	<form method="post" name="upd" enctype="multipart/form-data">
	<table cellspacing=1 width=900 border=1 style="background-color:#FFFFFF;">   <!-- 공지 객체의 값들을 들고와서 테이블안에 출력 -->
	<tr> 
		<td style="background-color:#F2F4F4; text-align:center" width=150>번호</td>
		<td colspan=2><input style="width:450px;" type="text" name="num" id="num" value="<%=n%>" readonly></td>
	</tr>
	<tr> 
		<td style="background-color:#F2F4F4; text-align:center" width=150>제목</td>
		<td colspan=2><input style="width:600px;" type="text" name="title" id="title" value="<%=board.getTitle()%>"></td>
	</tr>
	<tr> 
		<td style="background-color:#F2F4F4; text-align:center" width=150>일자</td>
		<td colspan=2><%=board.getDate()%></td>
	</tr>
	<tr> 
		<td td style="background-color:#F2F4F4; text-align:center" width=150>파일</td>
		<td colspan=2><input type="file" name="file1"></td>
	</tr>
	<tr> 
		<td style="background-color:#F2F4F4; text-align:center" width=150>내용</td>		
		<td colspan=2 height=300px>
		<textarea id="summernote" style="width:500px;height:200px;overflow-y:scroll;resize:none;" type="text" name="content" value="<%=board.getContent()%>"><%=board.getContent()%></textarea></td>
	</tr>
	<%
	if (board.getRelevel() > 0) {	//댓글일 경우 원글과, 댓글 수준, 댓글 내 순서가 나타난다.	
	%>	
	<tr> 
		<td style="background-color:#F2F4F4;" width=150>원글</td>
		<td colspan=2 style="background-color:#F2F4F4;"><input style="width:200px" type="text" name="root" id="root" value="<%=board.getRootid()%>" readonly></td>
	</tr>
	<tr> 
		<td style="background-color:#F2F4F4; text-align:center" width=150>댓글 수준</td>
		<td style="background-color:#F2F4F4; border:0px;" width=300><input style="width:200px" type="text" name="relv" id="relv" value="<%=board.getRelevel()%>" readonly></td>
		<td style="background-color:#F2F4F4; border:0;">댓글내 순서 <input style="width:100px" type="text" name="recnt" id="recnt" value="<%=board.getRecnt()%>" readonly></td>
	</tr>
	<%
	}
	%>
	</table>	
	<br>
	<table width=900>
	<tr>
		<td width=750></td>
		<td><input type=button value="취소" Onclick="window.location='./e_02.jsp'"> 
		<input type=button value="쓰기" Onclick="checking()">
		<input type=button value="삭제" Onclick="window.location='./adm_board_delete.jsp?key=<%=n%>'"></td>
	</tr>
	</table>
</div>
</body>
</html>