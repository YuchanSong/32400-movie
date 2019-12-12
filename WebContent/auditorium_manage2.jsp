<%@page import="com.project.tfa.DBUtil" %>
<%@ page pageEncoding="utf-8" language="java" contentType="text/html; charset=utf-8"  import="java.sql.*,db.*,java.util.ArrayList,java.util.Date,java.util.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
    height: 50px;
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
	  		location.href ="auditorium_manage0.jsp";
	}
  </script>
</head>
<header style="border-bottom: 1px solid #4b4a4f; padding-bottom: 20px; padding-top: 20px; color: black; text-align: center; width: 50%; margin-left: 25%;">
  <h1>32400 CINEMA</h1>
  <p class="login-mgs" style="color: black;">상영관 관리 - 상영관 등록</p>
</header>
<body>
<div class="box">
	<form  action="auditorium_manage2-0.jsp"> 
	    좌석 수 :	<input type="text" name="scount" size=10 style="margin:auto;"><br><br><br><br>
	    <a class="button-3d" onclick="bt_click1()">이전</a>
		<input type="submit" class="button-3d" value="상영관 등록">
	</form>
</div>
<br><br>
</body>

</html>
