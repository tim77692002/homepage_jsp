<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="bbs.*"%>
<%@ page import="utility.*"%>
<%@ page import="player.*"%>
<%@ page import="member.*"%>
<%@ page import="guestbook.*"%>
<%@ page import="img.*"%>
<%@ page import="org.apache.commons.fileupload.*"%>

<jsp:useBean id="bdao" class="bbs.BbsDao" />
<jsp:useBean id="pdao" class="player.PlayerDao" />
<jsp:useBean id="gdao" class="guestbook.GuestbookDao" />
<jsp:useBean id="mdao" class="member.MemberDao" />
<jsp:useBean id="idao" class="img.ImgDao" />
<%
	request.setCharacterEncoding("utf-8");
	String root = request.getContextPath();
%>