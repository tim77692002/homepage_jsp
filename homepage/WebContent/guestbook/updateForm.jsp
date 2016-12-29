<%@page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	GuestbookDto dto = gdao.read(no);
%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>방명록 수정</title>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body class="board_body">
	<jsp:include page="/menu/top.jsp" flush="false" />
	<div class="container">
		<!-- *********************************************** -->
		<h2>
			<span class="glyphicon glyphicon-list-alt h2_span"></span>
			방명록 수정
		</h2>
		<DIV class="content">
			<form name="frm" method="post" action="./updateProc.jsp" onsubmit="return input(this)">
				<input type="hidden" name="no" value="<%=no%>">
				<input type="hidden" name="col" value="<%=request.getParameter("col")%>">
				<input type="hidden" name="word" value="<%=request.getParameter("word")%>">
				<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage")%>">
				<table class="table table-hover">
					<tr>
						<th>제목</th>
						<td>
							<input type="text" name="title" size="30" value="<%=dto.getTitle()%>" />
						</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>
							<input type="text" name="wname" size="30" value="<%=dto.getWname()%>" />
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							<textarea rows="10" cols="30" name="content"><%=dto.getContent()%></textarea>
						</td>
					</tr>
				</table>
				<div class='bottom' align="center">
					<input type='submit' class="btn btn-default" value='수정'>
				</div>
			</form>
		</div>
		<!-- *content* -->
		<!-- *********************************************** -->
		<jsp:include page="/menu/bottom.jsp" flush="false" />
	</div>
</body>
<!-- *********************************************** -->
</html>