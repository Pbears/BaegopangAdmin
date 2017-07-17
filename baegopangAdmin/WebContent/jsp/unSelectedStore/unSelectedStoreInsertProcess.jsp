<%@page import="gopang.dao.StoreDao"%>
<%@page import="gopang.dao.BrandDao"%>
<%@page import="gopang.bean.StoreBean"%>
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

		
		String storename = request.getParameter("brandname")+"-"+request.getParameter("storename");
		String location = request.getParameter("location");
		String brandno = brand.selectBrandNo(request.getParameter("brandname"));
		String tel = request.getParameter("tel");
		int minprice = Integer.parseInt(request.getParameter("minprice"));
		String info = request.getParameter("info");

		StoreBean bean = new StoreBean(storename, brandno, location, 0, "문의", tel, minprice, info);
		
		StoreDao store = new StoreDao();
		store.insertUnselectedStore(bean);
		response.sendRedirect("/baegopangAdmin/jsp/unSelectedStore.jsp");
	%>
</body>
</html>