<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<%
	int no = Integer.parseInt(request.getParameter("no"));

	String col = request.getParameter("col");
	String word = request.getParameter("word");
	String nowPage = request.getParameter("nowPage");

	String passwd = request.getParameter("passwd");
	boolean flag = idao.checkRefno(no);
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
			글 삭제
		</h2>
		<%
			if (flag) {
		%>
		<div class="well proc_well" align="center">
			답변있는 글이므로 삭제 할 수 없습니다.
			<br>
		</div>
		<DIV class='bottom' align="center">
			<input type='button' class="btn btn-default" value='다시시도' onclick='history.go(-2)'>
		</div>
		<%
			} else {
		%>
		<form method="post" action="deleteProc.jsp" onsubmit="return incheck(this)">
			<input type="hidden" name="no" value="<%=no%>">
			<input type="hidden" name="col" value="<%=col%>">
			<input type="hidden" name="word" value="<%=word%>">
			<input type="hidden" name="nowPage" value="<%=nowPage%>">
			<input type="hidden" name="oldfile" value="<%=request.getParameter("oldfile")%>">

			<div class="well proc_well" align="center">
				삭제를 하면 복구 될 수 없습니다.
				<br>
				삭제하시려면 비밀번호를 입력하시고 '삭제'을 눌러주세요
				<br>
				취소는 '목록 보기' 버튼을 누르세요.
				<br>
			</div>
			<TABLE class="table table-hover">
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="password" name="passwd">
					</td>
				</tr>
			</table>

			<DIV class='bottom' align="center">
				<input type="submit" class="btn btn-default" value="삭제">
				<input type="button" class="btn btn-default" value="목록 보기" onclick="location.href='./list.jsp'">
			</DIV>
		</form>
		<%
			}
		%>
		<!-- *********************************************** -->
		<jsp:include page="/menu/bottom.jsp" flush="false" />
	</div>
</body>
<!-- *********************************************** -->
</html>
