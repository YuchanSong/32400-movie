<%@page import="db.reservation_DB" %>
<%@ page pageEncoding="utf-8" language="java" contentType="text/html;charset=euc-kr" import="java.sql.*,db.*,java.util.ArrayList,java.util.Date,java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	int cnt=0;
	int mno = ((Integer)(session.getAttribute("mno"))).intValue();
	String rno = request.getParameter("rno");
	cnt = reservation_DB.deleteReservation(rno);
	//reservation_DB.pointUpdate3(mno);
	
	if (cnt > 0) {
		out.print("<script>alert(\"예매가 취소되었습니다.\");</script>");
		out.print("<script>location.href =\"reservation_list.jsp\"</script>");
	} else {
		out.print("<script>alert(\"예매가 취소 오류.\");</script>");
		out.print("<script>location.href =\"reservation_list.jsp\"</script>");
	}
%>
</body>
</html>