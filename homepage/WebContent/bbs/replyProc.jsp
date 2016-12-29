<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dto" class="bbs.BbsDto" />
<%
	String upDir = application.getRealPath("/bbs/storage");
	String tempDir = application.getRealPath("/bbs/temp");

	UploadSave upload = new UploadSave(request, -1, -1, tempDir);

	//페이징과 검색을 위한 값
	String col = upload.getParameter("col");
	String word = UploadSave.encode(upload.getParameter("word"));
	String nowPage = upload.getParameter("nowPage");

	//답변을 위한 부모의 값
	dto.setGrpno(Integer.parseInt(upload.getParameter("grpno")));
	dto.setIndent(Integer.parseInt(upload.getParameter("indent")));
	dto.setAnsnum(Integer.parseInt(upload.getParameter("ansnum")));

	//부모글 삭제를 제한하기 위해서
	dto.setBbsno(Integer.parseInt(upload.getParameter("bbsno")));

	//form의 입력된 값 가져오기
	dto.setWname(UploadSave.encode(upload.getParameter("wname")));
	dto.setTitle(UploadSave.encode(upload.getParameter("title")));
	dto.setContent(UploadSave.encode(upload.getParameter("content")));
	dto.setPasswd(UploadSave.encode(upload.getParameter("passwd")));

	//filename 가져오기
	FileItem fileItem = upload.getFileItem("filename");
	int filesize = (int) fileItem.getSize();
	String filename = null;
	if (filesize > 0) {
		filename = UploadSave.saveFile(fileItem, upDir);
	}

	dto.setFilename(filename);
	dto.setFilesize(filesize);

	Map map = new HashMap();
	map.put("grpno", dto.getGrpno());
	map.put("ansnum", dto.getAnsnum());
	bdao.upAnsnum(map);
	boolean flag = bdao.createReply(dto);
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
			게시판 답글 작성 결과
		</h2>
		<div class="well proc_well" align="center">
			<%
				if (flag) {
					out.print("답글이 등록 되었습니다.");
				} else {
					out.print("답글이 등록되지 못했습니다.");
				}
			%>
		</DIV>
		<div class="bottom" align="center">
			<input type="button" class="btn btn-default" value="새글 작성" onclick="location='./createForm.jsp'">
			<input type="button" class="btn btn-default" value="목록 보기" onclick="blist()">
		</div>
		<!-- *********************************************** -->
		<jsp:include page="/menu/bottom.jsp" flush="false" />
	</div>
</body>
<!-- *********************************************** -->
</html>
