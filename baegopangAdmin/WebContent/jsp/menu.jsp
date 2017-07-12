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
</style>
<script>
$(function(){
	$("button.menuDeleteBtn").click(function(){
		alert("삭제!");
	});
});
</script>
<body>
	<%
		String id = (String) session.getAttribute("id");
		MenuDao menu = new MenuDao();
		List<MenuBean> list = menu.selectAllMenu();
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
                    <div class="col-lg-12">
                        <h2>Menu List</h2>
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <td class="headTd" width="10%">메뉴이름</td>
										<td class="headTd" width="10%">브랜드번호</td>
										<td class="headTd" width="5%">가격</td>
										<td class="headTd" width="60%">정보</td>
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
										<td><%=bean.getInfo()%></td>
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

			</div>
			<!-- /.container-fluid -->

		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->
</body>
</html>