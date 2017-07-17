<%@page import="gopang.dao.BrandDao"%>
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
div#innerDiv {
	width: 50%;
	margin: 0 auto;
}
</style>
<script>
	$(function() {
		$("button#insertBrand").click(function(){
			$("form#frm").submit();
		});
		$("select#selectBn").change(function(){
			alert("새창띄우기!");
		});
	})
</script>
<body>
	<%
		String id = (String) session.getAttribute("id");
		BrandDao brand = new BrandDao();
		List<String> list = brand.selectAllBrandNo();
	%>
	
	<div id="wrapper">
		<jsp:include page="/jsp/include/bar.jsp" />

		<div id="page-wrapper">

			<div class="container-fluid">

				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">
							Brand 추가 <small>환영합니다 <%=id%>님
							</small>
						</h1>
					</div>
				</div>
				<!-- /.row -->

				<div class="row">
					<div class="col-lg-12">
						<h2>Brand Insert</h2>

						<div class="row">
							<div class="col-lg-12">
								<div class="panel panel-default">
									<div class="panel-heading">
										<h3 class="panel-title">
											<i class="fa fa-long-arrow-right fa-fw"></i> 종류
										</h3>
									</div>
									<div class="panel-body">
										<div id="innerDiv">
											<form action="/baegopangAdmin/jsp/brand/brandProcess.jsp" method="post" id="frm">
												<div class="col-lg-12">
													<div class="form-group">
														<select name="brandNo" class="form-control" id="selectBn">
															<option value="empty" selected="selected">선택하세요</option>
															<option value="10">치킨</option>
															<option value="20">중국집</option>
															<option value="30">피자</option>
															<option value="40">분식</option>
															<option value="50">족발/보쌈</option>
															<option value="60">찜닭</option>
															<option value="70">일식</option>
															<option value="80">도시락</option>
															<option value="90">페스트푸드</option>
														</select>
													</div>
												</div>
												<div class="col-lg-12">
													<input type="text" class="form-control" name="brandName">
													<p class="help-block">브랜드 이름을 입력하세요.</p>
												</div>
	
												<div class="col-lg-12">
													<div class="form-group">
														<label>브랜드 이미지를 추가하세요.</label>
														<input type="file" class="form-control" name="brandImg">
													</div>
												</div>
												
												<div class="col-lg-12">
													<button type="button" class="btn btn-sm btn-primary" id="insertBrand">추가</button>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
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