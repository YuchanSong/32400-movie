<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title> 32400 CINEMA </title>
</head>
<body style="background-color: white;">


<header style="border-bottom: 1px solid #4b4a4f; padding-bottom: 20px; padding-top: 20px; color: black; text-align: center; width: 50%; margin-left: 25%;">
    <h1>32400 CINEMA</h1>
    <p class="login-mgs" style="color: black;"> 32400 CINEMA에 오신 것을 환영합니다.</p>

</header>

<fieldset class="login-form" style="width:50%; margin-left: 25%; padding-top: 0; text-align: center ; border: 0 none; border-bottom: 1px solid #4b4a4f; ">
    <form action="logincheck.jsp" method="post">
	    <ul style="padding:0">
	        <li style="text-decoration: none; list-style: none; padding-bottom: 10px; padding-top: 10px;">
	            <div class="login_box">
	                <input type="text" name="id" placeholder="아이디를 입력해주세요."
	                       style="border: 1px solid #4b4a4f; width: 100%; height: 44px; background: white; padding: 0 10px; font-size: 14px; color: #999a9c;box-sizing: border-box;"/>
	            </div>
	        </li>
	        <li style="text-decoration: none; list-style: none;">
	            <div class="login_box">
	                <input type="password" name="pw" maxlength="12" placeholder="비밀번호를 입력해주세요."  style="border: 1px solid #4b4a4f; width: 100%; height: 44px; background: white; padding: 0 10px; font-size: 14px; color: #999a9c;box-sizing: border-box;"/>
	                <!-- 활성화 클래스 on 추가 -->
	            </div>
	            <!-- <span style="display: block;    height: 50px;    text-align: right;    color: #cd544c;    line-height: 50px;    font-size: 14px;" class="opt-result">회원가입</span> -->
	        </li>
	        <li style="text-decoration: none; list-style: none;">
	        	<br/><input type="submit" value="로그인" style=" color: #fff; font-size: 14px; width: 100%; height: 44px; background: black;">
	        	
	            <!-- 활성화 클래스 on 추가 -->
	        </li>
	    </ul>
    </form>
</fieldset>

</body>
</html>
