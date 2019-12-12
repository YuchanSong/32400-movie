<%@ page contentType="text/html;charset=EUC-KR"%>

<%
	//기존의 세션 데이터를 모두 삭제
    session.invalidate();
	//index 페이지로 이동 시킴
    response.sendRedirect("index.jsp");
%>
