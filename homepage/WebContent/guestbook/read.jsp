<%@page import="guestbook.GuestbookDto"%>
<%@ include file="/ssi/ssi.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String col = request.getParameter("col");
	String word = request.getParameter("word");
	String nowPage = request.getParameter("nowPage");

	int no = Integer.parseInt(request.getParameter("no"));

	gdao.upViewcnt(no);
	// 조회
	GuestbookDto dto = gdao.read(no);
	//조회 끝
	String content = null;
	if (dto != null) {
		content = dto.getContent();
		content = content.replaceAll("/r/n", "<br>");
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
<title>방명록 조회</title>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">

<script type="text/javascript">
	function mcreate() {
		var url = "createForm.jsp";
		location.href = url;
	}
	function mupdate(no) {
		var url = "updateForm.jsp";
		url += "?no=" + no;
		url += "&col=<%=col%>";
		url += "&word=<%=word%>";
		url += "&nowPage=<%=nowPage%>";
		location.href = url;
	}
	function mdelete(no) {
		var url = "deleteForm.jsp";
		url += "?no=" + no;
		url += "&col=<%=col%>";
		url += "&word=<%=word%>";
		url += "&nowPage=<%=nowPage%>";
		location.href = url;
	}
	function mlist() {
		var url = "list.jsp";
		url += "?col=<%=col%>";
		url += "&word=<%=word%>";
		url += "&nowPage=<%=nowPage%>";
		location.href = url;
	}
</script>
</head>
<!-- *********************************************** -->
<body class="board_body">
	<jsp:include page="/menu/top.jsp" flush="false" />
	<div class="container">
		<!-- *********************************************** -->
		<h2>
			<span class="glyphicon glyphicon-list-alt h2_span"></span>
			방명록 조회
		</h2>
		<DIV class="content" align="center">
			<table class="table table-hover">
				<tr>
					<th>제목</th>
					<td><%=dto.getTitle()%></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><%=dto.getWname()%></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><%=content%></td>
				</tr>
				<tr>
					<th>조회수</th>
					<td><%=dto.getViewcnt()%></td>
				</tr>
				<tr>
					<th>등록일</th>
					<td><%=dto.getWdate()%></td>
				</tr>
			</table>
			<div class='bottom'>
				<input type="button" class="btn btn-default" value="새글 작성" onclick="mcreate()">
				<input type="button" class="btn btn-default" value="수정" onclick="mupdate('<%=dto.getNo()%>')">
				<input type="button" class="btn btn-default" value="삭제" onclick="mdelete('<%=dto.getNo()%>')">
				<input type="button" class="btn btn-default" value="목록 보기" onclick="mlist()">
			</div>
		</div>
		<!-- *content* -->
		<!-- *********************************************** -->
		<jsp:include page="/menu/bottom.jsp" flush="false" />
	</div>
</body>
<!-- *********************************************** -->
</html>