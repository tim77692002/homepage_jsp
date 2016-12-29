<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<%
	String upDir = application.getRealPath("/member/storage");
	String id = request.getParameter("id");
	String oldfile = request.getParameter("oldfile");

	boolean flag = mdao.delete(id);

	if (flag) {
		UploadSave.deleteFile(upDir, oldfile);
		session.invalidate();
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
<title>deleteProc</title>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body class="board_body">
	<jsp:include page="/menu/top.jsp" flush="false" />
	<div class="container">
		<!-- *********************************************** -->

		<h2>
			<span class="glyphicon glyphicon-user h2_span"></span>
			회원 탈퇴 결과
		</h2>
		<div class="well proc_well" align="center">
			<%
				if (flag) {
					out.print("이제부터 영구출입금지! ㅂㅂ");
				} else {
					out.print("탈퇴 실패 !!! ㅋㅋㅋㅋ ");
				}
			%>
		</DIV>

		<DIV class='bottom' align="center">
			<input type='button' class="btn btn-default" value='홈' onclick="location.href='../index.jsp'">
			<%
				if (flag) {
			%>
			<input type='button' class="btn btn-default" value='회원가입' onclick="location.href='./agreement.jsp'">
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