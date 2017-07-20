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
<!-- Resources -->
<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="https://www.amcharts.com/lib/3/serial.js"></script>
<script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
<link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
<script src="https://www.amcharts.com/lib/3/themes/none.js"></script>
<title>����� ������</title>
</head>
<script>
$(function(){
	if($("div#askCount").text()!=0){
		$("div#askCount").effect("shake",500);
		$("div#askCount").effect("shake",500);
	}
});
</script>
<body>
	<%
		String id = (String)session.getAttribute("id");
		MasterAskAdminDao maa = new MasterAskAdminDao();
	%>
  <div id="wrapper">
  
       <jsp:include page="/jsp/include/bar.jsp"/>

        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Dashboard <small>ȯ���մϴ� <%=id %>��</small>
                        </h1>
                    </div>
                </div>
                <!-- /.row -->

				<!-- ���� -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-comments fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge" id="askCount"><%=maa.askCount() %></div>
                                        <div>���ο� ����!</div>
                                    </div>
                                </div>
                            </div>
                            <a href="/baegopangAdmin/jsp/masterAskAdmin.jsp">
                                <div class="panel-footer">
                                    <span class="pull-left">���� �� ����</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
                <!-- /.row -->

				<!-- �Ϻ� �� ����� �׷��� -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-bar-chart-o fa-fw"></i> �Ϻ� �� �����</h3>
                            </div>
                            <div class="panel-body">
                               <jsp:include page="mainView/mainSalesChart.jsp"/>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.row -->

                <div class="row">
                    <div class="col-lg-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-long-arrow-right fa-fw"></i> ����</h3>
                            </div>
                            <div class="panel-body">
                               
                            </div>
                        </div>
                    </div>
                    
                    <!-- �ֱ� ��ް� ���� -->
                    <div class="col-lg-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-money fa-fw"></i> ������� �ֹ���</h3>
                            </div>
                            <div class="panel-body">
                                <jsp:include page="mainView/mainConfirmComplete.jsp"/>
                                <div class="text-right">
                                    <a href="/baegopangAdmin/jsp/orderConfirmComplete.jsp">������� �ֹ� ������ <i class="fa fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
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