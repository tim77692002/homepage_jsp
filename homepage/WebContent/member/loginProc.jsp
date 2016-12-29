<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String grade = null; //회원등급

	boolean flag = mdao.loginCheck(id, passwd);

	if (flag) { //회원일 경우
		grade = mdao.getGrade(id);
		session.setAttribute("id", id);
		session.setAttribute("grade", grade);
		// ---------------------------------------------- 
		// Cookie 저장, Checkbox는 선택하지 않으면 null 임 
		// ---------------------------------------------- 
		Cookie cookie = null;

		String c_id = request.getParameter("c_id"); // Y, 아이디 저장 여부 

		if (c_id != null) { // 처음에는 값이 없음으로 null 체크로 처리
			cookie = new Cookie("c_id", "Y"); // 아이디 저장 여부 쿠키 
			cookie.setMaxAge(120); // 2 분 유지 
			response.addCookie(cookie); // 쿠키 기록 

			cookie = new Cookie("c_id_val", id); // 아이디 값 저장 쿠키  
			cookie.setMaxAge(120); // 2 분 유지 
			response.addCookie(cookie); // 쿠키 기록  

		} else {
			cookie = new Cookie("c_id", ""); // 쿠키 삭제 
			cookie.setMaxAge(0);
			response.addCookie(cookie);

			cookie = new Cookie("c_id_val", ""); // 쿠키 삭제 
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		// --------------------------------------------- 
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>loginProc</title>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body class="board_body">
	<jsp:include page="/menu/top.jsp" flush="false" />
	<div class="container">
		<!-- *********************************************** -->

		<h2>
			<span class="glyphicon glyphicon-user h2_span"></span>
			Log In 결과
		</h2>

		<div class="well proc_well" align="center">
			<%
				if (flag) {
					out.print("Login 성공");
				} else {
					out.print("ID / Password 틀렸거나 회원이 아님!!! ㅋㅋㅋㅋ");
				}
			%>
		</DIV>

		<DIV class='bottom' align="center">
			<input type='button' class="btn btn-default" value='홈' onclick="location.href='../index.jsp'">
			<%
				if (flag) {
			%>
			<input type="button" class="btn btn-default" value="LogOut" onclick="location.href='./logout.jsp'">
			<%
				} else {
			%>
			<input type="button" class="btn btn-default" value="다시시도" onclick="history.back()">
			<%
				}
			%>
		</DIV>

		<!-- *********************************************** -->
		<jsp:include page="/menu/bottom.jsp" flush="false" />
	</div>
</body>
<!-- *********************************************** -->
</html>