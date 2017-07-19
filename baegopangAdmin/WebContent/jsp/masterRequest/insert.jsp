<%@page import="gopang.dao.StoreDao"%>
<%@page import="gopang.dao.MasterDao"%>
<%@page import="gopang.bean.MasterBean"%>
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

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String address = request.getParameter("address");
	String tel = request.getParameter("tel");
	String birth = request.getParameter("birth");
	String storename = request.getParameter("storename");

	MasterBean bean = new MasterBean(id,pw,name,address,tel,birth,storename,0);
	StoreDao store = new StoreDao();
	MasterDao master = new MasterDao();
	master.approvalRequestMaster(bean);
	store.deleteUnselectedStore(storename);
	
	response.sendRedirect("/baegopangAdmin/jsp/masterInRequest.jsp");
	
%>
</body>
</html>