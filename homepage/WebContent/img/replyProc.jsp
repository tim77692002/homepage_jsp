<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dto" class="img.ImgDto" />
<%
	String upDir = application.getRealPath("/img/storage");
	String tempDir = application.getRealPath("/img/temp");

	// beans
	UploadSave upload = new UploadSave(request, -1, -1, tempDir);

	// paging
	String col = upload.getParameter("col");
	String word = UploadSave.encode(upload.getParameter("word"));
	String nowPage = upload.getParameter("nowPage");

	// 답변을 위한 부모 값
	dto.setGrpno(Integer.parseInt(upload.getParameter("grpno")));
	dto.setIndent(Integer.parseInt(upload.getParameter("indent")));
	dto.setAnsnum(Integer.parseInt(upload.getParameter("ansnum")));

	// 부모글 삭제 확인
	dto.setNo(Integer.parseInt(upload.getParameter("no")));

	// form의 입력된 값 가져오기
	dto.setWname(UploadSave.encode(upload.getParameter("wname")));
	dto.setTitle(UploadSave.encode(upload.getParameter("title")));
	dto.setContent(UploadSave.encode(upload.getParameter("content")));
	dto.setPasswd(UploadSave.encode(upload.getParameter("passwd")));

	// filename 가져오기
	FileItem fileItem = upload.getFileItem("fname");
	int filesize = (int) fileItem.getSize();
	String fname = null;
	if (filesize > 0)
		fname = UploadSave.saveFile(fileItem, upDir);

	dto.setFname(fname);

	Map map = new HashMap();
	map.put("grpno", dto.getGrpno());
	map.put("ansnum", dto.getAnsnum());
	idao.upAnsnum(map);

	boolean flag = idao.createReply(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>replyProc</title>
<script type="text/javascript">
function blist(){
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
			답글 작성 결과
		</h2>
		<div class="well proc_well" align="center">
			<%
				if (flag) {
					out.println("답변 등록 완료");
				} else {
					out.println("답변 등록 실패");
				}
			%>
		</div>
		<DIV class="bottom" align="center">
			<input class='btn btn-default' type='button' value='계속 등록' onclick="location.href='./createForm.jsp'">
			<input class='btn btn-default' type='button' value='목록' onclick="blist()">
		</DIV>

		<!-- *********************************************** -->
		<jsp:include page="/menu/bottom.jsp" flush="false" />
	</div>
</body>
<!-- *********************************************** -->
</html>

