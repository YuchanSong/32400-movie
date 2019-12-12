<%@page import="com.project.tfa.DBUtil" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%><!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>32400 - 데이터 통계</title>
</head>
<body>
			<% 
         	request.setCharacterEncoding("UTF-8");
            %>
            
<header style="border-bottom: 1px solid #4b4a4f; padding-bottom: 20px; padding-top: 20px; color: black; text-align: center; width: 70%; margin-left: 15%;">
    <h1>32400 CINEMA</h1>
    <p class="all_member-mgs" style="color: black;"> <%="영화별 예매 데이터 통계입니다." %></p>
</header>

	<%

    Connection conn = DBUtil.getMySQLConnection(); 

 	ArrayList<String> result = new ArrayList<String>();
 	result = DBUtil.data_statistics_movie();
 	int x = result.size();

 	String[][] t = new String[x][];
 	for(int i = 0; i < x; i++) {
 		 t[i] = result.get(i).split(";");
 	}
	%>
	
	<table id="myTable" style="width:70%; margin-left: 15%; padding-top: 0; text-align: center ; color: black; border: 0 none; border-bottom: 1px solid #4b4a4f; ">
    <thead>
      <tr bgcolor=efefef>
        <%
        for(int i = 0; i<x; i++) {
        	out.print("<td>"+t[i][1]+"</td>");
        }
        %>
      </tr>
    </thead>
    <tbody>
    <%
    for(int i = 0; i<x; i++) {
    	out.print("<td>" + t[i][2] + "회</td>");
    }
      %>
      
    </tbody>
  </table><br>
	

</body>
</html>