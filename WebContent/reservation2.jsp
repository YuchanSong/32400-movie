<%@page import="db.reservation_DB" %>
<%@ page pageEncoding="utf-8" language="java" contentType="text/html;charset=euc-kr" import="java.sql.*,db.*,java.util.ArrayList,java.util.Date,java.util.*,java.text.SimpleDateFormat" %>
<html>

<head>
  <meta charset="euc-kr">
  <title> 32400 CINEMA - register </title>
  <style type="text/css">
  	body {
      text-align: center;
      color: #ecf0f1;
      background-color: white;
      font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
      margin-top: 20px;
    }
    .button-3d {
      position: relative;
      width: auto;
      display: inline-block;
      color: black;
      text-decoration: none;
      border-radius: 5px;
      border: solid 1px black;
      background: white;
      text-align: center;
      padding: 16px 18px 14px;
      margin: 0 auto;

      -webkit-transition: all 0.1s;
      -moz-transition: all 0.1s;
      transition: all 0.1s;

      -webkit-box-shadow: 0px 6px 0px #D8D8D8;
      -moz-box-shadow: 0px 6px 0px #D8D8D8;
      box-shadow: 0px 6px 0px #D8D8D8;
    }

    .button-3d:active {
      -webkit-box-shadow: 0px 2px 0px #D8D8D8;
      -moz-box-shadow: 0px 2px 0px #D8D8D8;
      box-shadow: 0px 2px 0px #D8D8D8;
      position: relative;
      top: 4px;
    }
    
    div.box {
    position: relative;
    width: 45%;
    height: 120px;
    border: 5px solid #000000;
    border-radius:5px;
    padding: 10px 5px 5px 45px;
    margin: 0 auto;
    text-align: center;
    background: white;
  }
  </style>
  <script>
  	function bt_click(){
  		location.href ="index.jsp";
  	}
  </script>
</head>
<header style="border-bottom: 1px solid #4b4a4f; padding-bottom: 20px; padding-top: 20px; color: black; text-align: center; width: 50%; margin-left: 25%;">
  <h1>32400 CINEMA</h1>
  <p class="login-mgs" style="color: black;">예매 내용 확인</p>
</header>

<body>
<%
	String tno = request.getParameter("tno");
	int mno = ((Integer)(session.getAttribute("mno"))).intValue();
	String l = request.getParameter("l");
	String r = request.getParameter("r");
	String op = request.getParameter("op");
	String mn = reservation_DB.movieTitle(tno);
	String ano = reservation_DB.ano(tno);
	SimpleDateFormat sd = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
	String rdate = sd.format(new Date());
	int pt = reservation_DB.point(mno);
	
	
	if(op.equals("point")){
		int cnt = reservation_DB.pointUpdate(mno);
		if(cnt > 0){
			reservation_DB.seatInsert(tno, mno, l, r); // seat insert
			String sno = reservation_DB.snoLast();
			reservation_DB.reservationInsert(mno, rdate, op, mn, sno); // reservation insert
		}
		else{
			out.print("<script>alert(\"포인트가 부족합니다.\");</script>");
			out.print("<script>location.href =\"index.jsp\"</script>");
		}
	}
	else{
		int cnt = reservation_DB.pointUpdate2(mno);
		reservation_DB.seatInsert(tno, mno, l, r); // seat insert
		String sno = reservation_DB.snoLast();
		reservation_DB.reservationInsert(mno, rdate, op, mn, sno); // reservation insert
	}
%>
<div class="box">
<span style="color:black">[<%=mn %>]</span><br>
<span style="color:black"><%=ano%>관  <%=l%>행  <%=r%>열</span><br><br>
<span style="color:black">11000원  <%=op %> 결제</span><br>
<span style="color:black"><%=rdate %></span><br>

</div><br><br>
	<a class="button-3d" onclick="bt_click()">확인</a>
</body>

</html>
