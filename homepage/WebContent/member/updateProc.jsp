<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dto" class="member.MemberDto" />
<jsp:setProperty name="dto" property="*" />

<%
	boolean flag = mdao.update(dto);
	String id = (String) session.getAttribute("id");
	String grade = (String) session.getAttribute("grade");
%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>updateProc</title>
<script type="text/javascript">
function mlist() {
	var url = "<%=root%>/admin/list.jsp";
	
	location.href = url;
}

function read() {
	var url = "read.jsp";
	url += "?id=<%=dto.getId()%>";
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
			<span class="glyphicon glyphicon-user h2_span"></span>
			회원정보 수정 결과
		</h2>

	<div class="well proc_well" align="center">
		<%
			if (flag) {
				out.print("정보수정 성공!!!");
			} else {
				out.print("정보수정 실패!!!");
			}
		%>

	</DIV>

	<DIV class='bottom' align="center">
		<%
			if (flag) {
		%>
		<input type='button' class="btn btn-default" value='정보확인' onclick="read()">
		<%
			} else {
		%>
		<input type='button' class="btn btn-default" value='재시도' onclick="history.back()">
		<%
			}
		%>
	</DIV>

	<!-- *********************************************** -->
		<jsp:include page="/menu/bottom.jsp" flush="false" />
	</div>
</body>
<!-- *********************************************** -->
</html>
