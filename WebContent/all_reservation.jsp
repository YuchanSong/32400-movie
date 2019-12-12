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
            
<header style="border-bottom: 1px solid #4b4a4f; padding-bottom: 20px; padding-top: 20px; color: black; text-align: center; width: 50%; margin-left: 25%;">
    <h1>32400 CINEMA</h1>
    <p class="all_reservation-mgs" style="color: black;"> <%="모든 회원의 예매정보 입니다." %></p>
</header>

         <%  
         	request.setCharacterEncoding("UTF-8");
            Connection conn = DBUtil.getMySQLConnection(); 

	     	ArrayList<String> result = new ArrayList<String>();
	     	result = DBUtil.showReservationList();
	     	int x = result.size();

	     	String[][] t = new String[x][];
	     	for(int i = 0; i < x; i++) {
	     		 t[i] = result.get(i).split(";");
	     	}
		  %>
		   
   <table id="myTable" style="width:50%; margin-left: 25%; padding-top: 0; text-align: center ; color: black; border: 0 none; border-bottom: 1px solid #4b4a4f; ">
    <thead>
      <tr bgcolor=efefef>
      	<td>고유번호</td>
      	<td>회원번호</td>
        <td>영화제목</td>
        <td>상영관</td>
        <td>상영시간</td>
        <td>행</td>
        <td>열</td>
        <td>결제방법</td>
        <td>결제시간</td>
        <td>결제금액</td>
      </tr>
    </thead>
    <tbody>
    <%
    for(int i = 0; i<x; i++){
    	out.print("<tr bgcolor=white>");
    	out.print("<td>"+t[i][0]+"</td>");
    	out.print("<td>"+t[i][1]+"</td>");
    	out.print("<td>"+t[i][2]+"</td>");
    	out.print("<td>"+t[i][3]+"관"+"</td>");
    	out.print("<td>"+t[i][4]+"</td>");
    	out.print("<td>"+t[i][5]+"</td>");
    	out.print("<td>"+t[i][6]+"</td>");
    	out.print("<td>"+t[i][7]+"</td>");
    	out.print("<td>"+t[i][8]+"</td>");
    	out.print("<td>11000원</td>");
    	out.print("</tr>");
    }
      %>
      
    </tbody>
  </table><br>



</body>
</html>