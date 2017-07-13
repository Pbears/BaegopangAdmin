<%@page import="gopang.dao.NoticeDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	String no = request.getParameter("no");
	NoticeDao notice = new NoticeDao();
	notice.deleteNotice(no);
	response.sendRedirect("/baegopangAdmin/jsp/notice.jsp");
%>
</body>
</html>