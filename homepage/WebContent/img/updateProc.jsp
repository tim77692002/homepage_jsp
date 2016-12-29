<%@page import="java.awt.print.Printable"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dto" class="img.ImgDto" />
<%
	String upDir = "/img/storage";
	String tempDir = "/img/temp";

	upDir = application.getRealPath(upDir);
	tempDir = application.getRealPath(tempDir);

	UploadSave upload = new UploadSave(request, -1, -1, tempDir);

	String col = upload.getParameter("col");
	String word = UploadSave.encode(upload.getParameter("word"));
	String nowPage = upload.getParameter("nowPage");
	String oldfile = UploadSave.encode(upload.getParameter("oldfile"));

	dto.setNo(Integer.parseInt(upload.getParameter("no")));
	dto.setWname(UploadSave.encode(upload.getParameter("wname")));
	dto.setTitle(UploadSave.encode(upload.getParameter("title")));
	dto.setContent(UploadSave.encode(upload.getParameter("content")));
	dto.setPasswd(UploadSave.encode(upload.getParameter("passwd")));

	FileItem fileItem = upload.getFileItem("fname");

	int filesize = (int) fileItem.getSize();
	String fname = null;

	if (filesize > 0) { //새 파일을 업로드했다.
		UploadSave.deleteFile(upDir, oldfile); //기존파일을 삭제
		fname = UploadSave.saveFile(fileItem, upDir);
	}

	dto.setFname(fname);

	Map map = new HashMap();
	map.put("no", dto.getNo());
	map.put("passwd", dto.getPasswd());
	boolean pflag = idao.passCheck(map);

	boolean flag = false;
	if (pflag) {
		flag = idao.update(dto);
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
<title>updateProc</title>
<script type="text/javascript">
function blist() {
	var url = "list.jsp";
	url += "?col=<%=col%>";
	url += "&word=<%=word%>";
	url += "&nowPage=<%=nowPage%>";
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
			글 수정 결과
		</h2>

		<div class="well proc_well" align="center">
			<%
				if (pflag == false) {
					out.print("패스워드 틀리셨습니다.");
				} else if (flag) {
					out.print("수정에 성공하셨습니다.");
				} else {
					out.print("수정 실패 하셨습니다.");
				}
			%>
		</div>

		<%
			if (pflag == false) {
		%>

		<DIV class='bottom' align="center">
			<input type='submit' value='재 시도' class="btn btn-default" onclick="history.back()">
			<input type='button' value='목록' class="btn btn-default" onclick="blist()">
		</DIV>

		<%
			} else {
		%>
		<DIV class='bottom' align="center">
			<input type='submit' value='새글 작성' class="btn btn-default" onclick="location.href='createForm.jsp'">
			<input type='button' value='목록' class="btn btn-default" onclick="blist()">
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