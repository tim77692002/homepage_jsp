<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>

<%
	//페이지 관련
	int nowPage = 1; //현재페이지(변경가능)
	if (request.getParameter("nowPage") != null) {
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	int recordPerPage = 5; //한 페이지당 보여줄 레코드 갯수

	//디비에서 읽어올 시작순번과 끝순번 생성
	int sno = ((nowPage - 1) * recordPerPage) + 1;
	int eno = nowPage * recordPerPage;

	//검색관련
	String col = Utility.checkNull(request.getParameter("col"));
	String word = Utility.checkNull(request.getParameter("word"));

	if (col.equals("total")) {
		word = "";
	}

	Map map = new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno", sno);
	map.put("eno", eno);

	List<GuestbookDto> list = gdao.list(map);

	int total = gdao.total(col, word);
%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록</title>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
	function read(no) {
		var url = "read.jsp";
		url += "?no=" + no;
		url += "&col=<%=col%>";
		url += "&word=<%=word%>";
		url += "&nowPage=<%=nowPage%>";
		location.href = url;
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
			방명록
		</h2>
		<div class="search" align="center">
			<form method="post" action="./list.jsp">
				<select name="col">
					<!-- 검색할 컬럼 -->

					<option value="title" <%if (col.equals("title"))
				out.print("selected='selected'");%>>제목</option>

					<option value="content" <%if (col.equals("content"))
				out.print("selected='selected'");%>>내용</option>
				
					<option value="wname" <%if (col.equals("wname"))
				out.print("selected='selected'");%>>작성자</option>

					<option value="total">전체</option>

				</select>
				<input type="text" name="word" value="<%=word%>">
				<!-- 검색어 -->
				<input type="submit" class="btn btn-default" value="Search">
				<input type='button' class="btn btn-default" value='새글 작성' onclick="location.href='./createForm.jsp'">
			</form>
		</div>

		<table class="table table-hover">
			<TR align="center">
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>날짜</th>
				<th>조회수</th>
			</tr>
			<%
				if (list.size() == 0) {
			%>
			<tr>
				<td colspan="4">등록된 메모가 없습니다.</td>
			</tr>
			<%
				} else {
					for (int i = 0; i < list.size(); i++) {
						GuestbookDto dto = list.get(i);
			%>
			<tr>
				<td><%=dto.getNo()%></td>
				<td>
					<a href="javascript:read('<%=dto.getNo()%>')"> <%=dto.getTitle()%>
					</a>
					<%
						if (Utility.compareDay(dto.getWdate().substring(0, 10))) {
					%>

					<span class="label label-danger">New</span>

					<%
						}
					%>
				</td>
				<td><%=dto.getWname()%></td>
				<td><%=dto.getWdate()%></td>
				<td><%=dto.getViewcnt()%></td>
			</tr>
			<%
				} // for-end
				} // if-end
			%>
		</table>
		<DIV class='bottom'>
			<%=Utility.paging3(total, nowPage, recordPerPage, col, word)%>
		</div>

		<!-- *********************************************** -->
		<jsp:include page="/menu/bottom.jsp" flush="false" />
	</div>
</body>
<!-- *********************************************** -->
</html>