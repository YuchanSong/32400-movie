<%@page import="com.project.tfa.DBUtil" %>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
Connection conn = DBUtil.getMySQLConnection(); 
	String ano = request.getParameter("ano");
	DBUtil.deleteAuditorium(ano);	
	out.print("<script>alert(\"�󿵰��� ���� �Ǿ����ϴ�.\");</script>");
	out.print("<script>location.href =\"auditorium_manage4.jsp\"</script>");
%>
</body>
</html>