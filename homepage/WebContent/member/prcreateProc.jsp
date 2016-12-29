<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<%
	//업로드용 변수 선언(폴더명)
	String upDir = "/member/storage";
	String tempDir = "/member/temp";

	upDir = application.getRealPath(upDir);
	tempDir = application.getRealPath(tempDir);

	UploadSave upload = new UploadSave(request, -1, -1, tempDir);

	//form의 값을 받는다.
	String id = UploadSave.encode(upload.getParameter("id"));
	String email = upload.getParameter("email");
	String str = "";

	if (mdao.duplicateId(id)) {
		str = "ID 중복확인 안하고 넘어옴???<br>이 아이디 주인 이미 있음 ㅋㅋㅋㅋ<br>다시 돌아가서 다른 ID로 가입 ㄱㄱ";
	} else if (mdao.duplicateEmail(email)) {
		str = "E-Mail 중복확인 안하고 넘어옴???<br>이 E-mail주소로 이미 가입되어있음 ㅋㅋㅋㅋ<br>다시 돌아가서 다른 E-Mail주소로 가입 ㄱㄱ";
	} else {
		//creageProc.jsp이동
		request.setAttribute("upload", upload);
%>
<jsp:forward page="/member/createProc.jsp" />
<%
	return;
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
<title>prcreateProc</title>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body class="board_body">
	<jsp:include page="/menu/top.jsp" flush="false" />
	<div class="container">
		<!-- *********************************************** -->

		<h2>
			<span class="glyphicon glyphicon-user h2_span"></span>
			회원 가입 실패
		</h2>

		<div class="well proc_well" align="center">
			<%=str%>
		</div>

		<DIV class='bottom' align="center">
			<input type='button' class="btn btn-default" value='다시시도' onclick="history.back()">
		</DIV>

		<!-- *********************************************** -->
		<jsp:include page="/menu/bottom.jsp" flush="false" />
	</div>
</body>
<!-- *********************************************** -->
</html>
