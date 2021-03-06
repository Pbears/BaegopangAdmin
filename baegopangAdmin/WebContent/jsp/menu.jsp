<%@page import="java.util.HashMap"%>
<%@page import="gopang.bean.MenuBean"%>
<%@page import="java.util.List"%>
<%@page import="gopang.dao.MenuDao"%>
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
div.divInfo{
	white-space: nowrap; 
    width: 50em; 
    overflow: hidden;
    text-overflow: ellipsis; 
}
div.menuInsertDiv{
	width: 100%;
	text-align: right;
}
</style>
<script>
$(function(){
	$("button.menuDeleteBtn").click(function(){
		alert("삭제구현하세요");
	});
	$("button#menuInsertBtn").click(function(){
		location.href="/baegopangAdmin/jsp/menu/menuInsert.jsp";
	});
});
</script>
<body>
	<%
		String id = (String) session.getAttribute("id");
		List<MenuBean> list = null;
		MenuDao menu = new MenuDao();
		HashMap<String, Object> map = new HashMap<String, Object>();
		int pageScale = 8;
		int totalRow = menu.getMenuTotalRow();
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

		list = menu.searchMenu(map);
	%>
	<div id="wrapper">
		<jsp:include page="/jsp/include/bar.jsp"/>

		<div id="page-wrapper">

			<div class="container-fluid">

				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">
							Menu <small>환영합니다 <%=id %>님</small>
						</h1>
					</div>
				</div>
				<!-- /.row -->
				
				<div class="row">
					<div class="col-lg-12 menuInsertDiv">
						<button type="button" class="btn btn-sm btn-primary" id="menuInsertBtn">추가</button>
					</div>
                    <div class="col-lg-12">
                        <h2>Menu List</h2>
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <td class="headTd" width="25%">메뉴이름</td>
										<td class="headTd" width="10%">브랜드번호</td>
										<td class="headTd" width="5%">가격</td>
										<td class="headTd" width="45%">정보</td>
										<td class="headTd" width="10%">사진</td>
										<td class="headTd" width="5%">상태</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
										for (int i = 0; i < list.size(); i++) {
											MenuBean bean = list.get(i);
									%>
									<tr>
										<td><%=bean.getMenuname()%></td>
										<td><%=bean.getBrandno()%></td>
										<td><%=bean.getPrice()%></td>
										<td><div class="divInfo"><%=bean.getInfo()%></div></td>
										<td><img src="/baegopangAdmin<%=bean.getPicture()%>" width="50" height="50"></td>
										<td><button type="button" class="btn btn-sm btn-danger menuDeleteBtn">삭제</button></td>
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
												<a href="/baegopangAdmin/jsp/menu.jsp?page=<%=startPage - 1%>">
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
													<a href="/baegopangAdmin/jsp/menu.jsp?page=<%=currentPage - 1%>">
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
							 						<a href="/baegopangAdmin/jsp/menu.jsp?page=<%=i%>">
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
													<a href="/baegopangAdmin/jsp/menu.jsp?page=<%=currentPage + 1%>">
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
													<a href="/baegopangAdmin/jsp/menu.jsp?page=<%=currentPage + 1%>">
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