<%@page import="com.project.tfa.DBUtil" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>32400 CINEMA - register</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String mname = request.getParameter("mname");
	int age = Integer.parseInt(request.getParameter("age").trim());
	String tel = request.getParameter("tel");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	Connection conn = DBUtil.getMySQLConnection(); //DB연결
	
	String sql = "insert into member(mname, age, tel, id, pw) values(?, ?, ?, ?, password(?));";
	PreparedStatement psmt = conn.prepareStatement(sql);
	psmt.setString(1, mname);
	psmt.setInt(2, age);
	psmt.setString(3, tel);
	psmt.setString(4, id);
	psmt.setString(5, pw);
	psmt.executeUpdate();
	
	DBUtil.close(psmt);
	DBUtil.close(conn);
	
	out.println("<script>");
	out.println("alert('회원가입에 성공했습니다. 환영합니다!')");
	out.println("location.href='login.jsp'"); // index로 이동
	out.println("</script>");
%>

</body>
</html>