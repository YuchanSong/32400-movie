<%@page import="com.project.tfa.DBUtil" %>
<%@ page pageEncoding="utf-8" language="java" contentType="text/html; charset=utf-8" import="java.sql.*,db.*,java.util.ArrayList,java.util.Date,java.util.*,java.text.SimpleDateFormat" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title> 32400 CINEMA</title>
</head>
<body>
<% 
Connection conn = DBUtil.getMySQLConnection(); 
	String scount = request.getParameter("scount");
	
	System.out.println(scount);
	
	int cnt = DBUtil.insertAuditorium(scount);
	if(cnt > 0){
		out.print("<script>alert(\"상영관 등록 완료\");</script>");
		out.print("<script>location.href =\"auditorium_manage0.jsp\"</script>");
	}
	else{
		out.print("<script>alert(\"상영관 등록 실패\");</script>");
		out.print("<script>location.href =\"auditorium_manage0.jsp\"</script>");
	}

%>
</body>

</html>
