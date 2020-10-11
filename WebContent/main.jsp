<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="domain.*, service.*, java.util.*, java.text.*, java.time.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>월드 리조트에 오신 것을 환영 합니다.</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<!--[if lte IE 8]><script src="css/ie/html5shiv.js"></script><![endif]-->
		<script src="js/jquery.min.js"></script>
		<script src="js/jquery.dropotron.min.js"></script>
		<script src="js/skel.min.js"></script>
		<script src="js/skel-layers.min.js"></script>
		<script src="js/init.js"></script>
		<noscript>
			<link rel="stylesheet" href="css/skel.css" />
			<link rel="stylesheet" href="css/style.css" />
		</noscript>
		<!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->
	</head>
</head>
<body class="homepage">

	<!-- Header -->
	<div id="header">
		<div class="container">
			<!-- Banner -->
			<div id="banner">
				<div class="container">
					<section>
						<header class="major">								
						</header>
					</section>			
				</div>
			</div>
		</div>
	</div>
	
	<!-- Featured -->
	<div class="wrapper style2">
		<section class="container">
			<header class="major">
				<h2>Welcome to World Resort</h2>
					<span class="byline">월드 리조트에서 특별한 추억을 만들어 보세요!</span>
			</header>
			<div class="row no-collapse-1">
				<section class="4u">
					<a class="image feature"><img src="images/pic02.jpg" alt=""></a>
					<p>프라이빗 해변에서 일출을 보면서 즐기는 조식</p>
				</section>
				<section class="4u">
					<a class="image feature"><img src="images/pic03.jpg" alt=""></a>
					<p>수영장에서 즐기는 특별한 저녁</p>
				</section>
				<section class="4u">
					<a class="image feature"><img src="images/pic04.jpg" alt=""></a>
					<p>동남아에 온 듯한 비치 뷰 수영장</p>
				</section>
			</div>
		</section>
	<%
		LoginService loginservice = new LoginService();
 		Login login = new Login();
    	String loginOK = null;
    	loginOK = (String)session.getAttribute("login_ok");
    
		if(loginOK != null) {
			if(loginOK.equals("yes")) {
				String id = (String)session.getAttribute("login_id");
				String pass = (String)session.getAttribute("login_pass");
				login.setId(id);
  				login.setPass(pass);
          		login = loginservice.selectOne(login.getId());
     %>
       			<br><br><p style=font-size:1.8em>최근 방문일은 (<%=login.getTime() %>) 입니다.</p> 
     <% 
       		}
     	} 
	%>	
	</div>
			
	<!-- Footer -->
	<div id="footer">
		월드리조트(주) 경기도 성남시 분당구 황새울로 329번길 5(서현동 272-6) (우)13590<br>
		대표자 : 이대표  Tel: 1111-2222 Fax: 070-0000-0000
	</div>

</body>
</html>