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
    height: 600px;
    border: 5px solid #000000;
    border-radius:5px;
    padding: 10px 5px 5px 45px;
    margin: 0 auto;
    text-align: left;
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
  <p class="login-mgs" style="color: black;">티켓 출력</p>
</header>

<body>
<%
	reservation_DB.loadConnect(); 
	request.setCharacterEncoding("euc-kr");
	ArrayList<String> result = new ArrayList<String>();
	String rno = request.getParameter("rno");
	result = reservation_DB.showTicket(rno);
	int x = result.size();
	System.out.println(x);
	String[] t = new String[1];
	 for(int i = 0; i< x; i++){
		 t = result.get(i).split(";");
	 }
	 for(int i = 0; i < t.length; i++){
		 System.out.println(t[i]);
	 }
	
%>
<div class="box"><br><br>
<span style="color:black";>***************************************************************</span><br>
<span style="color:black">　　　　　　　　　   영화입장권</span><br>
<span style="color:black">　　　　　　　　　[영수증전용]</span><br>
<span style="color:black"></span><br>
<span style="color:black">영화 : [<%=t[1]%>]</span><br>
<span style="color:black">좌석 : <%=t[2]%>관 <%=t[4]%>행  <%=t[5]%>열</span><br>
<span style="color:black">상영일 : <%=t[3]%></span><br><br>
<span style="color:black">==========================================</span><br>
<span style="color:black"></span><br>
<span style="color:black">가격 : 11000원　　　　　　　　결제방법 : <%=t[6]%> 결제</span><br>
<span style="color:black">예약일 : <%=t[7]%></span><br>
<span style="color:black"></span><br>
<span style="color:black">==========================================</span><br>
<span style="color:black"></span><br>
<span style="color:black">CGV 한신 (031-379-0114)</span><br>
<span style="color:black"></span><br>
<span style="color:black">교환 및 환불은 상영시간 전까지 영수증 지참</span><br>
<span style="color:black"></span><br>
<span style="color:black">입장지연에 따른 관람불편을 최소화하고자 </span><br>
<span style="color:black">본영화는 10여 분 후에 시작됩니다.</span><br>
<span style="color:black">관람에티켓을 위한 사전입장을 부탁 드립니다.</span><br>
<span style="color:black"></span><br>
<span style="color:black"></span><br>
<span style="color:black">***************************************************************</span><br>

</div><br><br>

	<a class="button-3d" onclick="bt_click()">확인</a>
</body>

</html>
