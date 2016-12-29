<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>

<!-- useBean은 객체생성역할 -->
<jsp:useBean id="dto" class="bbs.BbsDto" />
<%
	//업로드용 변수 선언(폴더명) 실제폴더 존재해야됨
	String upDir = "/bbs/storage";
	String tempDir = "/bbs/temp";
	//절대경로 생성
	upDir = application.getRealPath(upDir);
	tempDir = application.getRealPath(tempDir);

	UploadSave upload = new UploadSave(request, -1, -1, tempDir);
	dto.setWname(UploadSave.encode(upload.getParameter("wname")));
	dto.setTitle(UploadSave.encode(upload.getParameter("title")));
	dto.setContent(UploadSave.encode(upload.getParameter("content")));
	dto.setPasswd(UploadSave.encode(upload.getParameter("passwd")));

	FileItem fileItem = upload.getFileItem("filename");

	int size = (int) fileItem.getSize();
	String filename = null;

	if (size > 0) {
		filename = UploadSave.saveFile(fileItem, upDir);
	}

	dto.setFilesize(size);
	dto.setFilename(filename);

	boolean flag = bdao.create(dto);
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

<script type="text/javascript">
	function blist() {
		var url = "list.jsp";
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
			<span class="glyphicon glyphicon-list-alt h2_span"></span>
			게시판 글 작성 결과
		</h2>
		<div class="well proc_well" align="center">
			<%
				if (flag) {
					out.print("글이 등록 되었습니다.");
				} else {
					out.print("글이 등록되지 못했습니다.");
				}
			%>
		</DIV>
		<div class="bottom" align="center">
			<input type="button" value="새글 작성" class="btn btn-default" onclick="location='./createForm.jsp'">
			<input type="button" value="목록 보기" class="btn btn-default" onclick="blist()">
		</div>
		<!-- *********************************************** -->
		<jsp:include page="/menu/bottom.jsp" flush="false" />
	</div>
</body>
<!-- *********************************************** -->
</html>