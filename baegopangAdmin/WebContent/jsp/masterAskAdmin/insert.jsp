<%@page import="java.util.HashMap"%>
<%@page import="gopang.dao.MasterAskAdminDao"%>
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
		MasterAskAdminDao ask = new MasterAskAdminDao();
		String answer = request.getParameter("answer");
		String no = request.getParameter("no");
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("answer", answer);
		map.put("no", no);
		ask.insertAnswer(map);
		response.sendRedirect("/baegopangAdmin/jsp/masterAskAdmin.jsp");
	%>
</body>
</html>