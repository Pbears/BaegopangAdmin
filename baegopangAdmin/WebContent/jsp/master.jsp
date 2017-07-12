<%@page import="gopang.bean.MasterBean"%>
<%@page import="java.util.List"%>
<%@page import="gopang.dao.MasterDao"%>
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
<script>
$(function(){
	$("button.masterDeleteBtn").click(function(){
		alert("삭제!");
	});
});
</script>
<body>
	<%
		String id = (String) session.getAttribute("id");
		MasterDao master = new MasterDao();
		List<MasterBean> list = master.selectAllMaster();
	%>
	<div id="wrapper">
		<jsp:include page="/jsp/include/bar.jsp" />

		<div id="page-wrapper">

			<div class="container-fluid">

				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">
							Member <small>환영합니다 <%=id%>님
							</small>
						</h1>
					</div>
				</div>
				<!-- /.row -->

				<div class="row">
					<div class="col-lg-12">
						<h2>Member List</h2>
						<div class="table-responsive">
							<table class="table table-hover">
								<thead>
									<tr>
										<td class="headTd">아이디</td>
										<td class="headTd">이름</td>
										<td class="headTd">주소</td>
										<td class="headTd">전화번호</td>
										<td class="headTd">생년월일</td>
										<td class="headTd">음식점이름</td>
										<td class="headTd">포인트</td>
										<td class="headTd">상태</td>
									</tr>
								</thead>
								<tbody>
									<%
										for (int i = 0; i < list.size(); i++) {
											MasterBean bean = list.get(i);
									%>
									<tr>
										<td><%=bean.getId()%></td>
										<td><%=bean.getName()%></td>
										<td><%=bean.getAddress()%></td>
										<td><%=bean.getTel()%></td>
										<td><%=bean.getBirth()%></td>
										<td><%=bean.getStorename()%></td>
										<td><%=bean.getPoint()%></td>
										<td><button type="button" class="btn btn-sm btn-danger masterDeleteBtn">삭제</button></td>
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