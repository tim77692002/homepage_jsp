<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String root = request.getContextPath();

	/*----쿠키설정 내용시작----------------------------*/
	String c_id = ""; // ID 저장 여부를 저장하는 변수, Y
	String c_id_val = ""; // ID 값

	Cookie[] cookies = request.getCookies();
	Cookie cookie = null;

	if (cookies != null) {
		for (int i = 0; i < cookies.length; i++) {
			cookie = cookies[i];

			if (cookie.getName().equals("c_id")) {
				c_id = cookie.getValue(); // Y 
			} else if (cookie.getName().equals("c_id_val")) {
				c_id_val = cookie.getValue(); // user1... 
			}
		}
	}

	/*----쿠키설정 내용 끝----------------------------*/
%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>loginForm</title>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body class="board_body">
	<jsp:include page="/menu/top.jsp" flush="false" />
	<div class="container">
		<!-- *********************************************** -->

		<h2>
			<span class="glyphicon glyphicon-user h2_span"></span>
			Log In
		</h2>

		<FORM name='frm' method='POST' action='<%=root%>/member/loginProc.jsp'>
			<table class="table table-hover">
				<TR>
					<TH>ID</TH>
					<TD>
						<input type="text" name="id" placeholder="ID" value='<%=c_id_val%>'>
						<%
							if (c_id.equals("Y")) { // id 저장 상태라면
						%>
						<label><input type='radio' name='c_id' value='Y' checked='checked'> ID 저장</label>
						<%
							} else {
						%>
						<label> <input type='radio' name='c_id' value='Y'> ID 저장
						</label>
						<%
							}
						%>
					</TD>
				</TR>
				<TR>
					<TH>Password</TH>
					<TD>
						<input type="password" name="passwd" placeholder="Password">
					</TD>
				</TR>
			</TABLE>

			<DIV class='bottom' align="center">
				<input type='submit' class="btn btn-default" value='Login'>
				<input type='button' class="btn btn-default" value='회원가입' onclick="location.href='agreement.jsp'">
			</DIV>
		</FORM>

		<!-- *********************************************** -->
		<jsp:include page="/menu/bottom.jsp" flush="false" />
	</div>
</body>
<!-- *********************************************** -->
</html>