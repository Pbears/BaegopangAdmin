<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="gopang.bean.ChartBean"%>
<%@page import="gopang.dao.ChartDao"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.HashMap"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="java.io.PrintWriter"%>
<%
	// jsonObject에 데이터를 저장해줄 객체
	JSONObject jsonData = null;
	// jsonData를 array에 저장해줄 객체
	JSONArray jsonArray = new JSONArray();

	ChartDao chart = new ChartDao();
	List<ChartBean> gender = chart.genderSales();

	for (int i = 0; i < gender.size(); i++) {
		ChartBean bean = gender.get(i);
		jsonData = new JSONObject();
		jsonData.put("gender", bean.getGender());
		jsonData.put("value", Integer.parseInt(bean.getAmount()));
		jsonArray.add(jsonData);
	}

	//현재페이지의 목록데이터
	PrintWriter pw = response.getWriter();
	pw.print(jsonArray.toString());
	pw.flush();
	pw.close();
%>
