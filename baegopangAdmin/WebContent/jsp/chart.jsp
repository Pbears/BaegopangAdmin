<%@page import="gopang.dao.MasterAskAdminDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/baegopangAdmin/css/bootstrap.min.css" rel="stylesheet">
<link href="/baegopangAdmin/css/sb-admin.css" rel="stylesheet">
<link href="/baegopangAdmin/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<script src="/baegopangAdmin/js/jquery.js"></script>
<script src="/baegopangAdmin/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.3/jquery-ui.min.js"></script>

<link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="https://www.amcharts.com/lib/3/serial.js"></script>
<script src="https://www.amcharts.com/lib/3/pie.js"></script>
<script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>
<title>배고팡 관리자</title>
</head>
<script>
	$(function() {
		$("button#monthly").click(function() {
			$.ajax({
				url : "chart/monthlySales.jsp",
				type : "POST",
				dataType : "html",
				beforeSend : function() {
					$("div#mainDiv").html("<div style=\"text-align:center;\"><img src=\"/baegopangAdmin/img/loading.gif\" width=\"50\" height=\"50\"/></div>");
				},
				success : function(data) {
					$("div#mainDiv").html(data);
				},
				error : function(request, status, error) {
					alert("code:" + request.status
							+ "\n" + "message:"
							+ request.responseText
							+ "\n" + "error:" + error);
				}
			});
		});
		$("button#weekly").click(function() {
			$.ajax({
				url : "chart/weeklySales.jsp",
				type : "POST",
				dataType : "html",
				beforeSend : function() {
					$("div#mainDiv").html("<div style=\"text-align:center;\"><img src=\"/baegopangAdmin/img/loading.gif\" width=\"50\" height=\"50\"/></div>");
				},
				success : function(data) {
					$("div#mainDiv").html(data);
				},
				error : function(request, status, error) {
					alert("code:" + request.status
							+ "\n" + "message:"
							+ request.responseText
							+ "\n" + "error:" + error);
				}
			});
		});
		$("button#genderly").click(function() {
			$.ajax({
				url : "chart/genderSales.jsp",
				type : "POST",
				dataType : "html",
				beforeSend : function() {
					$("div#mainDiv").html("<div style=\"text-align:center;\"><img src=\"/baegopangAdmin/img/loading.gif\" width=\"50\" height=\"50\"/></div>");
				},
				success : function(data) {
					$("div#mainDiv").html(data);
				},
				error : function(request, status, error) {
					alert("code:" + request.status
							+ "\n" + "message:"
							+ request.responseText
							+ "\n" + "error:" + error);
				}
			});
		});
	});
</script>
<body>
	<%
		String id = (String) session.getAttribute("id");
	%>
	<div id="wrapper">

		<jsp:include page="/jsp/include/bar.jsp" />

		<div id="page-wrapper">

			<div class="container-fluid">

				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">
							Dashboard <small>환영합니다 <%=id%>님
							</small>
						</h1>
					</div>
				</div>
				<!-- /.row -->

				<div class="row">
					<div class="col-lg-12">
						<button type="button" class="btn btn-default" id="monthly">연매출액</button>
						<button type="button" class="btn btn-default" id="weekly">요일별매출액</button>
						<button type="button" class="btn btn-default" id="genderly">성별별매출액</button>
					</div>
				</div>
				
				<br>
				
				<!-- 일별 총 매출액 그래프 -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">
									<i class="fa fa-bar-chart-o fa-fw"></i> chart
								</h3>
							</div>
							<div class="panel-body" id="mainDiv">
								
							</div>
						</div>
					</div>
				</div>
				<!-- /.row -->



			</div>
			<!-- /.row -->

		</div>
		<!-- /.container-fluid -->

	</div>
	<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->
</body>
</html>