<%@page import="gopang.dao.StoreDao"%>
<%@page import="java.util.HashMap"%>
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
	$("tr.requestTr").hide();
	$("button.btn-primary").click(function(){
		var id = $(this).parent().parent().prev().find('.tdId').text()
		var pw = $(this).parent().parent().prev().find('.tdPw').text()
		var name = $(this).parent().parent().prev().find('.tdName').text()
		var address = $(this).parent().parent().prev().find('.tdAddress').text()
		var tel = $(this).parent().parent().prev().find('.tdTel').text()
		var birth = $(this).parent().parent().prev().find('.tdBirth').text()
		var storename = $(this).parent().prev().children().val();
		
		var result = confirm('승인할 정보가 맞습니까?\n\n'+'   id : '+id+'\n   pw : '+pw+'\n   name : '+name
				+'\n   address : '+address+'\n   tel : '+tel+'\n   birth : '+birth+'\n   storename : '+storename);
		if(result) { 
			location.href="/baegopangAdmin/jsp/masterRequest/insert.jsp?id="+id+
					"&pw="+pw+"&name="+name+"&address="+address+"&tel="+tel+"&birth="+birth+"&storename="+storename;
		}
		
	});
	$("button.btn-danger").click(function(){
		var result = confirm('정말 삭제하시겠습니까?');
		if(result) { 
			location.href="/baegopangAdmin/jsp/masterRequest/delete.jsp?id="+$(this).attr("id");
		}
	});
	$("tr.ttr").click(function(){
		$(this).next().toggle(500);
	});
})
</script>
<body>
	<%
		String id = (String) session.getAttribute("id");
		List<MasterBean> list = null;
		MasterDao master = new MasterDao();
		StoreDao store = new StoreDao();
		List<String> unSelectedStore = store.selectAllUnSelectedStoreName();
		HashMap<String, Object> map = new HashMap<String, Object>();
		int pageScale = 8;
		int totalRow = master.getRequestMasterTotalRow();

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

		list = master.searchRequestMaster(map);
	%>
	<div id="wrapper">
		<jsp:include page="/jsp/include/bar.jsp" />

		<div id="page-wrapper">

			<div class="container-fluid">

				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">
							MasterInRequest <small>환영합니다 <%=id%>님
							</small>
						</h1>
					</div>
				</div>
				<!-- /.row -->

				<div class="row">
					<div class="col-lg-12">
						<h2>사장님 가입요청</h2>
						<div class="table-responsive">
							<table class="table table-hover">
								<thead>
									<tr>
										<td class="headTd" width="10%">아이디</td>
										<td class="headTd" width="10%">비밀번호</td>
										<td class="headTd" width="5%">이름</td>
										<td class="headTd" width="40%">주소</td>
										<td class="headTd" width="10%">전화번호</td>
										<td class="headTd" width="5%">생년월일</td>
										<td class="headTd" width="15%">음식점이름</td>
										<td class="headTd" width="5%">포인트</td>
									</tr>
								</thead>
								<tbody>
									<%
										for (int i = 0; i < list.size(); i++) {
											MasterBean bean = list.get(i);
									%>
									<tr class="ttr">
										<td class="tdId"><%=bean.getId()%></td>
										<td class="tdPw"><%=bean.getPw() %></td>
										<td class="tdName"><%=bean.getName()%></td>
										<td class="tdAddress"><%=bean.getAddress()%></td>
										<td class="tdTel"><%=bean.getTel()%></td>
										<td class="tdBirth"><%=bean.getBirth()%></td>
										<td class="tdStoreName"><%=bean.getStorename()%></td>
										<td class="tdPoint"><%=bean.getPoint()%></td>
									</tr>
									<tr class="requestTr">
										<td colspan="4">
											<select class="form-control">
												<option value="empty" selected="selected">선택하세요</option>
												<%
													for(int j=0 ; j < unSelectedStore.size() ; j++){
														%>
														<option value="<%=unSelectedStore.get(j) %>"><%=unSelectedStore.get(j) %></option>
														<%
													}
												%>
											</select>
										</td>
										<td colspan="3">
											<button type="button" class="btn btn-sm btn-primary">승인</button>
											<button type="button" class="btn btn-sm btn-danger" id="<%=bean.getId()%>">거절</button>	
										</td>
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
												<a href="/baegopangAdmin/jsp/masterRequest.jsp?page=<%=startPage - 1%>">
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
													<a href="/baegopangAdmin/jsp/masterRequest.jsp?page=<%=currentPage - 1%>">
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
							 						<a href="/baegopangAdmin/jsp/masterRequest.jsp?page=<%=i%>">
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
													<a href="/baegopangAdmin/jsp/masterRequest.jsp?page=<%=currentPage + 1%>">
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
													<a href="/baegopangAdmin/jsp/masterRequest.jsp?page=<%=currentPage + 1%>">
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