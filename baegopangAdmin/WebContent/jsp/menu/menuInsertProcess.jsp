<%@page import="gopang.dao.MenuDao"%>
<%@page import="gopang.bean.MenuBean"%>
<%@page import="gopang.dao.BrandDao"%>
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
	BrandDao brand = new BrandDao();
	MenuDao menu = new MenuDao();
	String menuname = request.getParameter("brandName")+"-"+request.getParameter("menuName");
	String brandno = brand.selectBrandNo(request.getParameter("brandName"));
	int price = Integer.parseInt(request.getParameter("menuPrice"));
	String info = request.getParameter("menuInfo");
	String picture = request.getParameter("menuImg");
	MenuBean bean = new MenuBean(menuname,brandno,price,info,picture);
	menu.insertMenu(bean);
	response.sendRedirect("/baegopangAdmin/jsp/menu.jsp");
%>
</body>
</html>