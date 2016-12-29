<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<%
	//검색관련
	String col = Utility.checkNull(request.getParameter("col"));
	String word = Utility.checkNull(request.getParameter("word"));
	if (col.equals("total")) {
		word = "";
	}
	//페이징관련
	int nowPage = 1;
	int recordPerPage = 5; //한페이지에 보여줄 레코드 갯수 설정
	if (request.getParameter("nowPage") != null) { //getParameter는 뭐든지 문자열로 받아온다.
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}

	//DB에서 가져올 순번
	int sno = ((nowPage - 1) * recordPerPage) + 1;
	int eno = nowPage * recordPerPage;

	Map map = new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno", sno);
	map.put("eno", eno);

	int total = mdao.total(col, word);
	List<MemberDto> list = mdao.list(map);
	Iterator<MemberDto> iter = list.iterator();

	String paging = Utility.paging3(total, nowPage, recordPerPage, col, word);
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>list</title>
<script type="text/javascript">
function read(id){
	var url = "<%=root%>/member/read.jsp";
	url += "?id="+id;
	url += "&nowPage=<%=nowPage%>";
	url += "&col=<%=col%>";
	url += "&word=<%=word%>";
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
			회원 목록
		</h2>

		<div class="search" align="center">

			<FORM name='frm' method='POST' action='./list.jsp'>
				<select name="col">
					<option value="id" <%if (col.equals("id"))
				out.print("selected='selected'");%>>ID</option>
					<option value="mname" <%if (col.equals("mname"))
				out.print("selected='selected'");%>>성명</option>
					<option value="email" <%if (col.equals("email"))
				out.print("selected='selected'");%>>E-Mail</option>
					<option value="total">전체출력</option>
				</select>
				<input type="text" name="word" value='<%=word%>'>
				<input type="submit" class="btn btn-default" value="검색">
				<input type="button" class="btn btn-default" value="회원가입" onclick="location.href='../member/agreement.jsp'">

			</FORM>
		</div>
		<%
			while (iter.hasNext()) {
				MemberDto dto = iter.next();
		%>
		<table class="table table-hover">
			<TR>
				<TD rowspan="5" id="member_list_img_div" align="center">
					<a href="javascript:read('<%=dto.getId()%>')"> <img src='<%=root%>/member/storage/<%=dto.getFname()%>' class="img-rounded" id="member_list_img">
					</a>
				</TD>
				<th>ID</th>
				<TD>
					<a href="javascript:read('<%=dto.getId()%>')"> <%=dto.getId()%></a>
				</TD>
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
				<TH>E-mail</TH>
				<TD><%=dto.getEmail()%></TD>
			</TR>
			<TR>
				<TH>주소</TH>
				<TD><%=dto.getAddress1()%>
					<br>
					<%=Utility.checkNull(dto.getAddress2())%></TD>
			</TR>
		</TABLE>
		<%
			}
		%>

		<DIV class='bottom'>
			<%=paging%>
		</DIV>
		<!-- *********************************************** -->
		<jsp:include page="/menu/bottom.jsp" flush="false" />
	</div>
</body>
<!-- *********************************************** -->
</html>
