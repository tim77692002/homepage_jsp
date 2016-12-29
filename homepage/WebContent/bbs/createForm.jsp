<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String root = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>createForm</title>
<script type="text/javascript">
	function incheck(f) {
		if (f.title.value == "") {
			alert("제목이 없음");
			f.title.focus();
			return false;
		}
		if (f.wname.value == "") {
			alert("이름이 없음");
			f.wname.focus();
			return false;
		}
		if (f.content.value == "") {
			alert("내용이 없음");
			f.content.focus();
			return false;
		}
		if (f.passwd.value == "") {
			alert("암호가 없음");
			f.passwd.focus();
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
			<span class="glyphicon glyphicon-list-alt h2_span"></span>
			게시판 글 작성
		</h2>
		<DIV class="content">

			<FORM name='frm' method='POST' action='./createProc.jsp' enctype="multipart/form-data">
				<table class="table table-hover">
					<TR>
						<TH>제목</TH>
						<TD>
							<input type="text" name="title" placeholder="제목을 쓰세요.">
						</TD>
					</TR>
					<TR>
						<TH>성명</TH>
						<TD>
							<input type="text" name="wname" placeholder="이름을 쓰세요.">
						</TD>
					</TR>
					<TR>
						<TH>내용</TH>
						<TD>
							<textarea rows="10" cols="45" name="content" placeholder="내용을 쓰세요."></textarea>
						</TD>
					</TR>
					<TR>
						<TH>비밀번호</TH>
						<TD>
							<input type="password" name="passwd" placeholder="비밀번호을 입력하세요.">
						</TD>
					</TR>
					<TR>
						<TH>첨부파일</TH>
						<TD>
							<input type="file"  name="filename">
						</TD>
					</TR>
				</TABLE>

				<DIV class='bottom' align="center">
					<input type='submit' class="btn btn-default" value='작성'>
					<input type='button' class="btn btn-default" value='취소' onclick="history.back()">
				</DIV>
			</FORM>
		</DIV>
		<!-- *********************************************** -->
		<jsp:include page="/menu/bottom.jsp" flush="false" />
	</div>
</body>
<!-- *********************************************** -->
</html>
