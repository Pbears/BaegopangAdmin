<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="gopang.bean.BrandBean"%>
<%@page import="java.util.List"%>
<%@page import="gopang.dao.BrandDao"%>
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
		request.setCharacterEncoding("UTF-8");
		BrandDao brand = new BrandDao();
		
		String brandNo = request.getParameter("brandNo");
		String brandName = request.getParameter("brandName");
		String brandImg = request.getParameter("brandImg");

		System.out.println(brandNo);
		int maxNo = brand.selectAllBrandNo(brandNo.charAt(0));
		BrandBean bean = new BrandBean(String.valueOf(++maxNo),brandName,brandImg);
		
		brand.insertBrand(bean);
		response.sendRedirect("/baegopangAdmin/jsp/brand.jsp");
		
	%>
</body>
</html>