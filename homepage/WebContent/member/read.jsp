<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>

<%
	String id = request.getParameter("id");
	String grade = (String) session.getAttribute("grade");
	if (id == null) {
		id = (String) session.getAttribute("id");
	}
	MemberDto dto = mdao.read(id);
%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>read</title>
<script type="text/javascript">
function mlist() {
	var url = "<%=root%>/admin/list.jsp";
	url += "?col=<%=request.getParameter("col")%>";
	url += "&word=<%=request.getParameter("word")%>";
	url += "&nowPage=<%=request.getParameter("nowPage")%>";
	location.href = url;
}
function update() {
	var url = "updateForm.jsp";
	url += "?id=<%=id%>";
	url += "&col=<%=request.getParameter("col")%>";
	url += "&word=<%=request.getParameter("word")%>";
	url += "&nowPage=<%=request.getParameter("nowPage")%>";
	location.href = url;
}
function updateFile() {
	var url = "updateFileForm.jsp";
	url += "?id=<%=id%>";
	url += "&oldfile=<%=dto.getFname()%>";
	location.href = url;
	}
function updatePw() {
	var url = "updatePwForm.jsp";
	url += "?id=<%=id%>";
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
			<%=dto.getMname()%>	의 회원정보
		</h2>
		<table class="table table-hover">
			<tr>
				<td colspan="2" align="center">
					<img src="./storage/<%=dto.getFname()%>" class="img-rounded" id="member_read_img">
				</td>
			</tr>
			<TR>
				<TH>ID</TH>
				<TD><%=dto.getId()%></TD>
			</TR>
			<TR>
				<TH>성명</TH>
				<TD><%=dto.getMname()%></TD>
			</TR>
			<TR>
				<TH>전화번호</TH>
				<TD><%=dto.getTel()%></TD>
			</TR>
			<TR>
				<TH>E-Mail</TH>
				<TD><%=dto.getEmail()%></TD>
			</TR>
			<TR>
				<TH>주소</TH>
				<TD><%=dto.getAddress1()%>
					<br>
					<%=Utility.checkNull(dto.getAddress2())%>
					<br>
					(<%=dto.getZipcode()%>)
				</TD>
			</TR>
			<TR>
				<TH>직업</TH>
				<TD><%=Utility.getCodeValue(dto.getJob())%></TD>
			</TR>
			<TR>
				<TH>가입일</TH>
				<TD><%=dto.getMdate()%></TD>
			</TR>

		</TABLE>

		<DIV class='bottom' align="center">
			<input type='button' class="btn btn-default" value='사진 다운로드' onclick="location.href='<%=root%>/download?dir=/member/storage&filename=<%=dto.getFname()%>'">
			<%
				if (id != null && grade.equals("A")) { //관리자일때
			%>
			<input type='button' class="btn btn-default" value='회원 목록' onclick="mlist()">
			<%
				} else {
			%>
			<input type='button' class="btn btn-default" value='정보 수정' onclick="update()">
			<input type='button' class="btn btn-default" value='프로필 사진 변경' onclick="updateFile()">
			<input type='button' class="btn btn-default" value='패스워드 변경' onclick="updatePw()">
			<input type='button' class="btn btn-default" value='탈퇴하기' onclick="location.href='<%=root%>/member/deleteForm.jsp'">
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
