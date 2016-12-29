<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<%
	int no = Integer.parseInt(request.getParameter("no"));
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>방명록 삭제</title>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body class="board_body">
	<jsp:include page="/menu/top.jsp" flush="false" />
	<div class="container">
		<!-- *********************************************** -->
		<h2>
			<span class="glyphicon glyphicon-list-alt h2_span"></span>
			방명록 삭제
		</h2>
		<DIV class="content">
			<form method="post" action="deleteProc.jsp">
				<input type="hidden" name="no" value="<%=no%>">
				<input type="hidden" name="col" value="<%=request.getParameter("col")%>">
				<input type="hidden" name="word" value="<%=request.getParameter("word")%>">
				<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage")%>">
				<div class="well" align="center" id="guest_well">
					삭제를 하면 복구 될 수 없습니다.
					<br>
					삭제하시려면 삭제버튼을 클릭하세요
					<br>
					취소하시면 목록창으로 돌아갑니다
					<br>
				</div>
				<div class='bottom' align="center">
					<input type="submit" class="btn btn-default" value="삭제">
					<input type="button" class="btn btn-default" value="취소" onclick="location.href='./list.jsp'">
				</div>
			</form>
		</div>
		<!-- *********************************************** -->
		<jsp:include page="/menu/bottom.jsp" flush="false" />
	</div>
</body>
<!-- *********************************************** -->
</html>