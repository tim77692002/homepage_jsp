<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	String passwd = request.getParameter("passwd");
	String oldfile = request.getParameter("oldfile");
	String upDir = application.getRealPath("/image/storage");

	String col = request.getParameter("col");
	String word = request.getParameter("word");
	String nowPage = request.getParameter("nowPage");

	Map map = new HashMap();
	map.put("no", no);
	map.put("passwd", passwd);

	boolean pflag = idao.passCheck(map);
	boolean flag = false;

	if (pflag) {
		flag = idao.delete(no);
	}
	if (flag) {

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
<meta charset="UTF-8">
<title>deleteProc</title>
<script type="text/javascript">
function ilist(){
	var url = "list.jsp";
	url+="?col=<%=col%>";
	url+="&word=<%=word%>";
	url+="&nowPage=<%=nowPage%>";
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
			글 삭제 결과
		</h2>
		<div class="well proc_well" align="center">
			<%
				if (pflag == false) {
					out.print("패스워드가 일치하지 않습니다.");
				} else if (flag) {
					out.print("글을 삭제 했습니다.");

				} else {
					out.print("글을 삭제했습니다.");
				}
			%>
		</div>
		<%
			if (pflag == false) {
		%>
		<DIV class='bottom' align="center">
			<input type='button' class="btn btn-default" value='돌아가기' onclick="history.back()">
			<input type='button' class="btn btn-default" value='목록' onclick="ilist()">
		</DIV>
		<%
			} else {
		%>
		<DIV class='bottom' align="center">
			<input type='button' class="btn btn-default" value='다시등록' onclick="location.href='createForm.jsp'">
			<input type='button' class="btn btn-default" value='목록' onclick="ilist()">
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
