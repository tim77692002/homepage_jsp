<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<%
	String id = request.getParameter("id");
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
<title>updateForm</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullAddr = ''; // 최종 주소 변수
						var extraAddr = ''; // 조합형 주소 변수

						// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							fullAddr = data.roadAddress;

						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							fullAddr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
						if (data.userSelectedType === 'R') {
							//법정동명이 있을 경우 추가한다.
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							// 건물명이 있을 경우 추가한다.
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('sample6_address').value = fullAddr;

						// 커서를 상세주소 필드로 이동한다.
						document.getElementById('sample6_address2').focus();
					}
				}).open();
	}
</script>
<script>
	function inputCheck(f) {
		if (f.email.value == "") {
			alert("E-Mail 입력칸 비었다!!! ㅋㅋㅋㅋ");
			f.email.focus();
			return false;
		}
		if (f.job.value == "0") {
			alert("직업없음???ㅋㅋ 없으면 백수라도 선택 ㄱㄱ");
			f.job.focus();
			return false;
		}
	}
	function emailCheck2(i) {
		alert("E-Mail 중복확인 버튼을 누르고, 새창에서 E-Mail을 변경하세요. ");
		i.blur();
	}
	
	function emailCheck(email) {
		if (email == "") {
			alert("E-Mail 입력칸 비었다!!! ㅋㅋㅋㅋ");
			document.frm.email.focus();
		} else {
			var url = "email_proc.jsp";
			url += "?email=" + email;
			
			wr=window.open(url, "E-Mail 중복확인", "width=450, height=500");
			
			wr.moveTo((window.screen.width-450)/2, (window.screen.height-500)/2); //새창 좌표 설정
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
			<span class="glyphicon glyphicon-user h2_span"></span>
			<%=dto.getMname()%>
			의 회원정보 수정
		</h2>

		<FORM name='frm' method='POST' action='./updateProc.jsp' onsubmit="return inputCheck(this)">
			<input type="hidden" name="id" value="<%=id%>">
			<input type="hidden" name="col" value="<%=request.getParameter("col")%>">
			<input type="hidden" name="word" value="<%=request.getParameter("word")%>">
			<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage")%>">
			<table class="table table-hover">
				<TR>
					<TD colspan="2" align="center">
						<img src="./storage/<%=dto.getFname()%>" class="img-rounded" id="member_update_img">
					</TD>
				</TR>
				<TR>
					<TH>ID</TH>
					<TD>
						<%=dto.getId()%>
					</TD>
				</TR>
				<TR>
					<TH>이름</TH>
					<TD>
						<%=dto.getMname()%>
					</TD>
				</TR>
				<TR>
					<TH>*E-Mail</TH>
					<TD>
						<input type="text" name="email" size="25" value="<%=dto.getEmail()%>" onclick="emailCheck2(this)">
						<input type="button" class="btn btn-default" value="중복확인" onclick="emailCheck(document.frm.email.value)">
					</TD>
				</TR>
				<TR>
					<TH>*직업</TH>
					<TD>
						<select name="job">
							<option value="0">현재 직업 선택</option>
							<option value="A01">회사원</option>
							<option value="A02">전산관련직</option>
							<option value="A03">연구전문직</option>
							<option value="A04">학생</option>
							<option value="A05">일반자영업</option>
							<option value="A06">공무원</option>
							<option value="A07">의료인</option>
							<option value="A08">법조인</option>
							<option value="A09">종교/언론인</option>
							<option value="A10">백수</option>
							<option value="A11">기타</option>
						</select>
						<script type="text/javascript">
					document.frm.job.value='<%=dto.getJob()%>'
					</script>
					</TD>
				</TR>
				<TR>
					<TH>전화번호</TH>
					<TD>
						<input type="text" name="tel" size="20" value="<%=dto.getTel()%>">
					</TD>
				</TR>
				<TR>
					<TH>우편번호</TH>
					<TD>
						<input type="text" name="zipcode" size="7" id="sample6_postcode" value="<%=dto.getZipcode()%>">
						<input type="button" value="우편번호찾기" class="btn btn-default" onclick="sample6_execDaumPostcode()">
					</TD>
				</TR>
				<TR>
					<TH>주소</TH>
					<TD>
						<input type="text" name="address1" size="40" id="sample6_address" value="<%=dto.getAddress1()%>">
						<br>
						<input type="text" name="address2" size="40" id="sample6_address2" value="<%=dto.getAddress2()%>">
					</TD>
				</TR>
			</TABLE>

			<DIV class='bottom' align="center">
				<input type='submit' class="btn btn-default" value='수정완료'>
				<input type='reset' class="btn btn-default" value='다시입력'>
			</DIV>
		</FORM>
		<!-- *********************************************** -->
		<jsp:include page="/menu/bottom.jsp" flush="false" />
	</div>
</body>
<!-- *********************************************** -->
</html>