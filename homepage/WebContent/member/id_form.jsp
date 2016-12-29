<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>id_form</title>
<link href='../css/style.css' rel='Stylesheet' type='text/css'>
</head>
<body class="board_body">
	<div class="container">
		<h2>
			<span class="glyphicon glyphicon-user h2_span"></span>
			ID 중복 확인
		</h2>
		<div class="well proc_well" align="center">
			ID 입력 ㄱㄱㄱ
			<br>
		</div>
		<FORM name='frm' method='post' action='./id_proc.jsp'>
			<table class="table table-hover">
				<TR>
					<TH>ID</TH>
					<TD>
						<input type='text' name='id' size='20'>
					</TD>
				</TR>
			</TABLE>
			<DIV class="bottom" align="center">
				<input type='submit' class="btn btn-default" value='중복확인'>
				<input type="button" class="btn btn-default" value="취소" onclick="window.close()" />
			</DIV>
		</FORM>
	</DIV>
</body>
</html>
