<%@page import="com.project.tfa.DBUtil" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	request.setCharacterEncoding("UTF-8");
	
	//로그인 정보 설정
	int mno = 0;
	String mname = null;
	int age = 0;
	String tel = null;
	int point = 0;
	
	//input id, pw
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	//DB id, pw
	String DB_id = null;
	String DB_pw = null;
	
	Connection conn = DBUtil.getMySQLConnection(); //DB연결
	
	//DB에서 정보 받아오기
	String sql = "select * from member where id = ?;";
	PreparedStatement psmt = conn.prepareStatement(sql);
	
	psmt.setString(1, id);
	ResultSet rs = psmt.executeQuery();
	
	if (rs.next()) {
		mno = rs.getInt("mno"); // mno 받아오기(관리자/사용자 구분)
		mname = rs.getString("mname"); // 이름 받아오기
		age = rs.getInt("age");
		tel = rs.getString("tel");
		DB_id = rs.getString("id"); // id의 DB_id 받아오기
		//DB_pw = rs.getString("pw"); // pw의 DB_pw 받아오기
		point = rs.getInt("point");
	}
	
	DBUtil.close(rs);
	DBUtil.close(psmt);
	DBUtil.close(conn);
	
	if(DBUtil.select_check(id, pw) == true) { // 복호화 로그인
		session.setAttribute("mno", new Integer(mno)); // setAttribute int형으로 받아오기
		session.setAttribute("mname", mname);
		session.setAttribute("age", new Integer(age));
		session.setAttribute("tel", tel);
        session.setAttribute("id", id);
        session.setAttribute("point", new Integer(point));
		response.sendRedirect("index.jsp"); // index.jsp 에 session 정보를 보낸다
	} else {
		out.println("<script>");
		out.println("alert('아이디 또는 비밀번호를 다시 확인하세요.')");
		out.println("history.back()"); // 이전 창 새로고침
		out.println("</script>");
	}
%>
</body>
</html>