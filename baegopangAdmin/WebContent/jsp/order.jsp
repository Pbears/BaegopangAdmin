<%@page import="gopang.bean.OrderBean"%>
<%@page import="java.util.List"%>
<%@page import="gopang.dao.OrderDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>배고팡 관리자</title>
<link href="/baegopangAdmin/css/bootstrap.min.css" rel="stylesheet">
<link href="/baegopangAdmin/css/sb-admin.css" rel="stylesheet">
<link href="/baegopangAdmin/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<script src="/baegopangAdmin/js/jquery.js"></script>
<script src="/baegopangAdmin/js/bootstrap.min.js"></script>
</head>
<style>
tr {
	height: 50px;
}

td {
	text-align: center;
	vertical-align: middle;
}

td.headTd {
	font-weight: bold;
	font-size: medium;
}
table{
	font-size: small;
}
</style>
<body>
	<%
		String id = (String) session.getAttribute("id");
		OrderDao order = new OrderDao();
		List<OrderBean> list = order.selectAllOrder();
	%>
	<div id="wrapper">
		<jsp:include page="/jsp/include/bar.jsp" />

		<div id="page-wrapper">

			<div class="container-fluid">

				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">
							Order <small>환영합니다 <%=id %>님</small>
						</h1>
					</div>
				</div>
				<!-- /.row -->

				<div class="row">
					<div class="col-lg-12">
						<h2>Order List</h2>
						<div class="table-responsive">
							<table class="table table-hover">
								<thead>
									<tr>
										<td class="headTd">주문번호</td>
										<td class="headTd">주문자ID</td>
										<td class="headTd">이름</td>
										<td class="headTd">주문자전화번호</td>
										<td class="headTd">주문자주소</td>
										<td class="headTd">가격</td>
										<td class="headTd">메뉴이름</td>
										<td class="headTd">수량</td>
										<td class="headTd">음식점이름</td>
										<td class="headTd">음식점전화번호</td>
										<td class="headTd">주문시간</td>
										<td class="headTd">상태</td>
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
										<td><%=bean.getMembername() %></td>
										<td><%=bean.getMembertel() %></td>
										<td><%=bean.getMemberaddress() %></td>
										<td><%=bean.getPrice() %></td>
										<td><%=bean.getMenuname() %></td>
										<td><%=bean.getAmount() %></td>
										<td><%=bean.getStorename() %></td>
										<td><%=bean.getStoretel() %></td>
										<td><%=bean.getOrdertime() %></td>
										<td><%=bean.getState() %></td>
									</tr>
									<%
										}
									%>
								</tbody>
							</table>
						</div>
					</div>

				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- /#page-wrapper -->

		</div>
		<!-- /#wrapper -->
</body>
</html>