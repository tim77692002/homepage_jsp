<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dto" class="guestbook.GuestbookDto" />
<jsp:setProperty property="*" name="dto" />
<%
	boolean flag = gdao.create(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>방명록 작성 결과</title>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body class="board_body">
	<jsp:include page="/menu/top.jsp" flush="false" />
	<div class="container">
		<!-- *********************************************** -->
		<h2>
			<span class="glyphicon glyphicon-list-alt h2_span"></span>
			방명록 작성 결과
		</h2>
		<div class="well proc_well" align="center">
			<%
				if (flag) {
					out.print("방명록 등록 성공");
				} else {
					out.print("방명록 등록 실패");
				}
			%>
		</div>
		<div class='bottom' align="center">
			<input type="button" class="btn btn-default" value="새 글 작성" onclick="location.href='./createForm.jsp'">
			<input type="button" class="btn btn-default" value="목록 보기" onclick="location.href='./list.jsp'">
		</div>
		<!-- *********************************************** -->
		<jsp:include page="/menu/bottom.jsp" flush="false" />
	</div>
</body>
<!-- *********************************************** -->
</html>