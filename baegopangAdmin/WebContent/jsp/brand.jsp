<%@page import="gopang.bean.BrandBean"%>
<%@page import="java.util.List"%>
<%@page import="gopang.dao.BrandDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="/baegopangAdmin/css/bootstrap.min.css" rel="stylesheet">
<link href="/baegopangAdmin/css/sb-admin.css" rel="stylesheet">
<link href="/baegopangAdmin/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link href="/baegopangAdmin/css/plugins/morris.css" rel="stylesheet">
<script src="/baegopangAdmin/js/jquery.js"></script>
<script src="/baegopangAdmin/js/bootstrap.min.js"></script>
<script src="/baegopangAdmin/js/plugins/morris/raphael.min.js"></script>
<script src="/baegopangAdmin/js/plugins/morris/morris.min.js"></script>
<script src="/baegopangAdmin/js/plugins/morris/morris-data.js"></script>
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
</style>
<body>
	<%
		String id = (String) session.getAttribute("id");
		BrandDao brand = new BrandDao();
		List<BrandBean> list = brand.selectAllBrand();
	%>
	<div id="wrapper">
		<jsp:include page="/jsp/include/bar.jsp" />

		<div id="page-wrapper">

			<div class="container-fluid">

				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">
							Brand <small>환영합니다 <%=id%>님
							</small>
						</h1>
					</div>
				</div>
				<!-- /.row -->

				<div class="row">
					<div class="col-lg-12">
						<h2>Brand List</h2>
						<div class="table-responsive">
							<table class="table table-hover">
								<thead>
									<tr>
										<td class="headTd">브랜드번호</td>
										<td class="headTd">브랜드이름</td>
										<td class="headTd">브랜드사진</td>
									</tr>
								</thead>
								<tbody>
								<%
									for (int i = 0; i < list.size(); i++) {
										BrandBean bean = list.get(i);
								%>
									<tr>
										<td><%=bean.getBrandno()%></td>
										<td><%=bean.getBrandname()%></td>
										<td><img src="/baegopangAdmin<%=bean.getPicture()%>"
											width="50" height="50"></td>
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