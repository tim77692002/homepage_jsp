<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");

	boolean flag = mdao.updatePw(id, passwd);
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>updatePwProc</title>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body class="board_body">
	<jsp:include page="/menu/top.jsp" flush="false" />
	<div class="container">
		<!-- *********************************************** -->
		<h2>
			<span class="glyphicon glyphicon-user h2_span"></span>
			Password 변경 결과
		</h2>
		<div class="well proc_well" align="center">
			<%
				if (flag) {
					out.print(" Password를 변경했습니다.<br> ");
				} else {
					out.print(" Password를 변경하지 못했습니다.<br> ");
					out.print(" 재시도 해보세요<br> ");
				}
			%>
		</DIV>

		<DIV class='bottom' align="center">
			<%
				if (!flag) {
			%>
			<input type='button' class="btn btn-default" value='재시도' onclick="history.back()">
			<%
				}
			%>
			<input type='button' class="btn btn-default" value='홈' onclick="location.href='../index.jsp'">

		</DIV>

		<!-- *********************************************** -->
		<jsp:include page="/menu/bottom.jsp" flush="false" />
	</div>
</body>
<!-- *********************************************** -->
</html>