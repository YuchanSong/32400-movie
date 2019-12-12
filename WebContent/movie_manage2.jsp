<%@page import="com.project.tfa.DBUtil" %>
<%@page import="java.sql.*,db.*,java.util.ArrayList,java.util.Date,java.util.*,java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title> 32400 CINEMA</title>
</head>
<body>
<% 
	//movie_DB.loadConnect(); 

	Connection conn = DBUtil.getMySQLConnection(); //DB연결
	request.setCharacterEncoding("utf-8");
	String mn = new String(request.getParameter("mn").getBytes("8859_1"), "UTF-8");	
	String sc = new String(request.getParameter("sc").getBytes("8859_1"), "UTF-8");
	String genre = new String(request.getParameter("genre").getBytes("8859_1"), "UTF-8");
	String limit_age = new String(request.getParameter("limit_age").getBytes("8859_1"), "UTF-8");
	
	DBUtil.insertMovie(mn, sc, genre, limit_age);
	
	out.print("<script>alert(\"영화 등록 완료\");</script>");
	out.print("<script>location.href =\"movie_manage0.jsp\"</script>");

%>
</body>

</html>
