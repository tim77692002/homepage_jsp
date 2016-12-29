<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dto" class="member.MemberDto" />
<%
	//업로드용 변수 선언(폴더명)
	String upDir = "/member/storage";
	String tempDir = "/member/temp";

	upDir = application.getRealPath(upDir);
	tempDir = application.getRealPath(tempDir);

	UploadSave upload = (UploadSave) request.getAttribute("upload");

	//form의 값을 받는다.
	dto.setId(UploadSave.encode(upload.getParameter("id")));
	dto.setMname(UploadSave.encode(upload.getParameter("mname")));
	dto.setAddress1(UploadSave.encode(upload.getParameter("address1")));
	dto.setAddress2(UploadSave.encode(upload.getParameter("address2")));

	dto.setPasswd(upload.getParameter("passwd"));
	dto.setTel(upload.getParameter("tel"));
	dto.setEmail(upload.getParameter("email"));
	dto.setZipcode(upload.getParameter("zipcode"));
	dto.setJob(upload.getParameter("job"));

	//form의 선택한 파일 받기
	FileItem fileItem = upload.getFileItem("fname");
	int size = (int) fileItem.getSize();
	String fname = null;
	if (size > 0) {
		fname = UploadSave.saveFile(fileItem, upDir);
	} else {
		fname = "member.jpg";
	}
	dto.setFname(fname);
	boolean flag = mdao.create(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>createProc</title>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body class="board_body">
	<jsp:include page="/menu/top.jsp" flush="false" />
	<div class="container">
		<!-- *********************************************** -->
		<h2>
			<span class="glyphicon glyphicon-user h2_span"></span>
			회원 가입 결과
		</h2>
		<div class="well proc_well" align="center">
			<%
				if (flag) {
					out.print("회원가입 성공!!!");
				} else {
					out.print("회원가입 실패!!!");
				}
			%>
		</div>
		<%
			if (flag) {
		%>
		<DIV class='bottom' align="center">
			<input type='button' class="btn btn-default" value='로그인' onclick="location.href='loginForm.jsp'">
			<input type='button' class="btn btn-default" value='홈' onclick="location.href='../index.jsp'">
		</DIV>
		<%
			} else {
		%>
		<DIV class='bottom' align="center">
			<input type='button' class="btn btn-default" value='재시도' onclick="history.back()">
			<input type='button' class="btn btn-default" value='홈' onclick="location.href='../index.jsp'">
		</DIV>
		<%
			}
		%>
		<!-- *********************************************** -->
		<jsp:include page="/menu/bottom.jsp" flush="false" />
	</div>
</body>
<!-- *********************************************** -->
</html>