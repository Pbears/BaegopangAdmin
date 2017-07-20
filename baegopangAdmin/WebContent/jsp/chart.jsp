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
<script src ="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.3/jquery-ui.min.js"></script>


<title>배고팡 관리자</title>
</head>
<script>
$(function(){
	$.ajax({
		type:"GET",
		url : "/baegopangAdmin/chartData/monthlySalesData.jsp",
		dataType : "json",
		success : function(data) {
			alert(data);
		},
		error:function(e){  
			$("#chartdiv").html(e.responseText);
        } 
	});	
});
</script>
<style>
#chartdiv {
	width		: 100%;
	height		: 500px;
	font-size	: 11px;
}					
</style>
<body>
	<%
		String id = (String)session.getAttribute("id");
		
	%>
  <div id="wrapper">
  
       <jsp:include page="/jsp/include/bar.jsp"/>

        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Dashboard <small>환영합니다 <%=id %>님</small>
                        </h1>
                    </div>
                </div>
                <!-- /.row -->

				

				<!-- 일별 총 매출액 그래프 -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-bar-chart-o fa-fw"></i> 일별 총 매출액</h3>
                            </div>
                            <div class="panel-body">
                               <%-- <jsp:include page="chart/monthlySales.jsp"/> --%>
                              <div id="chartdiv"></div>	
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