<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<%
	//검색============================================
	String col = Utility.checkNull(request.getParameter("col"));
	String word = Utility.checkNull(request.getParameter("word"));

	if (col.equals("total")) {
		word = "";
	}
	//paging 관련=======================================
	int nowPage = 1;//현재 보고 있는 페이지
	if (request.getParameter("nowPage") != null) {
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	int recordPerPage = 5;//한 페이지 보여줄 갯수

	//DB에서 가져올 순번=====================================
	int sno = ((nowPage - 1) * recordPerPage) + 1;
	int eno = nowPage * recordPerPage;

	Map map = new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno", sno);
	map.put("eno", eno);

	int total = idao.total(col, word);
	List<ImgDto> list = idao.list(map);
	Iterator<ImgDto> iter = list.iterator();
%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>list</title>
<script type="text/javascript">
function read(no){
	var url= "read.jsp";
	url+= "?no="+no;
	url+= "&col=<%=col%>";
	url+= "&word=<%=word%>";
	url+= "&nowPage=<%=nowPage%>";
		location.href = url;
	}
function down(filename){
	var url = "<%=root%>/download?dir=/img/storage&filename=" + filename;
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
			사진게시판
		</h2>
		<div class="search" align="center">
			<FORM method='POST' action='./list.jsp'>
				<select name="col">
					<!-- 검색할 컬럼 -->
					<option value="title" <%if (col.equals("title"))
				out.print("selected='selected'");%>>제목</option>
					<option value="wname" <%if (col.equals("wname"))
				out.print("selected='selected'");%>>성명</option>
					<option value="content" <%if (col.equals("cotent"))
				out.print("selected='selected'");%>>내용</option>
					<option value="total">전체</option>
				</select>

				<input type="text" name="word" value="<%=word%>">
				<input type='submit' class="btn btn-default" value='Search'>
				<input type='button' class="btn btn-default" value='새글 작성' onclick="location.href='./createForm.jsp'">

			</FORM>
		</div>
		<TABLE class="table table-hover">
			<TR>
				<TH>번호</TH>
				<TH>사진</TH>
				<TH>제목</TH>
				<TH>성명</TH>
				<TH>조회수</TH>
				<TH>등록일</TH>
				<TH>파일명</TH>
			</TR>
			<%
				if (list.size() == 0) {
			%>
			<tr>
				<td colspan="7">등록된 글이 없습니다</td>
			</tr>
			<%
				} else {
					while (iter.hasNext()) {
						ImgDto dto = iter.next();
			%>
			<tr>
				<Td><%=dto.getNo()%></Td>
				<td>
					<a href="javascript:read('<%=dto.getNo()%>')"> <img id="imgboard_list_img" class="img-rounded" src="./storage/<%=dto.getFname()%>">
					</a>
				</td>
				<Td>
					<%
						for (int i = 0; i < dto.getIndent(); i++) {
									out.print("&nbsp;&nbsp;");
								}
								if (dto.getIndent() > 0) {
									out.print("┗");
								}
					%>
					<a href="javascript:read('<%=dto.getNo()%>')"><%=dto.getTitle()%> </a>
					<%
						if (Utility.compareDay(dto.getWdate().substring(0, 10))) {
					%>
					<span class="label label-danger">New</span>
					<%
						}
					%>
				</Td>
				<Td><%=dto.getWname()%></Td>
				<Td><%=dto.getViewcnt()%></Td>
				<Td><%=dto.getWdate().substring(5, 16)%></Td>
				<Td>
					<%
						if (dto.getFname() == null) {
									out.print("<span class='glyphicon glyphicon-remove-sign'></span>");
								} else {
					%>
					<a href="javascript:down('<%=dto.getFname()%>')"><span class='glyphicon glyphicon-floppy-save'></span></a>
					<%
						}
					%>
				</Td>
			</tr>
			<%
				} //while 
				} //if
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
