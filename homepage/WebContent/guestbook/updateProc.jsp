<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dto" class="guestbook.GuestbookDto" />
<jsp:setProperty property="*" name="dto" />
<%
	boolean flag = gdao.update(dto);
%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>방명록 수정 결과</title>
<script type="text/javascript">
	function mlist() {
		var url = "list.jsp";
		url += "?col=<%=request.getParameter("col")%>";
		url += "&word=<%=request.getParameter("word")%>";
		url += "&nowPage=<%=request.getParameter("nowPage")%>";
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
			방명록 수정 결과
		</h2>
		<div class="well proc_well" align="center">
			<%
				if (flag) {
					out.print("방명록 수정 성공");
				} else {
					out.print("방명록 수정 실패");
				}
			%>
		</div>
		<div class='bottom' align="center">
			<input type="button" value="목록 보기" class="btn btn-default" onclick="mlist()">
		</div>
		<!-- *********************************************** -->
		<jsp:include page="/menu/bottom.jsp" flush="false" />
	</div>
</body>
<!-- *********************************************** -->
</html>