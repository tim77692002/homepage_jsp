<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<%
	String id = request.getParameter("id");
	String oldfile = request.getParameter("oldfile");
%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>updateFileForm</title>
<script type="text/javascript">
	function inCheck(f) {
		if (f.fname.value == "") {
			alert("사진을 선택하세요.");
			f.fname.focus();
			return false;
		}
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
			프로필 사진 변경
		</h2>

		<FORM name='frm' method='POST' action='./updateFileProc.jsp' enctype="multipart/form-data" onsubmit="return inCheck(this)">
			<input type="hidden" name="id" value="<%=id%>">
			<input type="hidden" name="oldfile" value="<%=oldfile%>">
			<table class="table table-hover">
				<TR>
					<TH>원본 파일</TH>
					<TD>
						<img src="./storage/<%=oldfile%>" class="img-rounded" id="member_updatefile_img">
						<br>
						원본파일명 :
						<%=oldfile%>
					</TD>
				</TR>
				<TR>
					<TH>변경 파일</TH>
					<TD>
						<input type="file" name="fname" accept=".png,.gif,.jpg">
					</TD>
				</TR>
			</TABLE>

			<DIV class='bottom' align="center">
				<input type='submit' class="btn btn-default" value='변경'>
				<input type='button' class="btn btn-default" value='취소' onclick="history.back()">
			</DIV>
		</FORM>

		<!-- *********************************************** -->
		<jsp:include page="/menu/bottom.jsp" flush="false" />
	</div>
</body>
<!-- *********************************************** -->
</html>
