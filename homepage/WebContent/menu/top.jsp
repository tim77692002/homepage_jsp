<%@ page contentType="text/html; charset=UTF-8"%>

<%
	String root = request.getContextPath();
	String id = (String) session.getAttribute("id");
	String grade = (String) session.getAttribute("grade");
%>
<!DOCTYPE html>
<html>
<head>
<title>W3.CSS Template</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<body>
	<!-- Links (sit on top) -->
	<nav class="navbar navbar-inverse ">
		<div class="container-fluid">
			<div class="navbar-header">
				<!-- 공통 -->
				<!-- 홈 게시판 이미지 방명록 -->
				<li><a href="<%=root%>/index.jsp" class="navbar-brand "><span class="glyphicon glyphicon-home"></span>  Home</a></li>
			</div>
			<ul class="nav navbar-nav">
				<li><a href="<%=root%>/bbs/list.jsp"><span class="glyphicon glyphicon-list-alt"></span>  Board</a></li>
				<li><a href="<%=root%>/img/list.jsp"><span class="glyphicon glyphicon-picture"></span>  PHOTOS</a></li>
				<li><a href="<%=root%>/guestbook/list.jsp"><span class="glyphicon glyphicon-pencil"></span> Guest Book</a></li>

				<!-- 비회원 -->
				<!-- 회원가입 로그인 -->
				<%
					if (id == null) {
				%>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="<%=root%>/member/loginForm.jsp"><span class="glyphicon glyphicon-log-in"></span>  Log In</a></li>
				<li><a href="<%=root%>/member/agreement.jsp"><span class="glyphicon glyphicon-user"></span>  Join</a></li>
			</ul>
			<!-- 일반회원 -->
			<!-- 내정보(수정 사진변경 탈퇴) 로그아웃 -->
			<%
				} else if (id != null && grade.equals("H")) {
			%>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="<%=root%>/member/read.jsp"><span class="glyphicon glyphicon-user"></span>  My Account</a></li>
				<li><a href="<%=root%>/member/logout.jsp"><span class="glyphicon glyphicon-log-out"></span>  Log out</a></li>
			</ul>
			<!-- 관리자 -->
			<!-- 회원목록 로그아웃 -->
			<%
				} else if (id != null && grade.equals("A")) {
			%>
			<li><a href="<%=root%>/admin/list.jsp"><span class="glyphicon glyphicon-user"></span>  Member List</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="<%=root%>/member/logout.jsp"><span class="glyphicon glyphicon-log-out"></span>  Log out</a></li>
			</ul>
			<%
				}
			%>
		</div>
	</nav>
</div>
	<!-- 내용 시작 -->
	<div >