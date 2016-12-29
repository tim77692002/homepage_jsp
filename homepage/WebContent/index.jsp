<%@page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String root = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body class="board_body">
	<jsp:include page="/menu/top.jsp" flush="false" />
	<div class="container">
		<!-- *********************************************** -->
		<!-- Content -->
		<div class="w3-panel">
			<h1>
				<b id="index_b">Manchester United<br></b>
			</h1>
			<img src="<%=root%>/storage/main.jpg" class="img-rounded" id="index_img" />
		</div>
	</div>

	<!-- Grid -->
	<!-- 		<div class="w3-row w3-container"> -->
	<!-- 			<div class="w3-center w3-padding-64"> -->
	<!-- 				<span class="w3-xlarge w3-bottombar w3-border-dark-grey w3-padding-16">What We Offer</span> -->
	<!-- 			</div> -->
	<!-- 			<div class="w3-col l3 m6 w3-light-grey w3-container w3-padding-12"> -->
	<!-- 				<h3>Design</h3> -->
	<!-- 				<p>Phasellus eget enim eu lectus faucibus vestibulum. Suspendisse sodales pellentesque elementum.</p> -->
	<!-- 			</div> -->

	<!-- 			<div class="w3-col l3 m6 w3-grey w3-container w3-padding-12"> -->
	<!-- 				<h3>Branding</h3> -->
	<!-- 				<p>Phasellus eget enim eu lectus faucibus vestibulum. Suspendisse sodales pellentesque elementum.</p> -->
	<!-- 			</div> -->

	<!-- 			<div class="w3-col l3 m6 w3-dark-grey w3-container w3-padding-12"> -->
	<!-- 				<h3>Consultation</h3> -->
	<!-- 				<p>Phasellus eget enim eu lectus faucibus vestibulum. Suspendisse sodales pellentesque elementum.</p> -->
	<!-- 			</div> -->

	<!-- 			<div class="w3-col l3 m6 w3-black w3-container w3-padding-12"> -->
	<!-- 				<h3>Promises</h3> -->
	<!-- 				<p>Phasellus eget enim eu lectus faucibus vestibulum. Suspendisse sodales pellentesque elementum.</p> -->
	<!-- 			</div> -->
	<!-- 		</div> -->
	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
	</div>
</body>
<!-- *********************************************** -->
</html>