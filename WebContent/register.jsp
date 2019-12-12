<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title> 32400 CINEMA - register </title>
</head>
<body style="background-color: white;">


<header style="border-bottom: 1px solid #4b4a4f; padding-bottom: 20px; padding-top: 20px; color: black; text-align: center; width: 50%; margin-left: 25%;">
    <h1>32400 CINEMA</h1>
    <p class="login-mgs" style="color: black;"> 32400 CINEMA에 오신 것을 환영합니다.</p>

</header>

<fieldset class="login-form" style="width:50%; margin-left: 25%; padding-top: 0; text-align: center ; border: 0 none; border-bottom: 1px solid #4b4a4f; ">
    <form action="join.jsp" method="post">
        <br/>　　이름 　　<input type="text" name="mname" maxlength="5" placeholder="이름을 입력해주세요." style="border: 1px solid #4b4a4f; width: 80%; height: 44px; background: white; padding: 0 10px; font-size: 14px; color: #999a9c;box-sizing: border-box;"/>
        <br/><br/>　　나이　　 <input type="number" name="age" placeholder="나이를 입력해주세요." style="border: 1px solid #4b4a4f; width: 80%; height: 44px; background: white; padding: 0 10px; font-size: 14px; color: #999a9c;box-sizing: border-box;"/>
        <br/><br/>전화번호 　　<input type="text" name="tel" maxlength="13" placeholder="전화번호를 입력해주세요." style="border: 1px solid #4b4a4f; width: 80%; height: 44px; background: white; padding: 0 10px; font-size: 14px; color: #999a9c;box-sizing: border-box;"/>
        <br/><br/>　아이디　　 <input type="text" name="id" maxlength="10" placeholder="아이디를 입력해주세요." style="border: 1px solid #4b4a4f; width: 80%; height: 44px; background: white; padding: 0 10px; font-size: 14px; color: #999a9c;box-sizing: border-box;"/>
        <br/><br/>비밀번호 　　<input type="password" name="pw" maxlength="50" placeholder="비밀번호를 입력해주세요." style="border: 1px solid #4b4a4f; width: 80%; height: 44px; background: white; padding: 0 10px; font-size: 14px; color: #999a9c;box-sizing: border-box;"/>
        <br/><br/>
        <input type="submit" value="가입하기" style=" color: #fff; font-size: 14px; width: 100%; height: 44px; background: black;">
    </form>
</fieldset>

</body>
</html>
