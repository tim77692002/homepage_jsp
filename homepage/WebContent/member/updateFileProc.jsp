<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<%
	String upDir = application.getRealPath("/member/storage");
	String tempDir = application.getRealPath("/member/temp");
	UploadSave upload = new UploadSave(request, -1, -1, tempDir);
	String id = upload.getParameter("id");
	String oldfile = UploadSave.encode(upload.getParameter("oldfile"));

	FileItem fileItem = upload.getFileItem("fname");

	int size = (int) fileItem.getSize();
	String fname = null;

	if (size > 0) {
		UploadSave.deleteFile(upDir, oldfile);
		fname = UploadSave.saveFile(fileItem, upDir);
	}

	boolean flag = mdao.updateFile(id, fname);
%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>updateFileProc</title>
<script type="text/javascript">
function read() {
	var url = "read.jsp";
	url += "?id=<%=id%>";
		location.href = url;
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
			프로필 사진 변경 결과
		</h2>

		<div class="well proc_well" align="center">
			<%
				if (flag) {
					out.print("사진 변경 성공 !!!");
				} else {
					out.print("사진 변경 실패 !!!");
				}
			%>

		</DIV>

		<DIV class='bottom' align="center">
			<%
				if (flag) {
			%>
			<input type='button' class="btn btn-default" value='나의 정보' onclick="read()">
			<%
				} else {
			%>
			<input type='button' class="btn btn-default" value='재 시도' onclick="history.back()">
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