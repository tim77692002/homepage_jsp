<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>createForm</title>
<script type="text/javascript">
	function inputCheck(f) {
		if (f.title.value == "") {
			alert("제목을 입력하세요.");
			f.title.focus();
			return false;
		}

		if (f.wname.value == "") {
			alert("이름을 입력하세요.");
			f.wname.focus();
			return false;
		}

		if (f.content.value == "") {
			alert("내용을 입력하세요.");
			f.content.focus();
			return false;
		}

		if (f.passwd.value == "") {
			alert("Password를 입력하세요.");
			f.passwd.focus();
			return false;
		}

		if (f.repasswd.value == "") {
			alert("Password 확인을 입력하세요.");
			f.repasswd.focus();
			return false;
		}

		if (f.passwd.value != f.repasswd.value) {
			alert("비밀번호가 일치하지 않습니다.");
			f.passwd.focus();
			return false;
		}

		if (f.fname.value == "") {
			alert("사진을 등록하세요.");
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
			<span class="glyphicon glyphicon-list-alt h2_span" ></span>
			새글 작성
		</h2>

		<FORM name='frm' method='POST' action='./createProc.jsp' onsubmit="return inputCheck(this)" enctype="multipart/form-data">
			<TABLE class="table table-hover">
				<TR>
					<TH>제목</TH>
					<TD>
						<input type="text" name="title" size="20" placeholder="제목을 적어주세요.">
					</TD>
				</TR>

				<TR>
					<TH>이름</TH>
					<TD>
						<input type="text" name="wname" size="20" placeholder="이름을 적어주세요.">
					</TD>
				</TR>
				<TR>
					<TH>내용</TH>
					<TD>
						<textarea rows="5" cols="40" placeholder="내용을 입력하세요." name="content"></textarea>
					</TD>
				</TR>
				<TR>
					<TH>Password</TH>
					<TD>
						<input type="password" name="passwd" size="20" placeholder="Password를 입력하세요.">
					</TD>
				</TR>
				<TR>
					<TH>Password 확인</TH>
					<TD>
						<input type="password" name="repasswd" size="20" placeholder="Password를 입력하세요.">
					</TD>
				</TR>
				<TR>
					<TH>사진</TH>
					<TD>
						<input type="file" name="fname" accept=".jpg,.png,.gif">
					</TD>
				</TR>
			</TABLE>
			<DIV class="bottom" align="center">
				<input type='submit' class="btn btn-default" value='등록'>
				<input type='reset' class="btn btn-default" value='취소' onclick="mlist()">
			</DIV>
		</FORM>
		<!-- *********************************************** -->
		<jsp:include page="/menu/bottom.jsp" flush="false" />
	</div>
</body>
<!-- *********************************************** -->
</html>