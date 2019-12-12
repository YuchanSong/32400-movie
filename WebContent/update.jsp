<%@page import="com.project.tfa.DBUtil" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
	//세션정보 가져오기
	int mno = ((Integer)(session.getAttribute("mno"))).intValue();
	String mname = (String)session.getAttribute("mname");
	int age = ((Integer)(session.getAttribute("age"))).intValue();
	String tel = (String)session.getAttribute("tel");
	String id = (String)session.getAttribute("id");
	String pw = (String)session.getAttribute("pw");
	int point = ((Integer)(session.getAttribute("point"))).intValue();

	Connection conn = DBUtil.getMySQLConnection(); //DB연결
	PreparedStatement psmt = null;
	ResultSet rs = null;
	String sql = "select * from member where mno = ?;";
	
	psmt = conn.prepareStatement(sql);
	psmt.setInt(1, mno);
	rs = psmt.executeQuery();
	rs.next();
%>

<html>
<head>
    <meta charset="UTF-8">
    <title> 32400 CINEMA - update </title>
    <script type="text/javascript">
    function delete_member() {
        if(confirm("정말로 삭제하시겠습니까?\n삭제된 정보는 복구가 불가능 합니다.")) {
	    	document.update_form.action="delete_member.jsp";
    		document.update_form.method="post";
       		document.update_form.submit();
        } else return;
 }
</script>
</head>
<body style="background-color: white;">

<header style="border-bottom: 1px solid #4b4a4f; padding-bottom: 20px; padding-top: 20px; color: black; text-align: center; width: 50%; margin-left: 25%;">
    <h1>32400 CINEMA</h1>
    <p class="update-mgs" style="color: black;"> 회원정보수정</p>

</header>

<fieldset class="update" style="width:50%; margin-left: 25%; padding-top: 0; text-align: center ; border: 0 none; border-bottom: 1px solid #4b4a4f; ">
    <form name="update_form" action="update_member.jsp" method="post">
        <br/>　　*이름 　　<input type="text" name="mname" value="<%=rs.getString("mname") %>" style="border: 1px solid #4b4a4f; width: 80%; height: 44px; background: white; padding: 0 10px; font-size: 14px; color: #999a9c;box-sizing: border-box;"readonly />
        <br/><br/>　　*나이　　 <input type="text" name="age" value="<%=rs.getInt("age") %>" style="border: 1px solid #4b4a4f; width: 80%; height: 44px; background: white; padding: 0 10px; font-size: 14px; color: #999a9c;box-sizing: border-box;"readonly/>
        <br/><br/>전화번호 　　 <input type="text" name="tel" value="<%=rs.getString("tel") %>" style="border: 1px solid #4b4a4f; width: 80%; height: 44px; background: white; padding: 0 10px; font-size: 14px; color: #999a9c;box-sizing: border-box;"/>
        <br/><br/>　*아이디　　 <input type="text" name="id" value="<%=rs.getString("id") %>" style="border: 1px solid #4b4a4f; width: 80%; height: 44px; background: white; padding: 0 10px; font-size: 14px; color: #999a9c;box-sizing: border-box;"readonly/>
        <br/><br/>비밀번호 　　 <input type="password" name="pw" style="border: 1px solid #4b4a4f; width: 80%; height: 44px; background: white; padding: 0 10px; font-size: 14px; color: #999a9c;box-sizing: border-box;"/>
        <br/><br/>　*포인트　　 <input type="text" name="point" value="<%=rs.getInt("point") %>" style="border: 1px solid #4b4a4f; width: 80%; height: 44px; background: white; padding: 0 10px; font-size: 14px; color: #999a9c;box-sizing: border-box;"readonly/>
        <br/><br/>
        *은 수정 불가합니다! <br/><br/>
        <input type="submit" value="수정하기" style=" color: #fff; font-size: 14px; width: 100%; height: 44px; background: black;">
        <input type="button" value="탈퇴하기" style=" color: #fff; font-size: 14px; width: 100%; height: 44px; background: red;" onClick="delete_member()" >
    </form>
</fieldset>

</body>
</html>
