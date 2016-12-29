<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<%
	String id = request.getParameter("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>updatePwForm</title>
<script type="text/javascript">
	function inCheck(f) {
		if (f.passwd.value == "") {
			alert("Password 입력칸 비었다!!!");
			f.passwd.focus();
			return false;
		}
		if (f.repasswd.value == "") {
			alert("Password 확인칸 비었다!!!");
			f.repasswd.focus();
			return false;
		}
		if (f.passwd.value != f.repasswd.value) {
			alert("Password 틀렸다!!!");
			f.passwd.focus();
			return false;
		}
	}
</script>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body class="board_body">
	<jsp:include page="/menu/top.jsp" flush="false" />
	<div class="container">
	<!-- *********************************************** -->
	<h2>
		<span class="glyphicon glyphicon-user h2_span"></span>
		Password 수정
	</h2>

	<FORM name='frm' method='POST' action='./updatePwProc.jsp' onsubmit="return inCheck(this)">
		<input type="hidden" name="id" value="<%=id%>">
		<TABLE>
			<TR>
				<TH>Password</TH>
				<TD>
					<input type="password" name="passwd" placeholder="새 Password 입력">
				</TD>
			</TR>
			<TR>
				<TH>Password 확인</TH>
				<TD>
					<input type="password" name="repasswd" placeholder="새 Password 확인">
				</TD>
			</TR>
		</TABLE>

		<DIV class='bottom' align="center">
			<input type='submit' class="btn btn-default" value='Password 변경'>
			<input type='button' class="btn btn-default" value='취소' onclick="history.back()">
		</DIV>
	</FORM>

	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
	</div>
</body>
<!-- *********************************************** -->
</html>