<%@page import="gopang.dao.NoticeDao"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String title = request.getParameter("title");
		String info = request.getParameter("info");
		NoticeDao notice = new NoticeDao();
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("title", title);
		map.put("info", info);
		notice.insertNotice(map);
		response.sendRedirect("/baegopangAdmin/jsp/notice.jsp");
	%>
</body>
</html>