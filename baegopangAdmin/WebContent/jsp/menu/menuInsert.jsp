<%@page import="gopang.bean.BrandBean"%>
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
textarea{
	resize: none;
}
</style>
<script>
	$(function() {
		$("button#insertBrand").click(function(){
			$("form#frm").submit();
		});
	})
</script>
<body>
	<%
		String id = (String) session.getAttribute("id");
		BrandDao brand = new BrandDao();
		List<BrandBean> list = brand.selectAllBrandName(); 
	%>
	
	<div id="wrapper">
		<jsp:include page="/jsp/include/bar.jsp" />

		<div id="page-wrapper">

			<div class="container-fluid">

				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">
							Menu 추가 <small>환영합니다 <%=id%>님
							</small>
						</h1>
					</div>
				</div>
				<!-- /.row -->

				<div class="row">
					<div class="col-lg-12">
						<h2>Menu Insert</h2>

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
											<form action="/baegopangAdmin/jsp/menu/menuInsertProcess.jsp" method="post" id="frm">
												<div class="col-lg-12">
													<div class="form-group">
														<select name="brandName" class="form-control" id="selectBn">
															<option value="empty" selected="selected">선택하세요</option>
															<%
																for(int i=0; i<list.size() ; i++){
																	BrandBean bean = list.get(i);
																	%>
																		<option value="<%=bean.getBrandname() %>" ><%=bean.getBrandname() %></option>
																	<%
																}
															%>
														</select>
														<p class="help-block">브랜드를 선택하세요.</p>
													</div>
												</div>
												
												<div class="col-lg-12">
													<input type="text" class="form-control" name="menuName">
													<p class="help-block">메뉴 이름을 입력하세요.</p>
												</div>
												
												<div class="col-lg-12">
													<div class="form-group">
														<input type="text" class="form-control" name="menuPrice">
														<p class="help-block">메뉴 가격을 입력하세요.</p>
													</div>
												</div>
												
												<div class="col-lg-12">
													<div class="form-group">
														<textarea rows="6" class="form-control" name="menuInfo"></textarea>
														<p class="help-block">메뉴 정보를 입력하세요.</p>
													</div>
												</div>
	
												<div class="col-lg-12">
													<div class="form-group">
														<input type="file" class="form-control" name="menuImg">
														<p class="help-block">메뉴 이미지를 추가하세요.</p>
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