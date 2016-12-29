<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<%
	String id = request.getParameter("id");
	if (id == null) {
		id = (String) session.getAttribute("id");
	}
	String oldfile = mdao.getFname(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>deleteForm</title>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body class="board_body">
	<jsp:include page="/menu/top.jsp" flush="false" />
	<div class="container">
		<!-- *********************************************** -->

		<h2>
			<span class="glyphicon glyphicon-user h2_span"></span>
			회원 탈퇴
		</h2>

		<FORM name='frm' method='POST' action='./deleteProc.jsp'>
			<input type="hidden" name="id" value="<%=id%>">
			<input type="hidden" name="oldfile" value="<%=oldfile%>">
			<div class="well proc_well" align="center">
				탈퇴하면 홈페이지 출입금지 랍니다.
				<BR>
				그래도 탈퇴할껍니까???
			</div>
			<DIV class='bottom' align="center">
				<input type='submit' class="btn btn-default" value='탈퇴'>
				<input type='button' class="btn btn-default" value='취소' onclick="history.back()">
			</DIV>
		</FORM>

		<!-- *********************************************** -->
		<jsp:include page="/menu/bottom.jsp" flush="false" />
	</div>
</body>
<!-- *********************************************** -->
</html>