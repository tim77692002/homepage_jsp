<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	String passwd = request.getParameter("passwd");

	String col = request.getParameter("col");
	String word = request.getParameter("word");
	String nowPage = request.getParameter("nowPage");
	String oldfile = request.getParameter("oldfile");

	Map map = new HashMap();
	map.put("bbsno", bbsno);
	map.put("passwd", passwd);

	boolean pflag = bdao.passCheck(map);
	boolean flag = false;
	if (pflag) {
		flag = bdao.delete(bbsno);
	}
	if (flag) {
		String upDir = application.getRealPath("/bbs/storage");
		UploadSave.deleteFile(upDir, oldfile);
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
			게시판 글 삭제 결과
		</h2>
		<div class="well proc_well" align="center">
			<%
				if (pflag == false) {
					out.print("패스워드 틀림 ㅋㅋㅋㅋㅋ");
				} else if (flag) {
					out.print("삭제 성공 !!!!!!!!!!!!!!");
				} else {
					out.print("글 삭제 실패 ㅋㅋㅋㅋㅋ");
				}
			%>
		</div>
		<%
			if (pflag == false) {
		%>
		<DIV class='bottom' align="center">
			<input type='submit' value='재 시도' class="btn btn-default" onclick="history.back()">
			<input type='button' value='목록 보기' class="btn btn-default" onclick="blist()">
		</DIV>
		<%
			} else {
		%>
		<DIV class='bottom' align="center">
			<input type='submit' value='새글 작성' class="btn btn-default" onclick="location.href='createForm.jsp'">
			<input type='button' value='목록 보기' class="btn btn-default" onclick="blist()">
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
