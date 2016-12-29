<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<%
	String id = request.getParameter("id");
	boolean flag = mdao.duplicateId(id);
%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>id_proc</title>
<script type="text/javascript">
	function use() {
		opener.frm.id.value='<%=id%>';
		window.close();
	}
</script>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body class="board_body">
	<!-- *********************************************** -->

	<h2>
		<span class="glyphicon glyphicon-user h2_span"></span>
		ID 중복 확인 결과
	</h2>

	<div class="well proc_well" align="center">
		입력한 ID :
		<%=id%><br>
		<br>
		<%
			if (flag) {
				out.print("이 ID는 이미 사용중 입니다!!!<br>");
			} else {
				out.print("이거 쓰세요!!!<br><br>");
				out.print("<input type='button' class='btn btn-default' value='사용' onclick='use()' >");
			}
		%>
	</DIV>

	<DIV class='bottom' align="center">
		<input type='button' value='재 시도' class='btn btn-default' onclick="location.href='id_form.jsp'">
		<input type='button' value='닫기' class='btn btn-default' onclick="window.close()">
	</DIV>

	<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html>
