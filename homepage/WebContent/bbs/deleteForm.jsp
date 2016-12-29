<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	boolean flag = bdao.checkRefno(bbsno);
%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>deleteForm</title>
<script type="text/javascript">
	function incheck(f) {
		if (f.passwd.value == "") {
			alert("패스워드를 입력하세요");
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
			게시판 글 삭제
		</h2>

		<div class="content">
			<%
				if (flag) {
					out.println("답변이 있는 글이므로 삭제 불가능<br><br>");
					out.print("<input type='button' value='다시시도' onclick='history.go(-2)'>");
				} else {
			%>
			<FORM name='frm' method='POST' action='./deleteProc.jsp' onsubmit="return incheck(this)">
				<input name="col" value="<%=request.getParameter("col")%>" type="hidden">
				<input name="word" value="<%=request.getParameter("word")%>" type="hidden">
				<input name="nowPage" value="<%=request.getParameter("nowPage")%>" type="hidden">
				<input name="oldfile" value="<%=request.getParameter("oldfile")%>" type="hidden">
				<input type="hidden" name="bbsno" value="<%=bbsno%>">
				<div class="well" align="center" id="bbs_well">삭제하면 복구할 수 없습니다</div>
				<TABLE class="table table-hover">
					<TR>
						<TH>패스워드</TH>
						<TD>
							<input type="password" name="passwd">
						</TD>
					</TR>
				</TABLE>

				<DIV class='bottom' align="center">
					<input type='submit' class="btn btn-default" value='삭제'>
					<input type='button' class="btn btn-default" value='취소' onclick="history.back()">
				</DIV>
			</FORM>
			<%
				}
			%>
		</div>

		<!-- *********************************************** -->
		<jsp:include page="/menu/bottom.jsp" flush="false" />
	</div>
</body>
<!-- *********************************************** -->
</html>
