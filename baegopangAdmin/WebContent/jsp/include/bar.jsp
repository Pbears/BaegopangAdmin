<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = (String) session.getAttribute("id");
	%>
<!-- Navigation -->
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">

	<!-- Brand and toggle get grouped for better mobile display -->
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
			<span class="sr-only">Toggle navigation</span> 
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="/baegopangAdmin/jsp/home.jsp">Baegopang Admin</a>
	</div>

	<!-- Top Menu Items -->
	<ul class="nav navbar-right top-nav">

		<!-- 메시지창 -->
		<li class="dropdown">
			<a href="#" class="dropdown-toggle" data-toggle="dropdown">
				<i class="fa fa-envelope"></i>
				<b class="caret"></b>
			</a>
			
			<ul class="dropdown-menu message-dropdown">
				<!-- 메시지 body -->
				<li class="message-preview">
					<a href="#">
						<div class="media">
							<span class="pull-left"> 
								<img class="media-object" src="http://placehold.it/50x50" alt="">
							</span>
							<div class="media-body">
								<h5 class="media-heading">
									<strong>네네치킨-역삼점 사장</strong>
								</h5>
								<p class="small text-muted">
									<i class="fa fa-clock-o"></i> Yesterday at 4:32 PM
								</p>
								<p>데헷 잘지내요 관리자님 ?</p>
							</div>
						</div>
					</a>
				</li>
				<!-- 메시지창 footer -->
				<li class="message-footer">
					<a href="#">새로운 메시지 더 보기</a>
				</li>
			</ul>
		</li>

		<!-- 알람창 -->
		<li class="dropdown">
			<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-bell"></i>
				<b class="caret"></b>
			</a>
				
			<ul class="dropdown-menu alert-dropdown">
				<!-- 알림 body -->
				<li>
					<a href="#">Alert Name 
						<span class="label label-default">Alert Badge</span>
					</a>
				</li>
				<li>
					<a href="#">Alert Name 
						<span class="label label-primary">Alert Badge</span>
					</a>
				</li>
				<li class="divider"></li>
				<li>
					<a href="#">더 보기</a>
				</li>
			</ul>
		</li>

		<!-- 내정보창 -->
		<li class="dropdown">
			<a href="#" class="dropdown-toggle" data-toggle="dropdown">
				<i class="fa fa-user"></i> <%=id%> 
				<b class="caret"></b>
			</a>
			<ul class="dropdown-menu">
				<li>
					<a href="#">
						<i class="fa fa-fw fa-power-off"></i> 로그아웃
					</a>
				</li>
			</ul>
		</li>
	</ul>

	<!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
	<div class="collapse navbar-collapse navbar-ex1-collapse">
		<ul class="nav navbar-nav side-nav">
			<li class="active">
				<a href="/baegopangAdmin/jsp/home.jsp">
					<i class="fa fa-fw fa-dashboard"></i> Dashboard
				</a>
			</li>
			<li>
				<a href="#">
					<i class="fa fa-fw fa-bar-chart-o"></i>
					Charts
				</a>
			</li>
			<li>
				<a href="#" data-toggle="collapse" data-target="#demo">
					<i class="fa fa-fw fa-table"></i> Table 
					<i class="fa fa-fw fa-caret-down"></i>
				</a>
				<ul id="demo" class="collapse">
					<li>
						<a href="/baegopangAdmin/jsp/brand.jsp">
							<i class="fa fa-fw fa-table"></i> Brand
						</a>
					</li>
					<li>
						<a href="/baegopangAdmin/jsp/master.jsp">
							<i class="fa fa-fw fa-table"></i> Master
						</a>
					</li>
					<li>
						<a href="/baegopangAdmin/jsp/masterRequest.jsp">
							<i class="fa fa-fw fa-table"></i> MasterRequest
						</a>
					</li>
					<li>
						<a href="/baegopangAdmin/jsp/member.jsp">
							<i class="fa fa-fw fa-table"></i> Member
						</a>
					</li>
					<li>
						<a href="/baegopangAdmin/jsp/menu.jsp">
							<i class="fa fa-fw fa-table"></i> Menu
						</a>
					</li>
					<li>
						<a href="/baegopangAdmin/jsp/order.jsp">
							<i class="fa fa-fw fa-table"></i> Order
						</a>
					</li>
					<li>
						<a href="/baegopangAdmin/jsp/store.jsp">
							<i class="fa fa-fw fa-table"></i> Store
						</a>
					</li>
					<li>
						<a href="/baegopangAdmin/jsp/unSelectedStore.jsp">
							<i class="fa fa-fw fa-table"></i> UnSelected Store
						</a>
					</li>
				</ul>
			</li>
			<li>
            	<a href="#">
            		<i class="fa fa-fw fa-edit"></i> Notice
            	</a>
            </li>
            <li>
				<a href="#">
					<i class="fa fa-fw fa-edit"></i> Question & Answer
				</a>
			</li>
		</ul>
	</div>
	<!-- /.navbar-collapse --> 
</nav>
</body>
</html>