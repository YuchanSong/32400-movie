<%@page import="com.project.tfa.DBUtil" %>
<%@ page import="java.sql.*,db.*,java.util.ArrayList,java.util.Date,java.util.*,java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title> 32400 CINEMA</title>
</head>
<body>
<%
Connection conn = DBUtil.getMySQLConnection(); 
	request.setCharacterEncoding("UTF-8");
	String ano = request.getParameter("ano");
	String scount = request.getParameter("scount");

	int cnt = DBUtil.updateAuditorium(ano, scount);
	
	if(cnt > 0){
		out.print("<script>alert(\"상영관 수정 완료\");</script>");
		out.print("<script>location.href =\"auditorium_manage0.jsp\"</script>");
	}
	else{
		out.print("<script>alert(\"상영관 수정 실패\");</script>");
		out.print("<script>location.href =\"auditorium_manage0.jsp\"</script>");
	}
%>
</body>

</html>
