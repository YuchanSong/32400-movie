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
	String mnum = request.getParameter("mnum");
	String ano = request.getParameter("ano");
	String od = request.getParameter("od");
	String ot = request.getParameter("ot");
	System.out.println(mnum);
	System.out.println(ano);
	System.out.println(od);
	System.out.println(ot);
	
	int cnt = DBUtil.insertTimetable(mnum, ano, od, ot);
	
	if(cnt > 0){
		out.print("<script>alert(\"배정 등록 완료\");</script>");
		out.print("<script>location.href =\"timetable_manage0.jsp\"</script>");
	}
	else{
		out.print("<script>alert(\"배정 등록 실패\");</script>");
		out.print("<script>location.href =\"timetable_manage0.jsp\"</script>");
	}

%>
</body>

</html>
