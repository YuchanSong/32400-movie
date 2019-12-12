<%@page import="com.project.tfa.DBUtil" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>32400 - 회원정보 수정</title>
</head>
<body>
<% 

	//세션정보 가져오기
	int mno = ((Integer)(session.getAttribute("mno"))).intValue();
	String tel = request.getParameter("tel");
	String pw = request.getParameter("pw");
	
	Connection conn = DBUtil.getMySQLConnection(); //DB연결
	PreparedStatement psmt = null;
	int rs = 0;
	String sql = "update member set tel = ?, pw = password(?) where mno = ?";
	
	psmt = conn.prepareStatement(sql);
	psmt.setString(1, tel);
	psmt.setString(2, pw);
	psmt.setInt(3, mno);
	if (pw == null || pw.equals("")) {
		out.println("<script language='javascript'>");
	    out.println("alert('비밀번호를 입력해주세요.')");
	    out.println("history.back()"); // 이전 창 새로고침
	    out.println("</script>");
	} 
	else {
		rs = psmt.executeUpdate();
		
		DBUtil.close(psmt);
		DBUtil.close(conn);
		
		if(rs > 0) {
		    out.println("<script language='javascript'>");
		    out.println("alert('회원정보 수정 성공')");
		    out.println("location.href='index.jsp'");
		    out.println("</script>");
		}
		else { 
		    out.println("<script language='javascript'>");
		    out.println("alert('회원정보 수정 실패')");
		    out.println("location.href='index.jsp'");
		    out.println("</script>");
		}	
	}

%>
	

</body>
</html>