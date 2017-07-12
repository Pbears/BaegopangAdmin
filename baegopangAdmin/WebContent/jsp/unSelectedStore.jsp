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
table{
	font-size: small;
}
div .storeInsertDiv{
	width: 100%;
	text-align: right;
}
</style>
<script>
$(function(){
	$("button#storeInsertBtn").click(function(){
		alert("추가!");
	});
	$("button.unSelectedStoreDeleteBtn").click(function(){
		alert("삭제!");
	});
});
</script>
<body>
	<%
		String id = (String) session.getAttribute("id");
		StoreDao store = new StoreDao();
		List<StoreBean> list = store.selectAllUnSelectedStore();
	%>
	<div id="wrapper">
		<jsp:include page="/jsp/include/bar.jsp"/>

		<div id="page-wrapper">

			<div class="container-fluid">

				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">
							UnSelected Store <small>환영합니다 관리자님</small>
						</h1>
					</div>
				</div>
				<!-- /.row -->
				
				<div class="row">
					<div class="col-lg-12 storeInsertDiv">
						<button type="button" class="btn btn-sm btn-primary" id="storeInsertBtn">추가</button>
					</div>
                    <div class="col-lg-12">
                        <h2>Store List</h2>
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <td class="headTd" width="10%">음식점이름</td>
                                        <td class="headTd" width="10%">브랜드번호</td>
                                        <td class="headTd" width="10%">위치</td>
                                        <td class="headTd" width="5%">평점</td>
                                        <td class="headTd" width="10%">영업시간</td>
                                        <td class="headTd" width="10%">전화번호</td>
                                        <td class="headTd" width="10%">최저배달가격</td>
                                        <td class="headTd" width="30%">정보</td>
                                        <td class="headTd" width="5%">상태</td>
                                    </tr>
                                </thead>
                                <tbody>
                                	<%
										for (int i = 0; i < list.size(); i++) {
											StoreBean bean = list.get(i);
									%>
                                    <tr>
                                        <td><%=bean.getStorename() %></td>
                                        <td><%=bean.getBrandno() %></td>
                                        <td><%=bean.getLocation() %></td>
                                        <td><%=bean.getGpa() %></td>
                                        <td><%=bean.getHours() %></td>
                                        <td><%=bean.getTel() %></td>
                                        <td><%=bean.getMinprice() %></td>
                                        <td><%=bean.getInfo() %></td>
                                        <td><button type="button" class="btn btn-sm btn-danger unSelectedStoreDeleteBtn">삭제</button></td>
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