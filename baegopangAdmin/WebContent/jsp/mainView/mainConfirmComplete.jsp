<%@page import="gopang.bean.OrderBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="gopang.dao.OrderDao"%>
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
		OrderDao order = new OrderDao();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", 1);
		map.put("end", 3);
		map.put("state", "승인완료");
		List<OrderBean> list = order.searchOrder(map);
	%>
	<div class="table-responsive">
		<table class="table table-bordered table-hover table-striped">
			<thead>
				<tr>
					<th>주문번호</th>
					<th>주문자ID</th>
					<th>음식점이름</th>
					<th>상태</th>
				</tr>
			</thead>
			<tbody>
				<%
					for (int i = 0; i < list.size(); i++) {
						OrderBean bean = list.get(i);
				%>
				<tr>
					<td><%=bean.getOrdernumber() %></td>
					<td><%=bean.getMemberid() %></td>
					<td><%=bean.getStorename() %></td>
					<td><%=bean.getState() %></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>
</body>
</html>