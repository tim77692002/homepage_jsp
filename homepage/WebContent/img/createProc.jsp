<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dto" class="img.ImgDto" />
<%
	String tempDir = application.getRealPath("/img/temp");
	String upDir = application.getRealPath("/img/storage");
	UploadSave upload = new UploadSave(request, -1, -1, tempDir);
	dto.setWname(UploadSave.encode(upload.getParameter("wname")));
	dto.setTitle(UploadSave.encode(upload.getParameter("title")));
	dto.setContent(UploadSave.encode(upload.getParameter("content")));
	dto.setPasswd(UploadSave.encode(upload.getParameter("passwd")));
	FileItem fileItem = upload.getFileItem("fname");
	int size = (int) fileItem.getSize();
	String fname = null;
	if (size > 0)
		fname = upload.saveFile(fileItem, upDir);
	dto.setFname(fname);
	boolean flag = idao.create(dto);
%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>createProc</title>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body class="board_body">
	<jsp:include page="/menu/top.jsp" flush="false" />
	<div class="container">
		<!-- *********************************************** -->

		<h2>
			<span class="glyphicon glyphicon-list-alt h2_span"></span>
			글 작성 결과
		</h2>
		<div class="well proc_well" align="center">
			<%
				if (flag) {
					out.print("등록 성공");
				} else {
					out.print("등록 실패");
				}
			%>
		</div>

		<%
			if (flag) {
		%>
		<DIV class='bottom' align="center">
			<input type="button" value='새로운 사진등록' class="btn btn-default" onclick="location.href='./createForm.jsp'">
			<input type='button' value='목록' class="btn btn-default" onclick="location.href='./list.jsp'">
		</DIV>
		<%
			} else {
		%>
		<DIV class='bottom' align="center">
			<input type="button" value='다시시도' class='btn btn-default' onclick="history.back()">
			<input type='button' value='목록' class='btn btn-default' onclick="location.href='./list.jsp'">
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
