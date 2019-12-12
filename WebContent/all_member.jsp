<%@page import="com.project.tfa.DBUtil" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>32400 - 회원정보 조회</title>
</head>
<body>
			<% 
         	request.setCharacterEncoding("UTF-8");
            %>
            
<header style="border-bottom: 1px solid #4b4a4f; padding-bottom: 20px; padding-top: 20px; color: black; text-align: center; width: 70%; margin-left: 15%;">
    <h1>32400 CINEMA</h1>
    <p class="all_member-mgs" style="color: black;"> <%="모든 회원의 검색결과 입니다." %></p>
</header>

         <%  
	     	
            Connection conn = DBUtil.getMySQLConnection(); 

	     	ArrayList<String> result = new ArrayList<String>();
	     	result = DBUtil.showMember();
	     	int x = result.size();

	     	String[][] t = new String[x][];
	     	for(int i = 0; i < x; i++) {
	     		 t[i] = result.get(i).split(";");
	     	}
		  %>
		   
   <table id="myTable" style="width:70%; margin-left: 15%; padding-top: 0; text-align: center ; color: black; border: 0 none; border-bottom: 1px solid #4b4a4f; ">
    <thead>
      <tr bgcolor=efefef>
        <td width="70px">회원번호</td>
        <td width="50px">이름</td>
        <td width="40px">나이</td>
      	<td width="120px">전화번호</td>
      	<td>아이디</td>
      	<td>비밀번호</td>
      	<td width="70px">포인트</td>
      </tr>
    </thead>
    <tbody>
    <%
    for(int i = 0; i<x; i++) {
    	out.print("<tr bgcolor=white>");
    	out.print("<td>"+t[i][0]+"</td>");
    	out.print("<td>"+t[i][1]+"</td>");
    	out.print("<td>"+t[i][2]+"</td>");
    	out.print("<td>"+t[i][3]+"</td>");
    	out.print("<td>"+t[i][4]+"</td>");
    	out.print("<td>"+t[i][5]+"</td>");
    	out.print("<td>"+t[i][6]+"</td>");
    	out.print("</tr>");
    }
      %>
      
    </tbody>
  </table><br>



</body>
</html>