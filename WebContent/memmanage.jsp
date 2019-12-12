<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title> 32400 CINEMA </title>
</head>
<body style="background-color: white;">


<header style="border-bottom: 1px solid #4b4a4f; padding-bottom: 20px; padding-top: 20px; color: black; text-align: center; width: 50%; margin-left: 25%;">
    <h1>32400 CINEMA</h1>
    <p class="adminin-mgs" style="color: black;"> 32400 CINEMA 관리자 모드</p>

</header>
<body>

<!-- a태그 밑줄 및 색상 변경 -->
<style type="text/css">
	 a:link { color: black; text-decoration: none;}
	 a:visited { color: black; text-decoration: none;}
	 a:hover { color: blakc; text-decoration: none;}
</style>

<fieldset class="mem-form" style="width:50%; margin-left: 25%; padding-top: 0; text-align: center ; border: 0 none; border-bottom: 1px solid #4b4a4f; ">
    <br><br><br>
    <a href="all_member.jsp"> 1. 모든 회원정보 출력 ☞ </a> <br><br><br>
    <a href="all_reservation.jsp"> 2. 모든 예매정보 출력 ☞ </a> <br><br><br>
    <form action="s_mno.jsp" method="post">
		<span> 　3. 회원 번호 검색 ☞ </span>
		<input type="text" name="s_mno" > 
		<input type ="submit" value="검색하기" style=" color: #fff; font-size: 14px; width: 10%; height: 30px; background: black;"><br><br><br>
	</form>
	<form action="s_id.jsp" method="post">
	    <span> 4. 회원 ID 검색 ☞ </span>
		<input type="text" name="s_id" > 
		<input type ="submit" value="검색하기" style=" color: #fff; font-size: 14px; width: 10%; height: 30px; background: black;"><br><br><br>
	   </form>
    <br><br><br>
</fieldset>
</body>
</html>
