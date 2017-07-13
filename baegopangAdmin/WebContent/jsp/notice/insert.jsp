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
div.innerDiv {
	width: 60%;
	margin: 0 auto;
}
div.innerInnerDiv {
	padding: 20px;
}
textarea {
	resize: none;
}
</style>
<script>
	$(function() {
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
							공지사항 <small>환영합니다 <%=id%></small>
						</h1>
					</div>
				</div>
				<!-- /.row -->

				<div class="row">
					<form action="/baegopangAdmin/jsp/notice/insertProcess.jsp" method="post" name="insertFrm">
						<div class="innerDiv">
							<div class="form-group innerInnerDiv col-lg-12">
								<h2>공지사항 등록하기</h2>
							</div>

							<div class="form-group innerInnerDiv">
								<label>제목</label> <input class="form-control" name="title">
							</div>

							<div class="form-group innerInnerDiv">
								<label>내용</label>
								<textarea class="form-control" rows="25" name="info"></textarea>
							</div>

							<div class="form-group innerInnerDiv">
								<button type="submit" class="btn btn-default">등록</button>
								<button type="reset" class="btn btn-primary">취소</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			<!-- /.container-fluid -->

		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->
</body>
</html>