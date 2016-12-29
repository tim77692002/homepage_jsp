<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<%
	String email = request.getParameter("email");
	boolean flag = mdao.duplicateEmail(email);
%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>email_proc</title>
<script type="text/javascript">
	function use(){
	opener.frm.email.value='<%=email%>';
		window.close();
	}
</script>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body class="board_body">
	<!-- *********************************************** -->

	<h2>
		<span class="glyphicon glyphicon-user h2_span"></span>
		E-Mail 중복 확인 결과
	</h2>

	<div class="well proc_well" align="center">
		입력한 E-mail :
		<%=email%><br>
		<br>
		<%
			if (flag) {
				out.print("이 E-Mail 주소로 이미 누가 가입함 !!!<br>");
			} else {
				out.print("중복아님. 이거 사용 가능함.<br><br>");
				out.print("<input type='button' class='btn btn-default' value='사용' onclick='use()' >");
			}
		%>
	</DIV>

	<DIV class='bottom' align="center">
		<input type='button' value='재 시도' class="btn btn-default" onclick="location.href='email_form.jsp'">
		<input type='button' value='닫기' class="btn btn-default" onclick="window.close()">
	</DIV>

	<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html>