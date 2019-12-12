<%@page import="com.project.tfa.DBUtil" %>
<%@ page import="java.sql.*,db.*,java.util.ArrayList,java.util.Date,java.util.*,java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
  <title> 32400 CINEMA</title>
  
  <style type="text/css">
  	body {
      text-align: center;
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
	function bt_click1(){
	  		location.href ="timetable_manage0.jsp";
	}
  </script>
</head>

<body>
<header style="border-bottom: 1px solid #4b4a4f; padding-bottom: 20px; padding-top: 20px; color: black; text-align: center; width: 50%; margin-left: 25%;">
  <h1>32400 CINEMA</h1>
  <p class="login-mgs" style="color: black;">배정 관리 - 배정 수정</p>
</header>

<div class="box">
	<form  action="timetable_manage3-0.jsp">
	수정할 배정 번호 :	<input type="text" name="tno" size=10 style="margin:auto;"><br>
	  영화 번호 :	<input type="text" name="mnum" size=10 style="margin:auto;"><br>
	  상영관 번호 :	<input type="text" name="ano" size=10 style="margin:auto;"><br>
	  날짜 :	<input type="text" name="od" size=10 style="margin:auto;"><br>
	    시간 :	<input type="text" name="ot" size=10 style="margin:auto;"><br><br><br><br>
	    <a class="button-3d" onclick="bt_click1()">이전</a>
		<input type="submit" class="button-3d" value="배정 수정">
	</form>
</div>
<br><br>
</body>

</html>
