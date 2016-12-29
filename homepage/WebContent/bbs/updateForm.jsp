<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	BbsDto dto = bdao.read(bbsno);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>updateForm</title>
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
			게시판 글 수정
		</h2>

		<FORM name='frm' method='POST' action='./updateProc.jsp' enctype="multipart/form-data">
			<input type="hidden" name="grpno" value="<%=dto.getGrpno()%>">
			<input type="hidden" name="indent" value="<%=dto.getIndent()%>">
			<input type="hidden" name="ansnum" value="<%=dto.getAnsnum()%>">
			<input name="bbsno" value="<%=bbsno%>" type="hidden">
			<input name="col" value="<%=request.getParameter("col")%>" type="hidden">
			<input name="word" value="<%=request.getParameter("word")%>" type="hidden">
			<input name="nowPage" value="<%=request.getParameter("nowPage")%>" type="hidden">
			<input name="oldfile" value="<%=dto.getFilename()%>" type="hidden">
			<TABLE class="table table-hover">
				<TR>
					<TH>제목</TH>
					<TD>
						<input type="text" name="title" value="<%=dto.getTitle()%>">
					</TD>
				</TR>
				<TR>
					<TH>성명</TH>
					<TD>
						<input type="text" name="wname" value="<%=dto.getWname()%>">
					</TD>
				</TR>
				<TR>
					<TH>내용</TH>
					<TD>
						<textarea rows="10" cols="45" name="content"><%=dto.getContent()%></textarea>
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
						<%
							if (dto.getFilename() != null) {
						%>
						<%=Utility.checkNull(dto.getFilename())%><br>
						<%
							}
						%>
						<input type="file" name="filename">
					</TD>
				</TR>
			</TABLE>

			<DIV class='bottom' align="center">
				<input type='submit' class="btn btn-default" value='수정'>
				<input type='button' class="btn btn-default" value='취소' onclick="history.back()">
			</DIV>
		</FORM>

		<!-- *********************************************** -->
		<jsp:include page="/menu/bottom.jsp" flush="false" />
	</div>
</body>
<!-- *********************************************** -->
</html>
