<%@ page contentType="text/html;charset=EUC-KR"%>

<%
	//������ ���� �����͸� ��� ����
    session.invalidate();
	//index �������� �̵� ��Ŵ
    response.sendRedirect("index.jsp");
%>
