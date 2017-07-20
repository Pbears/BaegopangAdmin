<%@page import="gopang.bean.ChartBean"%>
<%@page import="gopang.dao.ChartDao"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.HashMap"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.io.PrintWriter"%>
<%
	// jsonObject에 데이터를 저장해줄 객체
	JSONObject jsonData = null;
	// jsonData를 array에 저장해줄 객체
	JSONArray jsonArray = new JSONArray();

	ChartDao chart = new ChartDao();
	List<ChartBean> list = chart.monthlySales();

	for (int i = 0; i < list.size(); i++) {
		ChartBean bean = list.get(i);
		jsonData = new JSONObject();
		jsonData.put("year", bean.getOrderday());
		jsonData.put("value", bean.getPrice());
		jsonArray.add(jsonData);
	}

	//현재페이지의 목록데이터
	out.println(jsonArray);
	PrintWriter pw = response.getWriter();
	pw.print(jsonArray);
	pw.flush();
	pw.close();
%>
