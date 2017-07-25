<%@page import="java.util.HashMap"%>
<%@page import="gopang.bean.MemberBean"%>
<%@page import="java.util.List"%>
<%@page import="gopang.dao.MemberDao"%>
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
		List<MemberBean> list = null;
		MemberDao member = new MemberDao();
		HashMap<String, Object> map = new HashMap<String, Object>();
		int pageScale = 8;
		int totalRow = member.getMemberTotalRow();
		int currentPage = 0;
		try {
			currentPage = Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
			currentPage = 1;
		}
		int totalPage = totalRow % pageScale == 0 ? totalRow / pageScale : totalRow / pageScale + 1;
		if (totalRow == 0)
			totalPage = 1;
		int start = 1 + (currentPage - 1) * pageScale;
		int end = pageScale + (currentPage - 1) * pageScale;
		int currentBlock = currentPage % pageScale == 0 ? (currentPage / pageScale) : (currentPage / pageScale + 1);
		int startPage = 1 + (currentBlock - 1) * pageScale;
		int endPage = pageScale + (currentBlock - 1) * pageScale;
		if (totalPage <= endPage)
			endPage = totalPage;
		map.put("start", start);
		map.put("end", end);

		list = member.searchMember(map);
	%>
	<div id="wrapper">
		<jsp:include page="/jsp/include/bar.jsp" />

		<div id="page-wrapper">

			<div class="container-fluid">

				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">
							Member <small>환영합니다 관리자님</small>
						</h1>
					</div>
				</div>
				<!-- /.row -->

				<div class="row">
					<div class="col-lg-12">
						<h2>사용자 List</h2>
						<div class="table-responsive">
							<table class="table table-hover">
								<thead>
									<tr>
										<td class="headTd" width="15%">아이디</td>
										<td class="headTd" width="10%">이름</td>
										<td class="headTd" width="35%">주소</td>
										<td class="headTd" width="10%">성별</td>
										<td class="headTd" width="10%">전화번호</td>
										<td class="headTd" width="10%">생년월일</td>
										<td class="headTd" width="10%">팡</td>
									</tr>
								</thead>
								<tbody>
									<%
										for (int i = 0; i < list.size(); i++) {
											MemberBean bean = list.get(i);
									%>
									<tr>
										<td><%=bean.getId()%></td>
										<td><%=bean.getName()%></td>
										<td><%=bean.getAddress()%></td>
										<td><%=bean.getGender()%></td>
										<td><%=bean.getTel()%></td>
										<td><%=bean.getBirth()%></td>
										<td><%=bean.getPang()%></td>
									</tr>
									<%
										}
									%>
								</tbody>
							</table>
						</div>
					</div>
					
					<!-- 페이지이동페이징 -->
					<div class="col-lg-12">
						<div id="pagerDiv"
							style="width: 100%; margin: 0 auto; text-align: center;">
							<ul class="pagination">
								<ul class="pager">
									<li>
										<%
											if (currentBlock > 1) {
												if (currentPage != startPage) {
										%>
												<a href="/baegopangAdmin/jsp/member.jsp?page=<%=startPage - 1%>">
													Previous
												</a>
										<%
												}else{
										%>
													<a href="#">Previous</a>
										<% 
												}
											}else {
												if (currentPage != startPage) {
										%>
													<a href="/baegopangAdmin/jsp/member.jsp?page=<%=currentPage - 1%>">
														Previous
													</a>
										<%
												}else{
										%>
													<a href="#">Previous</a>
										<%
												}
											}
										%>
									</li>
									<span> 
										<%
							 				for (int i = startPage; i <= endPage; i++) {
							 					if (i == currentPage) {
							 			%> 
							 					<li>
							 						<a href="#"><strong><%=i %></strong></a>
							 					</li> 
							 			<%
							 					} else {
							 			%> 
							 					<li>
							 						<a href="/baegopangAdmin/jsp/member.jsp?page=<%=i%>">
							 							<%=i %>
													</a>
												</li>
										<%
							 					}
							 				}
							 			%>
									</span>
									<li>
										<%
											if (totalPage > endPage) {
												if (currentPage != endPage) {
										%>
													<a href="/baegopangAdmin/jsp/member.jsp?page=<%=currentPage + 1%>">
														Next
													</a>
										<%
												} else {
										%>
													<a href="#">Next</a>
										<%
												}
											}
										%>
									</li>
								</ul>
							</ul>
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