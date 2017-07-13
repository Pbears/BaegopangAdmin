<%@page import="gopang.bean.masterAskAdminBean"%>
<%@page import="gopang.dao.MasterAskAdminDao"%>
<%@page import="gopang.bean.NoticeBean"%>
<%@page import="gopang.dao.NoticeDao"%>
<%@page import="java.util.HashMap"%>
<%@page import="gopang.bean.StoreBean"%>
<%@page import="java.util.List"%>
<%@page import="gopang.dao.StoreDao"%>
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

table {
	font-size: small;
}

div.storeInsertDiv {
	width: 100%;
	text-align: right;
}
div.answerDiv {
	width: 100%;
}
button.answerInsertBtn{
	width: 100px;
	height: 70px;
}
button.questionDeleteBtn{
	width: 100px;
}
textarea{
	resize: none;
}
</style>
<script>
	$(function() {
		$("tr.answerTr, .completeAnswer").hide();
		$("button.answerInsertBtn").click(function() {
			$("form[id='"+$(this).attr("id")+"']").submit();
		});
		$("button.questionDeleteBtn").click(function() {
			alert("삭제!");
		});
		$("tr.QeustionTr, .completeTr").click(function(){
			$(this).next().toggle(500);
		});
	});
</script>
<body>
	<%
		String id = (String) session.getAttribute("id");
		List<masterAskAdminBean> list = null;
		MasterAskAdminDao maska = new MasterAskAdminDao();
		HashMap<String, Object> map = new HashMap<String, Object>();
		int pageScale = 8;
		int totalRow = maska.getMasterAskAdminTotalRow();
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

		list = maska.searchMasterAskAdmin(map);
	%>
	<div id="wrapper">
		<jsp:include page="/jsp/include/bar.jsp" />

		<div id="page-wrapper">

			<div class="container-fluid">

				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">
							Question & Answer <small>환영합니다 <%=id %></small>
						</h1>
					</div>
				</div>
				<!-- /.row -->

				<div class="row">
					<div class="col-lg-12">
						<h2>Question List</h2>
						<div class="table-responsive">
							<table class="table table-hover">
								<thead>
									<tr>
										<td class="headTd" width="10%">번호</td>
										<td class="headTd" width="10%">질문자</td>
										<td class="headTd" width="20%">제목</td>
										<td class="headTd" width="30%">내용</td>
										<td class="headTd" width="10%">응답자</td>
										<td class="headTd" width="10%">등록일</td>
										<td class="headTd" width="10%">상태</td>
									</tr>
								</thead>
								<tbody>
										<%
										for (int i = 0; i < list.size(); i++) {
											masterAskAdminBean bean = list.get(i);
											if(bean.getHit()==0){
											%>
											<tr class="QeustionTr" id="<%=bean.getNo() %>">
												<td><%=bean.getNo() %></td>
												<td><%=bean.getMasterId() %></td>
												<td><%=bean.getTitle() %></td>
												<td><%=bean.getMasterInfo() %></td>
												<td><%=bean.getAdminId() %></td>
												<td><%=bean.getRegdate() %></td>
												<td><button type="button" class="btn btn-sm btn-danger" disabled="disabled">답변요망</button></td>
											</tr>
											<tr class="answerTr">
												<td colspan="6">
													<form action="/baegopangAdmin/jsp/masterAskAdmin/insert.jsp" method="post" id="<%=bean.getNo() %>">
														<textarea class="form-control answerTextArea" rows="3" name="answer"></textarea>
														<input type="hidden" name="no" value="<%=bean.getNo() %>">
													</form>
												</td>
												<td colspan="1">
													<button type="button" class="btn btn-sm btn-primary answerInsertBtn" id="<%=bean.getNo() %>">답변</button>
												</td>
											</tr>
											<%
											}
											else{
											%>
											<tr class="completeTr">
												<td><%=bean.getNo() %></td>
												<td><%=bean.getMasterId() %></td>
												<td><%=bean.getTitle() %></td>
												<td><%=bean.getMasterInfo() %></td>
												<td><%=bean.getAdminId() %></td>
												<td><%=bean.getRegdate() %></td>
												<td><button type="button" class="btn btn-sm btn-primary" disabled="disabled">답변완료</button></td>
											</tr>
											<tr class="completeAnswer">
												<td colspan="7"><%=bean.getAdminInfo() %></td>
											</tr>
											<%
											}
									%>
									
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
												<a href="/baegopangAdmin/jsp/masterAskAdmin.jsp?page=<%=startPage - 1%>">
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
													<a href="/baegopangAdmin/jsp/masterAskAdmin.jsp?page=<%=currentPage - 1%>">
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
							 						<a href="/baegopangAdmin/jsp/masterAskAdmin.jsp?page=<%=i%>">
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
													<a href="/baegopangAdmin/jsp/masterAskAdmin.jsp?page=<%=currentPage + 1%>">
														Next
													</a>
										<%
												} else {
										%>
													<a href="#">Next</a>
										<%
												}
											}else{
												if (currentPage != endPage) {
										%>
													<a href="/baegopangAdmin/jsp/masterAskAdmin.jsp?page=<%=currentPage + 1%>">
														Next
													</a>
										<%
												}else{
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