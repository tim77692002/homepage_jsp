<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<%
	String col = request.getParameter("col");
	String word = request.getParameter("word");
	String nowPage = request.getParameter("nowPage");

	int bbsno = Integer.parseInt(request.getParameter("bbsno"));

	bdao.upViewcnt(bbsno);

	BbsDto dto = bdao.read(bbsno);

	String content = dto.getContent();
	content = content.replaceAll("\r\n", "<br>");
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>read</title>
<script type="text/javascript">
	function blist() {
		var url = "list.jsp";
		url += "?col=<%=col%>";
		url += "&word=<%=word%>";
		url += "&nowPage=<%=nowPage%>";
		location.href = url;
	}
	function bupdate() {
		var url = "updateForm.jsp";
		url += "?bbsno=<%=bbsno%>";
		url += "&col=<%=col%>";
		url += "&word=<%=word%>";
		url += "&nowPage=<%=nowPage%>";
		location.href = url;
	}
	function bdelete() {
		var url = "deleteForm.jsp";
		url += "?bbsno=<%=bbsno%>";
		url += "&col=<%=col%>";
		url += "&word=<%=word%>";
		url += "&nowPage=<%=nowPage%>";
		url += "&oldfile=<%=dto.getFilename()%>";
		location.href = url;
	}
	function breply() {
		var url = "replyForm.jsp";
		url += "?bbsno=<%=bbsno%>";
		url += "&col=<%=col%>";
		url += "&word=<%=word%>";
		url += "&nowPage=<%=nowPage%>";
		location.href = url;
	}
	function down(filename){
		var url = "<%=root%>/download?dir=/bbs/storage&filename="+filename;
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
			게시판 글 조회
		</h2>

	<TABLE class="table table-hover">
		<TR>
			<TH>제목</TH>
			<TD><%=dto.getTitle()%></TD>
		</TR>
		<TR>
			<TH>성명</TH>
			<TD><%=dto.getWname()%></TD>
		</TR>
		<TR>
			<TH>내용</TH>
			<TD><%=dto.getContent()%></TD>
		</TR>
		<TR>
			<TH>조회수</TH>
			<TD><%=dto.getViewcnt()%></TD>
		</TR>
		<TR>
			<TH>작성일</TH>
			<TD><%=dto.getWdate().substring(0, 16)%></TD>
		</TR>
		<TR>
			<TH>파일</TH>
			<TD>
				<%
					if (dto.getFilename() == null) {
						out.print("파일 없음");
					} else {
				%>
				<a href="javascript:down('<%=dto.getFilename()%>')">
				<%=dto.getFilename()%>
				(<%=dto.getFilesize() / 1024%>KB)
					<span class="glyphicon glyphicon-floppy-save"></span>
				</a>
				<%
					}
				%>
			</TD>
		</TR>
	</TABLE>

	<DIV class='bottom' align="center">
		<input type='button' value='새글 작성' class="btn btn-default" onclick="location.href='./createForm.jsp'">
		<input type='button' value='목록 보기' class="btn btn-default" onclick="blist()">
			<input type='button' value='답글 작성' class="btn btn-default" onclick="breply()">
			<input type='button' value='수정' class="btn btn-default" onclick="bupdate()">
		<input type='button' value='삭제' class="btn btn-default" onclick="bdelete()">
	</DIV>

	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
	</div>
</body>
<!-- *********************************************** -->
</html>
