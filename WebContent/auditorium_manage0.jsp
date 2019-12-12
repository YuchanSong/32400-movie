<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title> 32400 CINEMA </title>
      <style type="text/css">
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
	      margin: 12px;
	
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
  	</style>
  	<script>

    function bt_click1(){
    	location.href ="auditorium_manage1.jsp";
    }
    function bt_click2(){
    	location.href ="auditorium_manage2.jsp";
    }
    function bt_click3(){
    	location.href ="auditorium_manage3.jsp";
    }
    function bt_click4(){
    	location.href ="auditorium_manage4.jsp";
    }
    function bt_click5(){
    	location.href ="managerMenu.jsp";
    }
  </script>
</head>
<body style="background-color: white;">


<header style="border-bottom: 1px solid #4b4a4f; padding-bottom: 20px; padding-top: 20px; color: black; text-align: center; width: 50%; margin-left: 25%;">
    <h1>32400 CINEMA</h1>
    <p class="adminin-mgs" style="color: black;"> 32400 CINEMA 관리자 모드 - 상영관 관리</p>

</header>
<body>

<!-- a태그 밑줄 및 색상 변경 -->
<style type="text/css">
	 a:link { color: black; text-decoration: none;}
	 a:visited { color: black; text-decoration: none;}
	 a:hover { color: blakc; text-decoration: none;}
</style>

<fieldset class="admin-form" style="width:50%; margin-left: 25%; padding-top: 0; text-align: center ; border: 0 none; border-bottom: 1px solid #4b4a4f; ">
    <br>
    <a href="#" class="button-3d" onclick="bt_click1()">상영관 목록</a><br>
    <a href="#" class="button-3d" onclick="bt_click2()">상영관 등록</a><br>
    <a href="#" class="button-3d" onclick="bt_click3()">상영관 수정</a><br>
    <a href="#" class="button-3d" onclick="bt_click4()">상영관 삭제</a><br>
    <a href="#" class="button-3d" onclick="bt_click5()">이전</a><br>
</fieldset>
</body>
</html>
