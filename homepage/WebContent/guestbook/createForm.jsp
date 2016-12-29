<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 작성</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
	function input(frm) {
		if (frm.title.value == "") {
			alert("제목이 비었음");
			frm.title.focus();
			return false;
		}

		if (frm.content.value == "") {
			alert("내용이 비었음");
			frm.content.focus();
			return false;
		}
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
			방명록 작성
		</h2>
		<DIV class="content">
			<form name="frm" method="post" action="./createProc.jsp" onsubmit="return input(this)">
				<table class="table table-hover">
					<tr>
						<th>제목</th>
						<td>
							<input type="text" name="title" size="30" placeholder="제목" />
						</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>
							<input type="text" name="wname" size="30" placeholder="작성자" />
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							<textarea rows="10" cols="30" name="content" placeholder="내용"></textarea>
						</td>
					</tr>
				</table>
				<div class='bottom' align="center">
					<input type='submit' class="btn btn-default" value='작성'>
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