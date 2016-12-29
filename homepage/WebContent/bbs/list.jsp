<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<%
	//검색관련 필요 컬럼----------------------------------------------------------------
	String col = Utility.checkNull(request.getParameter("col"));
	String word = Utility.checkNull(request.getParameter("word"));

	if (col.equals("total")) {
		word = "";
	}

	//페이지 관련-----------------------------------------------------------------------
	int nowPage = 1; //현재 보고있는 페이지
	if (request.getParameter("nowPage") != null) {
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	int recordPerPage = 8; //한페이지당 보여줄 레코드갯수

	//DB에서 가져올 순번----------------------------------------------------------------
	int sno = ((nowPage - 1) * recordPerPage) + 1;
	int eno = nowPage * recordPerPage;

	Map map = new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno", sno);
	map.put("eno", eno);

	int total = bdao.total(col, word);
	List<BbsDto> list = bdao.list(map);
	Iterator<BbsDto> iter = list.iterator();
%>
<!DOCTYPE html>
<html>
<head>
<!-- 다운로드 버튼을 위한 부분 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- 다운로드 버튼을 위한 부분 끝 -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>list</title>

<script type="text/javascript">
	function down(filename){
		var url = "<%=root%>/download?dir=/bbs/storage&filename="+filename;
		location.href = url;
	}

	function read(bbsno) { //bbsno는 자바스크립트변수 col word는 jsp변수
		var url = "read.jsp";
		url += "?bbsno=" + bbsno;
		url += "&col=<%=col%>";
		url += "&word=<%=word%>";
		url += "&nowPage=<%=nowPage%>";
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
			<span class="glyphicon glyphicon-list-alt h2_span"></span>
			게시판
		</h2>
		<div class="search" align="center">
			<form method="post" action="./list.jsp">
				<select name="col">
					<!-- 검색할 컬럼 -->
					<option value="title" <%if (col.equals("title"))
				out.print("selected='selected'");%>>제목</option>

					<option value="wname" <%if (col.equals("wname"))
				out.print("selected='selected'");%>>작성자</option>

					<option value="content" <%if (col.equals("content"))
				out.print("selected='selected'");%>>내용</option>

					<option value="total">전체</option>

				</select>
				<input type="text" name="word" value="<%=word%>">
				<!-- 검색어 -->
				<!-- 				<input type="submit" value="검색"> -->
				<button type="submit" class="btn btn-default">Search</button>
				<input type='button' value='새글 작성' class="btn btn-default" onclick="location.href='./createForm.jsp'">
			</form>
		</div>
		<TABLE class="table table-hover">
			<TR align="center">
				<TH>번호</TH>
				<TH>제목</TH>
				<TH>작성자</TH>
				<TH>조회수</TH>
				<TH>등록일</TH>
				<TH>파일</TH>
			</TR>
			<%
				if (list.size() == 0) {
			%>
			<tr>
				<td colspan="8">등록된 글이 없습니다.</td>
			</tr>
			<%
				} else {
					while (iter.hasNext()) {
						BbsDto dto = iter.next();
			%>
			<tr>
				<td><%=dto.getBbsno()%></td>
				<td>
					<%
						for (int i = 0; i < dto.getIndent(); i++) {
									out.print("&nbsp;&nbsp;");
								}
								if (dto.getIndent() > 0) {
									out.print("┗");
								}
					%>
					<a href="javascript:read('<%=dto.getBbsno()%>')"> <%=dto.getTitle()%>
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
				<td><%=dto.getViewcnt()%></td>
				<td><%=dto.getWdate().substring(5, 16)%></td>
				<td id="bbs_list_file_td">
					<%
						if (dto.getFilename() == null) {
									out.print("<span class='glyphicon glyphicon-remove-sign'></span>");
								} else {
					%>
					<a href="javascript:down('<%=dto.getFilename()%>')"> <span class='glyphicon glyphicon-floppy-save'></span>
					</a>
					<%
						}
					%>

				</td>
			</tr>
			<%
				}
				}
			%>
		</TABLE>

		<DIV class='bottom'>
			<%=Utility.paging3(total, nowPage, recordPerPage, col, word)%>
		</DIV>

		<!-- *********************************************** -->
		<jsp:include page="/menu/bottom.jsp" flush="false" />
	</div>
</body>
<!-- *********************************************** -->
</html>
